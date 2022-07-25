import numpy as np
import os, random, string, re, cctk, ctypes, copy, shutil, tempfile, logging
import time as timelib
import subprocess as sp
import multiprocessing as mp
import presto

logger = logging.getLogger(__name__)

class Calculator():
    """
    Does nothing except evaluate constraints and potential. Mostly for testing purposes, but I guess you could also model something insanely boring this way.

    Attributes:
        constraints (presto.constraints.Constraint): constraints
        potential (presto.potentials.Potential): confining potential
    """
    def __init__(self, constraints=list(), potential=None):
        if potential is not None:
            assert isinstance(potential, presto.potentials.Potential), f"needed a presto.Potential, got a {potential} instead"
        self.potential = potential

        for c in constraints:
            assert isinstance(c, presto.constraints.Constraint), "{c} is not a valid constraint!"
        self.constraints = constraints

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, time=None, scale_factor=1, **args):
        """
        Ordinarily there would be a call to an external program here.

        Returns:
            energy
            forces
        """
        energy, forces = self.apply_constraints_and_potential(positions, time, scale_factor=1)

        return self.return_energy_and_forces(energy, forces, dict(), pipe=pipe)

    def apply_constraints_and_potential(self, positions, time, scale_factor=1):
        """
        Applies constraints and potential.

        Arguments:
            positions (cctk.OneIndexedArray):
            time (float):
            scale_factor (float):

        Returns:
            energy
            forces
        """

        assert isinstance(positions, cctk.OneIndexedArray), "positions must be cctk.OneIndexedArray"

        energy = 0
        forces = np.zeros_like(positions).view(cctk.OneIndexedArray)

        if self.potential is not None:
            pe, pf = self.potential.evaluate(positions, scale_factor=scale_factor)
            energy += pe
            forces += pf

        for c in self.constraints:
            f, e = c.evaluate(positions, time=time)
            energy += e
            forces += f

        return energy, forces

    def return_energy_and_forces(self, energy, forces, properties, pipe=None):
        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces, properties])
            pipe.close()
        else:
            return energy, forces, properties


class XTBCalculator(Calculator):
    """
    Attributes:
        charge (int):
        multiplicity (int):
        gfn (int or str):
        parallel (int):
        xcontrol_path (str):
        topology (str): path to gfn-ff topology file, if gfn is ``ff``.
    """
    def __init__(self, charge=0, multiplicity=1, gfn=2, parallel=1, constraints=list(), potential=None, xcontrol_path=None, topology=None):
        assert isinstance(charge, int)
        assert isinstance(multiplicity, int)
        assert isinstance(gfn, (int, str))
        assert isinstance(parallel, int)

        self.charge = charge
        self.multiplicity = multiplicity
        self.gfn = gfn
        self.parallel = parallel

        if xcontrol_path is not None:
            assert isinstance(xcontrol_path, str)
        self.xcontrol_path = xcontrol_path

        if gfn == "ff":
            assert isinstance(topology, str), "need path for topology file!"
        self.topology = topology

        # call Calculator.__init__() for potential and constraints
        super().__init__(potential=potential, constraints=constraints)

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, time=None, directory=None, scale_factor=1, **args):
        """
        Gets the electronic energy and cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe (): for multiprocessing, the connection through which objects should be returned to the parent process
            time (float):
            directory():
            scale_factor (float):

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
            time (float): in seconds
        """
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)

        energy, forces, elapsed, properties = presto.external.run_xtb(
            molecule,
            gfn=self.gfn,
            parallel=self.parallel,
            xcontrol_path=self.xcontrol_path,
            topo_path=self.topology,
            directory=directory,
            **args
        )

        # apply constraints and potential
        constraint_e, constraint_f = self.apply_constraints_and_potential(positions, time=time, scale_factor=1)
        energy += constraint_e
        forces += constraint_f

        return self.return_energy_and_forces(energy, forces, properties, pipe=pipe)

class GaussianCalculator(Calculator):
    def __init__(
            self,
            charge=0,
            multiplicity=1,
            link0={"mem":"1GB", "nprocshared":"4"},
            route_card="#p hf/3-21g force",
            footer=None,
            constraints=list(),
            potential=None,
            gaussian_chk=None,
            working_directory=None,
        ):
        if not re.search("force", route_card):
            raise ValueError("need a force job to calculate forces")

        self.charge = charge
        self.multiplicity = multiplicity
        self.link0 = link0
        self.route_card = route_card
        self.footer = footer

        if gaussian_chk is not None:
            assert isinstance(gaussian_chk, str), "gaussian_chk must be string"
        self.gaussian_chk = gaussian_chk

        self.working_directory = working_directory

        # call Calculator.__init__() for potential and constraints
        super().__init__(potential=potential, constraints=constraints)

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, qc=False, time=None, scale_factor=1, **args):
        """
        Gets the electronic energy and Cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe (): for multiprocessing, the connection through which objects should be returned to the parent process
            qc (bool): try quadratic convergence for tricky cases, only after default DIIS fails
            time (float):
            scale_factor (float):

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)
        input_file = cctk.GaussianFile(
            molecule=molecule,
            route_card=self.route_card,
            link0=self.link0,
            footer=self.footer,
        )

        # run g16
        energy, forces, elapsed, properties = presto.external.run_gaussian(input_file, chk_file=self.gaussian_chk, directory=self.working_directory, **args)

        # apply constraints and potential
        constraint_e, constraint_f = self.apply_constraints_and_potential(positions, time=time, scale_factor=scale_factor)
        energy += constraint_e
        forces += constraint_f

        return self.return_energy_and_forces(energy, forces, properties, pipe=pipe)

class ONIOMCalculator(Calculator):
    """
    Composes two other calculators, and computes forces according to the ONIOM embedding scheme.
    """
    def __init__(self, high_calculator, low_calculator, constraints=list(), potential=None):
        assert isinstance(high_calculator, Calculator), "high calculator isn't a proper Calculator!"
        assert isinstance(low_calculator, Calculator), "low calculator isn't a proper Calculator!"
        self.high_calculator = high_calculator
        self.low_calculator = low_calculator

        # prevent namespace collisions
        self.full_calculator = copy.deepcopy(self.low_calculator)
        if isinstance(self.full_calculator, XTBCalculator):
            if self.full_calculator.gfn == "ff":
                self.full_calculator.topology = self.full_calculator.topology.replace(".low", ".full")

        # full_calculator gets the potential
        if potential is not None:
            assert isinstance(potential, presto.potentials.Potential), f"needed a presto.Potential, got a {potential} instead"
        self.full_calculator.potential = potential

        # atom numbering gets messed up if you don't give full_calculator the constraints
        for c in constraints:
            assert isinstance(c, presto.constraints.Constraint), f"{c} is not a valid constraint!"
        self.full_calculator.constraints = constraints
        self.constraints = constraints

    def evaluate(self, atomic_numbers, positions, high_atoms, pipe=None, time=None, scale_factor=1, **args):
        """
        Evaluates the forces according to the ONIOM embedding scheme.
        """
        assert len(high_atoms) > 0, "no point in doing ONIOM without a high layer!"
        assert isinstance(atomic_numbers, cctk.OneIndexedArray), "need to pass one-indexed array for indexing to work properly"
        assert isinstance(positions, cctk.OneIndexedArray), "need to pass one-indexed array for indexing to work properly"

        high_atomic_numbers = atomic_numbers[high_atoms]
        high_positions = positions[high_atoms]

        parent_hh, child_hh = mp.Pipe()
        process_hh = mp.Process(target=self.high_calculator.evaluate, kwargs={
            "atomic_numbers": high_atomic_numbers,
            "positions": high_positions,
            "pipe": child_hh,
            "time": time,
            **args,
        })
        process_hh.start()

        parent_hl, child_hl = mp.Pipe()
        process_hl = mp.Process(target=self.low_calculator.evaluate, kwargs={
            "atomic_numbers": high_atomic_numbers,
            "positions": high_positions,
            "pipe": child_hl,
            "time": time,
        #    **args,
        })
        process_hl.start()

        parent_ll, child_ll = mp.Pipe()
        process_ll = mp.Process(target=self.full_calculator.evaluate, kwargs={
            "atomic_numbers": atomic_numbers,
            "positions": positions,
            "pipe": child_ll,
            "time": time,
            "scale_factor": scale_factor,
        #    **args,
        })
        process_ll.start()

        e_hh, f_hh, p_hh = parent_hh.recv()
        e_hl, f_hl, _ = parent_hl.recv()
        e_ll, f_ll, _ = parent_ll.recv()

        # 1 hour is the limit, we're not waiting any longer than that!
        process_hh.join(3600)
        process_hl.join(3600)
        process_ll.join(3600)

        # check things actually finished okay
        assert process_hh.exitcode == 0, f"process_hh exited not-ok with exit code {process_hh.exitcode}"
        assert process_hl.exitcode == 0, f"process_hl exited not-ok with exit code {process_hl.exitcode}"
        assert process_ll.exitcode == 0, f"process_ll exited not-ok with exit code {process_ll.exitcode}"

        # do the ONIOM combination
        energy = e_hh + e_ll - e_hl
        forces = f_ll
        forces[high_atoms] = f_hh + f_ll[high_atoms] - f_hl

        return self.return_energy_and_forces(energy, forces, p_hh, pipe=pipe)

def build_calculator(settings, checkpoint_filename, constraints=list(), potential=None):
    """
    Build calculator from settings dict.
    """
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for calculator"
    assert isinstance(settings["type"], str), "Calculator `type` must be a string"

    if settings["type"].lower() == "oniom":
        assert "high_calculator" in settings, "Need `high_calculator` settings dictionary for ONIOM!"
        assert "low_calculator" in settings, "Need `low_calculator` settings dictionary for ONIOM!"
        return ONIOMCalculator(
            high_calculator=build_calculator(settings["high_calculator"], checkpoint_filename + ".high"),
            low_calculator=build_calculator(settings["low_calculator"], checkpoint_filename + ".low"),
            constraints=constraints,
            potential=potential,
        )

    elif settings["type"].lower() == "gaussian":
        args = {
            "charge": 0,
            "multiplicity": 1,
            "footer": None,
            "gaussian_chk": None,
        }

        if "charge" in settings:
            assert isinstance(settings["charge"], int), "Calculator `charge` must be an integer."
            args["charge"] = settings["charge"]

        if "multiplicity" in settings:
            assert isinstance(settings["multiplicity"], int), "Calculator `multiplicity` must be an integer."
            assert settings["multiplicity"] > 0, "Calculator `multiplicity` must be positive."
            args["multiplicity"] = settings["multiplicity"]

        # don't put in args unless it's specifically mentioned
        if "link0" in settings:
            assert isinstance(settings["link0"], dict), "Calculator `link0` must be a dictionary."
            args["link0"] = settings["link0"]

        assert "route_card" in settings, "Need a route card for `GaussianCalculator`!"
        assert isinstance(settings["route_card"], str), "Calculator `route_card` must be a string."
        assert re.search("#p", settings["route_card"]), "Need `#p` in route card!"
        assert re.search("force", settings["route_card"]), "Need `force` in route card!"
        args["route_card"] = settings["route_card"]

        if "footer" in settings:
            assert isinstance(settings["footer"], str), "Calculator `footer` must be string or `None`."
            args["footer"] = settings["footer"]

        if "gaussian_chk" in settings:
            if isinstance(settings["gaussian_chk"], str):
                args["gaussian_chk"] = settings["gaussian_chk"]
            elif settings["gaussian_chk"] is True:
                # default to the checkpoint_filename - safe option
                args["gaussian_chk"] = f"{checkpoint_filename}.gchk"
            else:
                raise ValueError("`gaussian_chk` must be string or True!")

        return GaussianCalculator(constraints=constraints, potential=potential, **args)

    elif settings["type"].lower() == "xtb":
        args = {
            "charge": 0,
            "multiplicity": 1,
            "gfn": 2,
            "parallel": 1,
            "xcontrol_path": None,
            "topology": None,
        }

        if "charge" in settings:
            assert isinstance(settings["charge"], int), "Calculator `charge` must be an integer."
            args["charge"] = settings["charge"]

        if "multiplicity" in settings:
            assert isinstance(settings["multiplicity"], int), "Calculator `multiplicity` must be an integer."
            assert settings["multiplicity"] > 0, "Calculator `multiplicity` must be positive."
            args["multiplicity"] = settings["multiplicity"]

        if "gfn" in settings:
            assert settings["gfn"] in [0, 1, 2, "ff"], "Calculator `gfn` must be 0, 1, 2, or ``ff``."
            args["gfn"] = settings["gfn"]

        if "parallel" in settings:
            assert isinstance(settings["parallel"], int), "Calculator `parallel` must be an integer."
            assert settings["parallel"] > 0, "Calculator `parallel` must be positive."
            args["parallel"] = settings["parallel"]

        if "xcontrol_path" in settings:
            assert isinstance(settings["xcontrol_path"], str), "Calculator `xcontrol` must be a string."
            args["xcontrol_path"] = settings["xcontrol_path"]

        if "topology" in settings:
            assert isinstance(settings["topology"], str), "Calculator `topology` must be a string (path where topology will be stored)."
            args["topology"] = settings["topology"]
        elif args["gfn"] == "ff":
            # need to store this somewhere!
            args["topology"] = f"{checkpoint_filename}.top"

        return XTBCalculator(constraints=constraints, potential=potential, **args)

    else:
        raise ValueError(f"Unknown integrator type {settings['type']}! Allowed options are `oniom`, `xtb`, or `gaussian`.")


