import configparser, os, re, pathlib, yaml, cctk, h5py, logging, copy
import numpy as np
import presto

logger = logging.getLogger(__name__)

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

    settings = dict()
    with open(file, "r+") as f:
        settings = yaml.safe_load(f)

    return build_from_dict(settings, checkpoint=checkpoint, geometry=geometry, oldchk=oldchk, oldchk_idx=-1, **args)

def build_from_dict(settings, checkpoint, geometry=None, oldchk=None, oldchk_idx=-1, **args):
    """
    Same as above method, but substituting a dictionary for the ``.yaml`` file.
    """
    assert isinstance(checkpoint, str), "``checkpoint`` must be a string."
    assert "timestep" in settings, "Need `timestep` in config YAML file."
    assert isinstance(settings["timestep"], (float, int)), "`timestep` must be numeric."
    args["timestep"] = settings["timestep"]

    assert "integrator" in settings, "Need `integrator` in config YAML file."
    assert "calculator" in settings, "Need `calculator` in config YAML file."
#    assert "type" in settings, "Need `type` in config YAML file."

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

    if "checkpoint_interval" in settings:
        assert isinstance(settings["checkpoint_interval"], int) and settings["checkpoint_interval"] > 0, "`checkpoint_interval` must be positive integer"
        args["checkpoint_interval"] = settings["checkpoint_interval"]

    if "forwards" in settings:
        args["forwards"] = settings["forwards"]

    p = None
    if "potential" in settings:
        p = presto.potentials.build_potential(settings["potential"])

    constraints = list()
    if "constraints" in settings:
        constraints = presto.constraints.build_constraints(settings["constraints"])

    checks = list()
    if "checks" in settings:
        checks = presto.checks.build_checks(settings["checks"])

    if "anchor" in settings:
        assert isinstance(settings["anchor"], int), "``anchor`` must be an atomic number!"
        constraints.insert(0, presto.constraints.Anchor(settings["anchor"]))

    i = presto.integrators.build_integrator(settings["integrator"])
    c = presto.calculators.build_calculator(settings["calculator"], checkpoint, constraints=constraints, potential=p)

    args["checkpoint_filename"] = checkpoint

    mol, x, v, a = None, None, None, None
    if not os.path.exists(checkpoint):
        if geometry is not None:
            assert isinstance(geometry, str), "``geometry``must be a string!"
            assert re.search("xyz$", geometry), "``geometry`` must be a path to an ``.xyz`` file!"
            mol = cctk.XYZFile.read_file(geometry).get_molecule()
            args["atomic_numbers"] = mol.atomic_numbers
            x = mol.geometry

        elif oldchk is not None:
            assert os.path.exists(oldchk), f"Can't locate checkpoint file at {oldchk}!"
            with h5py.File(oldchk, "r") as h5:
                args["atomic_numbers"] = h5.attrs["atomic_numbers"].view(cctk.OneIndexedArray)
                x = h5.get("all_positions")[oldchk_idx].view(cctk.OneIndexedArray)
                v = h5.get("all_velocities")[oldchk_idx].view(cctk.OneIndexedArray)
                a = h5.get("all_accelerations")[oldchk_idx].view(cctk.OneIndexedArray)

        elif "quasiclassical" in settings or "initialization" in settings:
            try:
                # changed nomenclature 8.2.21 - ccw
                if "quasiclassical" in settings:
                    settings["initialization"] = copy.deepcopy(settings["quasiclassical"])

                atomic_numbers, x, v, a = presto.initialization.initialize(c, **settings["initialization"], high_atoms=args["high_atoms"])
                args["atomic_numbers"] = atomic_numbers.view(cctk.OneIndexedArray)
                temp = settings["initialization"]["temperature"]
            except Exception as e:
                raise ValueError(f"Initialization failed: {e}")

        else:
            raise ValueError("No checkpoint file; need a geometry ``.xyz`` file or old checkpoint file for this to work!")

    if "bath_scheduler" in settings:
        args["bath_scheduler"] = build_bath_scheduler(settings["bath_scheduler"])
    else:
        args["bath_scheduler"] = build_bath_scheduler()

    args["termination_function"] = None
    if "termination" in settings:
        args["termination_function"] = presto.termination.build_termination_function(settings["termination"])

    if "time_after_finished" in settings:
        assert isinstance(settings["time_after_finished"], (float, int)), "Need `time_after_finished` to be numeric!"
        args["time_after_finished"] = settings["time_after_finished"]

    if "barostat" in settings:
        args["target_pressure"] = settings["barostat"]["target_pressure"]

        if "time_constant" in settings["barostat"]:
            args["barostat_time_constant"] = settings["barostat"]["time_constant"]

    if "properties" in settings:
        args["properties"] = settings["properties"]
        if isinstance(args["properties"], str):
            args["properties"] = [args["properties"]]

    # handle index removal - rewrite to make this better later...
    remove_idxs = None
    if "remove_idxs" in settings and "atomic_numbers" in settings:
        remove_idxs = settings["remove_idxs"]
        if isinstance(remove_idxs, int):
            remove_idxs = [remove_idxs]

        args["atomic_numbers"] = np.delete(args["atomic_numbers"], [i-1 for i in remove_idxs]).view(cctk.OneIndexedArray)

    t = presto.trajectory.Trajectory(
        calculator=c,
        integrator=i,
        checks=checks,
        **args,
    )

    if len(t.frames) == 0:
        t.initialize(positions=x, velocities=v, accelerations=a, remove_idxs=remove_idxs)

    assert len(t.frames) > 0, "we shouldn't have 0 frames after initialization!"
    return t

def build_bath_scheduler(settings=None):
    # default to 298 K
    if settings is None:
        settings = {
            "type": "constant",
            "target_temp": 298,
        }


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
