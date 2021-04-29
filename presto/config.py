import configparser, os, re, pathlib, yaml, cctk, h5py, logging
import numpy as np
import presto

logger = logging.getLogger(__name__)

#### OVERALL PRESTO CONFIGURATION, RUNS ON STARTUP

MAX_QC_ATTEMPTS = 50
QC_TOL = 0.05

# this module loads the configuration file
CONFIGURATION_FILE = "presto.config"
if not os.path.isfile(CONFIGURATION_FILE):
    if "PRESTO_CONFIG" in os.environ:
        CONFIGURATION_FILE = os.environ["PRESTO_CONFIG"]
    else:
        raise ValueError(f"Fatal error: presto configuration file '{CONFIGURATION_FILE}' not found in current directory and $PRESTO_CONFIG not found")

config = configparser.ConfigParser()
config.read(CONFIGURATION_FILE)

# auto-populate some directory names
PRESTO_STARTUP_DIRECTORY = os.getcwd()
USER_HOME_DIRECTORY = str(pathlib.Path.home())
def resolve_directory(directory):
    directory = re.sub("@presto", PRESTO_STARTUP_DIRECTORY, directory)
    directory = re.sub("~", USER_HOME_DIRECTORY, directory)
    return directory

def check_directory(field_name, directory):
    """ Checks if a directory exists."""
    directory_exists = os.path.isdir(directory)
    if not directory_exists:
        logger.error(f"Error in configuration entry for {field_name}: directory {directory} does not exist.")

XTB_PATH = config['xtb']['XTB_PATH']
if XTB_PATH.lower() == "@auto":
    CONDA_PATH = os.getenv('CONDA_PREFIX')
    assert CONDA_PATH is not None, "Could not get a value for CONDA_PATH when trying to autodetect XTBPATH. Aborting. (Do you have the environment activated?)"
    XTB_PATH = f"{CONDA_PATH}/share/xtb"
else:
    XTB_PATH = resolve_directory(config['xtb']['XTB_PATH'])
check_directory("XTB_PATH",XTB_PATH)

# load execs - will be run during Calculator.__init__()
XTB_EXEC = config['xtb']['XTB_EXEC']
G16_EXEC = config['gaussian']['GAUSSIAN_EXEC']
logger.info(f"Loaded configuration data from {CONFIGURATION_FILE}.")

#### JOB-SPECIFIC CONFIGURATION

def build(file, checkpoint, geometry=None, oldchk=None, oldchk_idx=-1, **args):
    """
    Build a *presto* trajectory from a ``.yml`` config file.

    The config file does not specify the actual structure (geometry and atomic numbers). This can come from one of two sources:
    1. An existing ``presto`` trajectory saved as an ``.chk`` file.
    2. An ``.xyz`` file.

    Args:
        file (str): path to config ``yaml`` file
        checkpoint (str): path to checkpoint file for this run
        geometry (str): path to geometry ``.xyz`` file
        oldchk (str): path to checkpoint file for previous run
        oldchk_idx (int): which frame from ``oldchk`` to use as starting point
    """
    assert isinstance(file, str), "``file`` must be a string."
    assert isinstance(checkpoint, str), "``checkpoint`` must be a string."

    settings = dict()
    with open(file, "r+") as f:
        settings = yaml.safe_load(f)

    assert "timestep" in settings, "Need `timestep` in config YAML file."
    assert isinstance(settings["timestep"], (float, int)), "`timestep` must be numeric."
    args["timestep"] = settings["timestep"]

    assert "integrator" in settings, "Need `integrator` in config YAML file."
    assert "calculator" in settings, "Need `calculator` in config YAML file."
    assert "type" in settings, "Need `type` in config YAML file."

    if "active_atoms" in settings:
        args["active_atoms"] = parse_atom_list(settings["active_atoms"])
    elif "inactive_atoms" in settings:
        args["inactive_atoms"] = parse_atom_list(settings["inactive_atoms"])
    else:
        args["inactive_atoms"] = list()

    if "high_atoms" in settings:
        args["high_atoms"] = parse_atom_list(settings["high_atoms"])
    else:
        args["high_atoms"] = None

    assert "stop_time" in settings, "Need `stop_time` in config YAML file."
    assert isinstance(settings["stop_time"], int), "`stop_time` must be an integer."
    args["stop_time"] = settings["stop_time"]

    if "save_interval" in settings:
        assert isinstance(settings["save_interval"], int) and settings["save_interval"] > 0, "`save_interval` must be positive integer"
        args["save_interval"] = settings["save_interval"]

    if "forwards" in settings:
        args["forwards"] = settings["forwards"]

    p = None
    if "potential" in settings:
        p = presto.potentials.build_potential(settings["potential"])

    constraints = list()
    if "constraints" in settings:
        constraints = presto.constraints.build_constraints(settings["constraints"])

    if "anchor" in settings:
        assert isinstance(settings["anchor"], int), "``anchor`` must be an atomic number!"
        constraints.insert(0, presto.constraints.Anchor(settings["anchor"]))

    i = presto.integrators.build_integrator(settings["integrator"], potential=p)
    c = presto.calculators.build_calculator(settings["calculator"], checkpoint, constraints=constraints)

    args["checkpoint_filename"] = checkpoint
    assert isinstance(settings["type"], str), "`type` must be a string"
    if settings["type"].lower() == "equilibration":
        mol, x, v, a = None, None, None, None
        if not os.path.exists(checkpoint):
            if geometry is not None:
                assert isinstance(geometry, str), "``geometry``must be a string!"
                assert re.search("xyz$", geometry), "``geometry`` must be a path to an ``.xyz`` file!"
                mol = cctk.XYZFile.read_file(geometry).molecule
                args["atomic_numbers"] = mol.atomic_numbers
                x = mol.geometry

            elif oldchk is not None:
                assert os.path.exists(oldchk), f"Can't locate checkpoint file at {oldchk}!"
                with h5py.File(oldchk, "r") as h5:
                    args["atomic_numbers"] = h5.attrs["atomic_numbers"].view(cctk.OneIndexedArray)
                    x = h5.get("all_positions")[oldchk_idx].view(cctk.OneIndexedArray)
                    v = h5.get("all_velocities")[oldchk_idx].view(cctk.OneIndexedArray)
                    a = h5.get("all_accelerations")[oldchk_idx].view(cctk.OneIndexedArray)
            else:
                raise ValueError("No checkpoint file; need a geometry ``.xyz`` file or old checkpoint file for this to work!")

        assert "bath_scheduler" in settings, "Need `bath_scheduler` in config YAML file for type=`equilibration`!"
        s = build_bath_scheduler(settings["bath_scheduler"])

        t = presto.trajectory.EquilibrationTrajectory(
            calculator=c,
            integrator=i,
            bath_scheduler=s,
            **args,
        )

        if len(t.frames) == 0:
            t.initialize(x, velocities=v, accelerations=a)

        return t

    if settings["type"].lower() == "reaction":
        if not os.path.exists(checkpoint):
            x, v, a, temp = None, None, None, None
            if "quasiclassical" in settings:
                assert "output_file" in settings["quasiclassical"], f"Need Gaussian output file for quasiclassical initialization!"
                assert os.path.exists(settings["quasiclassical"]["output_file"]), f"Need Gaussian output file for quasiclassical initialization!"

                assert "temperature" in settings["quasiclassical"], "Need temperature for quasiclassical initialization"
                temp = settings["quasiclassical"]["temperature"]
                assert isinstance(temp, (int, float)), "Temperature must be numeric!"

                # thermal excitations using quantum harmonic oscillator. see cctk/quasiclassical.py for details
                for idx in range(MAX_QC_ATTEMPTS):
                    qcf = cctk.GaussianFile.read_file(settings["quasiclassical"]["output_file"])
                    mol = qcf.get_molecule()
                    excited, expected_PE, _, velocities = cctk.quasiclassical.get_quasiclassical_perturbation(mol, return_velocities=True)

                    # check that we're close to expected additional PE, and that our perturbation hasn't done anything wild.
                    # if so we just try again.
                    actual_PE, _ = c.evaluate(mol.atomic_numbers, excited.geometry, args["high_atoms"])
                    extra_PE = (actual_PE - qcf.ensemble[-1, "energy"]) * presto.constants.KCAL_PER_HARTREE
                    diff = abs(expected_PE - extra_PE)
                    if (diff < (QC_TOL * expected_PE)):
                        args["atomic_numbers"] = mol.atomic_numbers
                        x = excited.geometry
                        v = velocities
                        a = np.zeros_like(v.view(np.ndarray)).view(cctk.OneIndexedArray)
                        break
                    else:
                        logger.error(f"Error initializing trajectory -- attempt {idx}/{MAX_QC_ATTEMPTS}")

                    if idx == MAX_QC_ATTEMPTS - 1:
                        logger.error("Could not initialize!")
                        return None

            else:
                assert os.path.exists(oldchk), f"Need old checkpoint file for reaction trajectory!"
                with h5py.File(oldchk, "r") as h5:
                    atomic_numbers = h5.attrs["atomic_numbers"]
                    x = h5.get("all_positions")[oldchk_idx].view(cctk.OneIndexedArray)
                    v = h5.get("all_velocities")[oldchk_idx].view(cctk.OneIndexedArray)
                    a = h5.get("all_accelerations")[oldchk_idx].view(cctk.OneIndexedArray)
                    temp = h5.get("bath_temperatures")[oldchk_idx]

                    args["atomic_numbers"] = atomic_numbers.view(cctk.OneIndexedArray)

        assert "termination_function" in settings, "Need `termination_function` in config YAML file for type=`reaction`!"
        f = build_termination_function(settings["termination_function"])

        if "time_after_finished" in settings:
            assert isinstance(settings["time_after_finished"], (float, int)), "Need `time_after_finished` to be numeric!"
            args["time_after_finished"] = settings["time_after_finished"]

        t = presto.trajectory.ReactionTrajectory(
            calculator=c,
            integrator=i,
            termination_function=f,
            **args,
        )

        if not os.path.exists(checkpoint):
            t.initialize(positions=x, velocities=v, accelerations=a, bath_temp=temp)

        assert len(t.frames) > 0, "reaction trajectory needs a frame to start from!"
        return t

def build_bath_scheduler(settings):
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for bath scheduler"
    assert isinstance(settings["type"], str), "Bath scheduler `type` must be a string"

    if settings["type"].lower() == "linear":
        assert "start_temp" in settings, "Need `start_temp` for this bath scheduler!"
        assert isinstance(settings["start_temp"], (float, int)), "`start_temp` must be numeric!"
        assert settings["start_temp"] > 0, "`start_temp` must be positive!"

        assert "target_temp" in settings, "Need `target_temp` for this bath scheduler!"
        assert isinstance(settings["target_temp"], (float, int)), "`target_temp` must be numeric!"
        assert settings["target_temp"] > 0, "`target_temp` must be positive!"

        assert "target_time" in settings, "Need `target_time` for this bath scheduler!"
        assert isinstance(settings["target_time"], (float, int)), "`target_time` must be numeric!"
        assert settings["target_time"] > 0, "`target_time` must be positive!"

        delta = settings["start_temp"] - settings["target_temp"]

        def sched(time):
            if time > settings["target_time"]:
                return settings["target_temp"]
            else:
                return settings["target_temp"] + delta * (1 - time / settings["target_time"])

        return sched

    elif settings["type"].lower() == "constant":
        assert "target_temp" in settings, "Need `target_temp` for this bath scheduler!"
        assert isinstance(settings["target_temp"], (float, int)), "`target_temp` must be numeric!"
        assert settings["target_temp"] > 0, "`target_temp` must be positive!"

        def sched(time):
            return settings["target_temp"]

        return sched

    else:
        raise ValueError(f"Unknown bath scheduler type {settings['type']}! Allowed options are `linear` or `constant`.")

def parse_atom_list(string):
    atoms = []
    for item in string.split(", "):
        try:
            if re.search("-", item):
                start, stop = item.split("-")
                atoms = atoms + list(range(int(start), int(stop) + 1))
            else:
                atoms.append(int(item))
        except Exception as e:
            raise ValueError(f"Error parsing list item {item} - needs to be integers (3) or ranges (4-7).")
    return np.array(list(set(atoms))) # keep only distinct atoms

def build_termination_function(settings):
    def term(frame):
        m = frame.molecule().assign_connectivity()
        for name, row in settings.items():
            exit_code = 1
            if re.search("r$", name):
                exit_code = 2

            words = list(filter(None, row.split(" ")))
            if words[0] == "bond":
                assert len(words) == 3, f"Termination condition ``bond`` must be of form ``bond atom1 atom2`` -- {row} is invalid!"
                if m.get_bond_order(int(words[1]), int(words[2])):
                    return exit_code
            elif words[0] == "distance":
                assert len(words) == 5, f"Termination condition ``bond`` must be of form ``bond atom1 atom2 [greater_than/less_than] value`` -- {row} is invalid!"
                if words[3] == "greater_than":
                    if m.get_distance(int(words[1]), int(words[2])) > float(words[4]):
                        return exit_code
                elif words[3] == "less_than":
                    if m.get_distance(int(words[1]), int(words[2])) < float(words[4]):
                        return exit_code
                else:
                    raise ValueError(f"Invalid operator {words[3]} -- must be ``greater_than`` or ``less_than``")
            else:
                raise ValueError(f"Invalid constraint type {words[0]} -- must be ``bond`` or ``distance``")
        return False

    return term

