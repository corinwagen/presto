import configparser, os, re, pathlib, yaml, cctk, h5py, logging
import numpy as np
import presto

logger = logging.getLogger(__name__)

#### OVERALL PRESTO CONFIGURATION, RUNS ON STARTUP

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

# check configuration parameters
GAUSSIAN_SCRIPT_DIRECTORY = resolve_directory(config['gaussian']['GAUSSIAN_SCRIPT_DIRECTORY'])
check_directory("GAUSSIAN_SCRIPT_DIRECTORY", GAUSSIAN_SCRIPT_DIRECTORY)
XTB_SCRIPT_DIRECTORY = resolve_directory(config['xtb']['XTB_SCRIPT_DIRECTORY'])
check_directory("XTB_SCRIPT_DIRECTORY", XTB_SCRIPT_DIRECTORY)

XTB_PATH = config['xtb']['XTB_PATH']
if XTB_PATH.lower() == "@auto":
    CONDA_PATH = os.getenv('CONDA_PREFIX')
    assert CONDA_PATH is not None, "Could not get a value for CONDA_PATH when trying to autodetect XTBPATH. Aborting. (Do you have the environment activated?)"
    XTB_PATH = f"{CONDA_PATH}/share/xtb"
else:
    XTB_PATH = resolve_directory(config['xtb']['XTB_PATH'])
check_directory("XTB_PATH",XTB_PATH)

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

    p = None
    if "potential" in settings:
        p = build_potential(settings["potential"])

    constraints = list()
    if "constraints" in settings:
        constraints = build_constraints(settings["constraints"])

    if "anchor" in settings:
        assert isinstance(settings["anchor"], int), "``anchor`` must be an atomic number!"
        constraints.insert(0, presto.constraint.Anchor(settings["anchor"]))

    i = build_integrator(settings["integrator"], potential=p)
    c = build_calculator(settings["calculator"], constraints=constraints)

    args["checkpoint_filename"] = checkpoint
    assert isinstance(settings["type"], str), "`type` must be a string"
    if settings["type"].lower() == "equilibration":
        mol = None
        if not os.path.exists(checkpoint):
            if geometry is not None:
                assert isinstance(geometry, str), "``geometry``must be a string!"
                assert re.search("xyz$", geometry), "``geometry`` must be a path to an ``.xyz`` file!"
                mol = cctk.XYZFile.read_file(geometry).molecule
                args["atomic_numbers"] = mol.atomic_numbers

            elif oldchk is not None:
                assert os.path.exists(oldchk), f"Can't locate checkpoint file at {oldchk}!"
                with h5py.File(oldchk, "r") as h5:
                    atomic_numbers = h5.attrs["atomic_numbers"]
                    positions = h5.get("all_positions")[oldchk_idx]
                    mol = cctk.Molecule(atomic_numbers, positions)
                    args["atomic_numbers"] = mol.atomic_numbers
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
            assert mol is not None, "need geometry, since there are no frames"
            t.initialize(mol.geometry)

        return t

    if settings["type"].lower() == "reaction":
        if not os.path.exists(checkpoint):
            assert os.path.exists(oldchk), f"Need old checkpoint file for reaction trajectory!"

            x, v, a, temp = None, None, None, None
            with h5py.File(oldchk, "r") as h5:
                atomic_numbers = h5.attrs["atomic_numbers"]
                x = h5.get("all_positions")[oldchk_idx]
                v = h5.get("all_velocities")[oldchk_idx]
                a = h5.get("all_accelerations")[oldchk_idx]
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
            t.initialize(positions=x.view(cctk.OneIndexedArray), velocities=v.view(cctk.OneIndexedArray), accelerations=a.view(cctk.OneIndexedArray), bath_temp=temp)

        assert len(t.frames) > 0, "reaction trajectory needs a frame to start from!"
        return t

def build_integrator(settings, potential=None):
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for integrator"
    assert isinstance(settings["type"], str), "Integrator `type` must be a string"

    if settings["type"].lower() == "verlet":
        return presto.integrators.VelocityVerletIntegrator()
    elif settings["type"].lower() == "langevin":
        assert "viscosity" in settings, "Need `viscosity` for Langevin integrator!"
        assert isinstance(settings["viscosity"], (int, float)), "Integrator `radius` must be numeric."

        radius = 0
        if "radius" in settings:
            assert isinstance(settings["radius"], (int, float)), "Integrator `radius` must be numeric."
            radius = settings["radius"]

        return presto.integrators.LangevinIntegrator(settings["viscosity"], radius=radius, potential=potential)
    else:
        raise ValueError(f"Unknown integrator type {settings['type']}! Allowed options are `verlet` or `langevin`.")

def build_calculator(settings, constraints=list()):
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for calculator"
    assert isinstance(settings["type"], str), "Calculator `type` must be a string"

    if settings["type"].lower() == "oniom":
        assert "high_calculator" in settings, "Need `high_calculator` settings dictionary for ONIOM!"
        assert "low_calculator" in settings, "Need `low_calculator` settings dictionary for ONIOM!"
        return presto.calculators.ONIOMCalculator(
            high_calculator=build_calculator(settings["high_calculator"]),
            low_calculator=build_calculator(settings["low_calculator"]),
            constraints=constraints,
        )
    elif settings["type"].lower() == "gaussian":
        charge = 0
        if "charge" in settings:
            assert isinstance(settings["charge"], int), "Calculator `charge` must be an integer."
            charge = settings["charge"]

        multiplicity = 1
        if "multiplicity" in settings:
            assert isinstance(settings["multiplicity"], int), "Calculator `multiplicity` must be an integer."
            assert settings["multiplicity"] > 0, "Calculator `multiplicity` must be positive."
            multiplicity = settings["multiplicity"]

        link0 = None
        if "link0" in settings:
            assert isinstance(settings["link0"], dict), "Calculator `link0` must be a dictionary."
            link0 = settings["link0"]

        assert "route_card" in settings, "Need a route card for `GaussianCalculator`!"
        assert isinstance(settings["route_card"], str), "Calculator `route_card` must be a string."
        assert re.search("#p", settings["route_card"]), "Need `#p` in route card!"
        assert re.search("force", settings["route_card"]), "Need `force` in route card!"

        footer = None
        if "footer" in settings:
            assert isinstance(settings["footer"], str), "Calculator `footer` must be string or `None`."
            footer = settings["footer"]

        if link0 is not None:
            return presto.calculators.GaussianCalculator(charge=charge, multiplicity=multiplicity, link0=link0, route_card=settings["route_card"], footer=footer, constraints=constraints)
        else:
            return presto.calculators.GaussianCalculator(charge=charge, multiplicity=multiplicity, route_card=settings["route_card"], footer=footer, constraints=constraints)

    elif settings["type"].lower() == "xtb":
        charge = 0
        if "charge" in settings:
            assert isinstance(settings["charge"], int), "Calculator `charge` must be an integer."
            charge = settings["charge"]

        multiplicity = 1
        if "multiplicity" in settings:
            assert isinstance(settings["multiplicity"], int), "Calculator `multiplicity` must be an integer."
            assert settings["multiplicity"] > 0, "Calculator `multiplicity` must be positive."
            charge = settings["multiplicity"]

        gfn = 2
        if "gfn" in settings:
            assert settings["gfn"] in [0, 1, 2, "ff"], "Calculator `gfn` must be 0, 1, 2, or ``ff``."
            gfn = settings["gfn"]

        parallel = 1
        if "parallel" in settings:
            assert isinstance(settings["parallel"], int), "Calculator `parallel` must be an integer."
            assert settings["parallel"] > 0, "Calculator `parallel` must be positive."
            parallel = settings["parallel"]

        return presto.calculators.XTBCalculator(charge=charge, multiplicity=multiplicity, gfn=gfn, parallel=parallel, constraints=constraints)

    else:
        raise ValueError(f"Unknown integrator type {settings['type']}! Allowed options are `oniom`, `xtb`, or `gaussian`.")

def build_potential(settings):
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for potential"
    assert isinstance(settings["type"], str), "Potential `type` must be a string"

    if settings["type"].lower() == "spherical_harmonic":
        assert "radius" in settings, "Need `radius` for spherical harmonic potential."
        assert isinstance(settings["radius"], (int, float)), "`radius` must be numeric!"
        assert settings["radius"] > 0, "`radius` must be positive!"

        if "force_constant" in settings:
            assert isinstance(settings["force_constant"], (int, float)), "`force_constant` must be numeric!"
            assert settings["force_constant"] > 0, "`force_constant` must be positive!"
            return presto.integrators.spherical_harmonic_potential(radius=settings["radius"], force_constant=settings["force_constant"])
        else:
            return presto.integrators.spherical_harmonic_potential(radius=settings["radius"])

    else:
        raise ValueError(f"Unknown potential type {settings['type']}! Allowed options are `spherical_harmonic` (free will is an illusion).")

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

def build_constraints(settings):
    constraints = list()
    for row in list(settings.values()):
        assert "atom1" in row, "need ``atom1`` defined for constraint!"
        assert isinstance(row["atom1"], (int, list)), "``atom1`` must be integer or list of integers!"
        assert "atom2" in row, "need ``atom2`` defined for constraint!"
        assert isinstance(row["atom2"], (int, list)), "``atom2`` must be integer or list of integers!"
        assert "equilibrium" in row, "need equilibrium distance ``equilibrium`` defined for constraint!"
        assert isinstance(row["equilibrium"], (int, float)), "``equilibrium`` must be numeric!"

        args = {"atom1": row["atom1"], "atom2": row["atom2"], "equilibrium": row["equilibrium"]}

        if "power" in row:
            assert isinstance(row["power"], int), "``power`` must be integer!"
            args["power" ] = row["power"]

        if "force_constant" in row:
            assert isinstance(row["force_constant"], (int, float)), "``force_constant`` must be numeric"
            args["force_constant"] = row["force_constant"]

        constraints.append(presto.constraint.PairwisePolynomialConstraint(**args))
    return constraints


