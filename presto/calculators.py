import numpy as np
import os, random, string, re, cctk, ctypes, copy, shutil, time, tempfile, logging
import subprocess as sp
import multiprocessing as mp

from presto import constants, config, constraint

logger = logging.getLogger(__name__)

############################
### Directory Parameters ###
############################

# A-Za-z0-9
LETTERS_AND_DIGITS = string.ascii_letters + string.digits

# this is the absolute path to the directory where the run_gaussian.sh script is
GAUSSIAN_SCRIPT_DIRECTORY = config.GAUSSIAN_SCRIPT_DIRECTORY

# this is the absolute path to the directory where the run_xtb.sh script is
XTB_SCRIPT_DIRECTORY = config.XTB_SCRIPT_DIRECTORY

# where the xtb GFNn config files are stored
XTB_PATH = config.XTB_PATH

###########################

class Calculator():
    """
    Generic calculator class.
    """

    def __init__(self):
        pass

    def evaluate(self, atomic_numbers, positions, high_atoms, pipe):
        """
        Return energy, forces
        """
        pass

class NullCalculator(Calculator):
    """
    Does nothing except evaluate constraints. Mostly for testing purposes, but I guess you could also model something insanely boring this way.
    """
    def __init__(self, constraints=list()):
        for c in constraints:
            assert isinstance(c, constraint.Constraint), "{c} is not a valid constraint!"
        self.constraints = constraints

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None):
        energy = 0
        forces = np.zeros_like(positions).view(cctk.OneIndexedArray)

        for c in self.constraints:
            f, e = c.evaluate(positions)
            energy += e
            forces += f

        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces


class XTBCalculator(Calculator):
    """
    Attributes:
        charge (int):
        multiplicity (int):
        gfn (int or str):
        parallel (int):
        xcontrol_path (str):
    """

    def __init__(self, charge=0, multiplicity=1, gfn=2, parallel=1, constraints=list(), xcontrol_path=None):
        assert isinstance(charge, int)
        assert isinstance(multiplicity, int)
        assert isinstance(gfn, (int, str))
        assert isinstance(parallel, int)

        self.charge = charge
        self.multiplicity = multiplicity
        self.gfn = gfn
        self.parallel = parallel

        for c in constraints:
            assert isinstance(c, constraint.Constraint), "{c} is not a valid constraint!"
        self.constraints = constraints

        if xcontrol_path is not None:
            assert isinstance(xcontrol_path, str)
        self.xcontrol_path = xcontrol_path

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, topology_path="gfnff.top"):
        """
        Gets the electronic energy and cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe (): for multiprocessing, the connection through which objects should be returned to the parent process
            topology_path (str): for GFN-FF, where the topology will be found/go

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
            time (float): in seconds
        """
        old_working_directory = os.getcwd()

        # build xtb command
        command = "xtb"
        if self.gfn == "ff":
            command += " --gfnff"
        else:
            command += f" --gfn {self.gfn}"
        command += f" --chrg {self.charge} --uhf {self.multiplicity - 1}"
        if self.parallel > 1:
            command += f" --parallel {self.parallel}"
        if self.xcontrol_path:
            command += f" --input {self.xcontrol_path}"
        command += " --grad xtb-in.xyz &> xtb-out.out"

        # set env variables
        os.environ["OMP_NUM_THREADS"] = str(self.parallel)
        os.environ["MKL_NUM_THREADS"] = str(self.parallel)
        os.environ["OMP_STACKSIZE"] = "4G"
        os.environ["OMP_MAX_ACTIVE_LEVELS"] = "1"
        os.environ["XTBPATH"] = XTB_PATH
        os.environ["XTBHOME"] = XTB_PATH

        energy, forces = None, None
        elapsed = 0
        with tempfile.TemporaryDirectory() as tmpdir:
            if os.path.exists(f"{old_working_directory}/{topology_path}"):
                shutil.copyfile(f"{old_working_directory}/{topology_path}", f"{tmpdir}/gfnff_topo")

            molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)
            cctk.XYZFile.write_molecule_to_file(f"{tmpdir}/xtb-in.xyz", molecule)

            # run xtb
            try:
                start = time.time()
                result = sp.run(command, cwd=tmpdir, shell=True, capture_output=True)
                end = time.time()
                elapsed = end - start

                result.check_returncode()
                assert os.path.isfile(f"{tmpdir}/energy"), "no energy file!"
                assert os.path.isfile(f"{tmpdir}/gradient"), "no gradient file!"
            except Exception as e:
                shutil.copyfile(f"{tmpdir}/xtb-in.xyz", f"{old_working_directory}/xtb-failed-input.xyz")
                shutil.copyfile(f"{tmpdir}/xtb-out.out", f"{old_working_directory}/xtb-failed-output.out")
                raise ValueError(f"xtb failed:\n{e}\nfiles:{os.listdir(tmpdir)}")

            # parse energy
            with open(f"{tmpdir}/energy", "r") as f:
                energy_lines = f.read().splitlines()
            energy = float(energy_lines[1].split()[1])

            # parse forces
            with open(f"{tmpdir}/gradient", "r") as f:
                gradient_lines = f.read().splitlines()
            forces = []
            for line in gradient_lines:
                fields = line.split()
                if len(fields) == 3:
                    x,y,z = float(fields[0]), float(fields[1]), float(fields[2])
                    forces.append([-x,-y,-z])
            forces = cctk.OneIndexedArray(forces)
            forces = forces * constants.AMU_A2_FS2_PER_HARTREE_BOHR
            assert len(forces) == molecule.get_n_atoms(), "unexpected number of atoms"

            # restore working directory
            if os.path.exists(f"{tmpdir}/gfnff_topo"):
                shutil.copyfile(f"{tmpdir}/gfnff_topo", f"{old_working_directory}/{topology_path}")
            os.chdir(old_working_directory)

        # apply constraints
        for c in self.constraints:
            f, e = c.evaluate(positions)
            energy += e
            forces += f

        # return result
        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces

class GaussianCalculator(Calculator):
    def __init__(
            self,
            charge=0,
            multiplicity=1,
            link0={"mem":"1GB", "nprocshared":"4"},
            route_card="#p hf/3-21g force",
            footer=None,
            constraints=list(),
        ):
        if not re.search("force", route_card):
            raise ValueError("need a force job to calculate forces")

        self.charge = charge
        self.multiplicity = multiplicity
        self.link0 = link0
        self.route_card = route_card
        self.footer = footer

        for c in constraints:
            assert isinstance(c, constraint.Constraint), "{c} is not a valid constraint!"
        self.constraints = constraints

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, qc=False):
        """
        Gets the electronic energy and Cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe (): for multiprocessing, the connection through which objects should be returned to the parent process
            qc (bool): try quadratic convergence for tricky cases, only after default DIIS fails

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        old_working_directory = os.getcwd()

        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)
        route_card = self.route_card
        if qc:
            logger.warning("warning: initial DIIS convergence failed, trying quadradic convergence")
            route_card = f"{self.route_card} scf=qc"

        energy, forces = None, None
        elapsed = 0
        with tempfile.TemporaryDirectory() as tmpdir:
            cctk.GaussianFile.write_molecule_to_file(f"{tmpdir}/g16-in.gjf", molecule, route_card, self.link0, self.footer)
            command = "g16 g16-in.gjf g16-out.out"

            # run g16
            try:
                start = time.time()
                result = sp.run(command, cwd=tmpdir, shell=True, capture_output=True)
                end = time.time()
                elapsed = end - start

                result.check_returncode()
                assert os.path.isfile(f"{tmpdir}/g16-out.out"), "no energy file!"
            except Exception as e:
                try:
                    assert qc is False # retry with quadradic convergence
                    self.evaluate(atomic_numbers, positions, high_atoms, pipe, qc=True)
                except Exception as e:
                    shutil.copyfile(f"{tmpdir}/g16-in.gjf", f"{old_working_directory}/g16-failed-input.gjf")
                    shutil.copyfile(f"{tmpdir}/g16-out.out", f"{old_working_directory}/g16-failed-output.out")
                    raise ValueError(f"g16 failed:\n{e}\nfiles:{os.listdir(tmpdir)}")

            # extract output
            gaussian_file = cctk.GaussianFile.read_file(f"{tmpdir}/g16-out.out")
            ensemble = gaussian_file.ensemble
            molecule = ensemble.molecules[-1]

            properties_dict = ensemble.get_properties_dict(molecule)
            energy = properties_dict["energy"]
            forces = properties_dict["forces"]
            forces = forces * constants.AMU_A2_FS2_PER_HARTREE_BOHR

        # restore working directory
        os.chdir(old_working_directory)

        # apply constraints
        for c in self.constraints:
            f, e = c.evaluate(positions)
            energy += e
            forces += f

        # return result
        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces

class ONIOMCalculator(Calculator):
    """
    Composes two other calculators, and computes forces according to the ONIOM embedding scheme.
    """
    def __init__(self, high_calculator, low_calculator, constraints=list()):
        assert isinstance(high_calculator, Calculator), "high calculator isn't a proper Calculator!"
        assert isinstance(low_calculator, Calculator), "low calculator isn't a proper Calculator!"
        self.high_calculator = high_calculator
        self.low_calculator = low_calculator

        for c in constraints:
            assert isinstance(c, constraint.Constraint), f"{c} is not a valid constraint!"
        self.high_calculator.constraints = constraints
        self.constraints = constraints

        #### prevent namespace collisions
        self.full_calculator = copy.deepcopy(self.low_calculator)

    def evaluate(self, atomic_numbers, positions, high_atoms, pipe=None):
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
        })
        process_hh.start()

        parent_hl, child_hl = mp.Pipe()
        process_hl = mp.Process(target=self.low_calculator.evaluate, kwargs={
            "atomic_numbers": high_atomic_numbers,
            "positions": high_positions,
            "pipe": child_hl,
        })
        process_hl.start()

        parent_ll, child_ll = mp.Pipe()
        process_ll = mp.Process(target=self.full_calculator.evaluate, kwargs={
            "atomic_numbers": atomic_numbers,
            "positions": positions,
            "pipe": child_ll,
        })
        process_ll.start()

        e_hh, f_hh = parent_hh.recv()
        e_hl, f_hl = parent_hl.recv()
        e_ll, f_ll = parent_ll.recv()

        process_hh.join()
        process_hl.join()
        process_ll.join()

        energy = e_hh + e_ll - e_hl
        forces = f_ll
        forces[high_atoms] = f_hh + f_ll[high_atoms] - f_hl

        return energy, forces

