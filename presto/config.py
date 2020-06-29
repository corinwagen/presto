import configparser, os, re, pathlib, yaml, cctk
import numpy as np
import presto

#### OVERALL PRESTO CONFIGURATION

# this module loads the configuration file
CONFIGURATION_FILE = "presto.config"
assert os.path.isfile(CONFIGURATION_FILE), f"Fatal error: presto configuration file '{CONFIGURATION_FILE}' not found!"
config = configparser.ConfigParser()
config.read(CONFIGURATION_FILE)

# auto-populate some directory names
PRESTO_STARTUP_DIRECTORY = os.getcwd()
USER_HOME_DIRECTORY = str(pathlib.Path.home())
def resolve_directory(directory):
    directory = re.sub("@presto", PRESTO_STARTUP_DIRECTORY, directory)
    directory = re.sub("~", USER_HOME_DIRECTORY, directory)
    return directory

# checks if a directory exists
def check_directory(field_name, directory):
    directory_exists = os.path.isdir(directory)
    if not directory_exists:
        print(f"Error in configuration entry for {field_name}: directory {directory} does not exist.")
        exit()

# check configuration parameters
GAUSSIAN_SCRIPT_DIRECTORY = resolve_directory(config['gaussian']['GAUSSIAN_SCRIPT_DIRECTORY'])
check_directory("GAUSSIAN_SCRIPT_DIRECTORY", GAUSSIAN_SCRIPT_DIRECTORY)

XTB_SCRIPT_DIRECTORY = resolve_directory(config['xtb']['XTB_SCRIPT_DIRECTORY'])
check_directory("XTB_SCRIPT_DIRECTORY", XTB_SCRIPT_DIRECTORY)

XTB_PATH = config['xtb']['XTB_PATH']
if XTB_PATH.lower() == "@auto":
    CONDA_PATH = os.getenv('CONDA_PREFIX')
    assert CONDA_PATH is not None, "Could not get a value for CONDA_PATH when trying to autodetect XTBPATH.  Aborting."
    XTB_PATH = f"{CONDA_PATH}/share/xtb"
else:
    XTB_PATH = resolve_directory(config['xtb']['XTB_PATH'])
check_directory("XTB_PATH",XTB_PATH)

# finished
print(f"Loaded configuration data from {CONFIGURATION_FILE}.")

#### JOB-SPECIFIC CONFIGURATION

def build(file, checkpoint, geometry=None, **args):
    """
    Build a *presto* trajectory from a ``.yml`` config file.

    The config file does not specify the actual structure (geometry and atomic numbers). This can come from one of two sources:
    1. An existing ``presto`` trajectory saved as an ``.hdf5`` file.
    2. An ``.xyz`` file.
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

    if "high_atoms" in settings:
        args["high_atoms"] = parse_atom_list(settings["high_atoms"])

    assert "stop_time" in settings, "Need `stop_time` in config YAML file."
    assert isinstance(settings["stop_time"], int), "`stop_time` must be an integer."
    args["stop_time"] = settings["stop_time"]

    p = None
    if "potential" in settings:
        p = build_potential(settings["potential"])

    i = build_integrator(settings["integrator"], potential=p)
    c = build_calculator(settings["calculator"])

    mol = None
    args["checkpoint_filename"] = checkpoint
    if geometry is not None:
        assert isinstance(geometry, str), "``geometry``must be a string!"
        assert re.search("xyz$", geometry), "``geometry`` must be a path to an ``.xyz`` file!"

        mol = cctk.XYZFile.read_file(geometry).molecule
        if not os.path.exists(checkpoint):
            args["atomic_numbers"] = mol.atomic_numbers
    else:
        assert os.path.exists(checkpoint), "No checkpoint file; need a geometry ``.xyz`` file for this to work!"

    assert isinstance(settings["type"], str), "`type` must be a string"
    if settings["type"].lower() == "equilibration":
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
            print("initializing")
            t.initialize(mol.geometry)
            print(t)

        return t

    if settings["type"].lower() == "reaction":
        assert "termination_function" in settings, "Need `termination_function` in config YAML file for type=`reaction`!"
        f = build_termination_function(settings["termination_function"])

        t = presto.trajectory.ReactionTrajectory(
            calculator=c,
            integrator=i,
            termination_function=f,
            **args,
        )

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

def build_calculator(settings):
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for calculator"
    assert isinstance(settings["type"], str), "Calculator `type` must be a string"

    if settings["type"].lower() == "oniom":
        assert "high_calculator" in settings, "Need `high_calculator` settings dictionary for ONIOM!"
        assert "low_calculator" in settings, "Need `low_calculator` settings dictionary for ONIOM!"
        return presto.calculators.ONIOMCalculator(
            high_calculator=build_calculator(settings["high_calculator"]),
            low_calculator=build_calculator(settings["low_calculator"]),
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
            return presto.calculators.GaussianCalculator(charge=charge, multiplicity=multiplicity, link0=link0, route_card=settings["route_card"], footer=footer)
        else:
            return presto.calculators.GaussianCalculator(charge=charge, multiplicity=multiplicity, route_card=settings["route_card"], footer=footer)

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
            assert settings["gfn"] in [0, 1, 2], "Calculator `gfn` must be 0, 1, or 2."
            gfn = settings["gfn"]

        parallel = 1
        if "parallel" in settings:
            assert isinstance(settings["parallel"], int), "Calculator `parallel` must be an integer."
            assert settings["parallel"] > 0, "Calculator `parallel` must be positive."
            parallel = settings["parallel"]

        return presto.calculators.XTBCalculator(charge=charge, multiplicity=multiplicity, gfn=gfn, parallel=parallel)

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
    constraints = list(settings.keys())

    def term(frame):
        m = frame.molecule().assign_connectivity()
        for row in constraints:
            words = list(filter(None, row.split(" ")))
            if words[0] == "bond":
                assert len(words) == 3, f"Termination condition ``bond`` must be of form ``bond atom1 atom2`` -- {row} is invalid!"
                if m.get_bond_order(words[1], words[2]):
                    return True
            elif words[0] == "distance":
                assert len(words) == 5, f"Termination condition ``bond`` must be of form ``bond atom1 atom2 [greater_than/less_than] value`` -- {row} is invalid!"
                if words[3] == "greater_than":
                    if m.get_distance(words[1], words[2]) > words[4]:
                        return True
                elif words[3] == "less_than":
                    if m.get_distance(words[1], words[2]) < words[4]:
                        return True
                else:
                    raise ValueError(f"Invalid operator {words[3]} -- must be ``greater_than`` or ``less_than``")
            else:
                raise ValueError(f"Invalid constraint type {words[0]} -- must be ``bond`` or ``distance``")
        return False

    return term
