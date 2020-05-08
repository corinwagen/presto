import numpy as np
import os, random, string, re, cctk, ctypes
import subprocess as sp
import shutil

import xtb

from presto import constants

############################
### Directory Parameters ###
############################

# A-Za-z0-9
LETTERS_AND_DIGITS = string.ascii_letters + string.digits

# select a unique 8-letter string that will
# be used to identify this particular Python process
UNIQUE_ID = random.choice(string.ascii_letters)
for i in range(7):
    UNIQUE_ID += random.choice(LETTERS_AND_DIGITS)

# will be incremented by one every time a calculation is run
GAUSSIAN_COUNTER = 0
XTB_COUNTER = 0

# this is the absolute path to the directory where the run_gaussian.sh script is
GAUSSIAN_DIRECTORY = f"{os.getcwd()}/gaussian"
XTB_DIRECTORY = f"{os.getcwd()}/xtb"

###########################

class Calculator():
    """
    Generic calculator class.
    """

    def __init__(self):
        pass

    def evaluate(self, atomic_numbers, positions, high_atoms):
        pass


class XTB_API_Calculator(Calculator):
    """
    """
    def evaluate(self, atomic_numbers, positions, high_atoms=None, params={}):
        """
        Args:
            atomic_numbers (cctk.OneIndexedArray):
            positions (cctk.OneIndexedArray):
            high_atoms (np.ndarray): do nothing with this
            params (dict): custom params for calculation (not currently implemented)

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """

        #### np.int8 converts to ctypes.c_bytes, whereas np.intc converts to ctypes.c_int
        numbers = atomic_numbers.view(np.ndarray).astype(ctypes.c_int)
        num_atoms = len(numbers)

        positions = positions.view(np.ndarray) * constants.BOHR_PER_ANGSTROM
        positions = positions.astype(ctypes.c_double)

        calc = xtb.interface.XTBLibrary()
        options = {
            "print_level": 0,
            "parallel": 0,
            "accuracy": 1.00,
            "electronic_temperature": 300.0,
            "gradient": True,
            "restart": False,
            "ccm": True,
            "max_iterations": 250,
        }

        output = calc.GFN2Calculation(
            natoms=num_atoms,
            numbers=numbers,
            charge=0.0,
            positions=positions,
            options=options,
            output="-",
            magnetic_moment=0,
        )

        grad = -output["gradient"]
        energy = output["energy"]
        forces = np.array(grad).view(cctk.OneIndexedArray) *  constants.AMU_A2_FS2_PER_HARTREE_BOHR

        return energy, forces

class XTBCalculator(Calculator):

    def __init__(self, charge=0, multiplicity=1):
        self.charge = charge
        self.multiplicity = multiplicity

    def evaluate(self, atomic_numbers, positions, high_atoms=None):
        """
        Gets the electronic energy and cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        # set working directory
        old_working_directory = os.getcwd()
        os.chdir(XTB_DIRECTORY)

        # generate filenames
        global XTB_COUNTER
        attempts = 0
        while True:
            XTB_COUNTER += 1
            attempts += 1
            this_unique_id = f"{UNIQUE_ID}-{XTB_COUNTER:09d}"
            input_filename = f"presto-{this_unique_id}.xyz"
            if not os.path.isfile(input_filename):
                break
            if attempts > 10000:
                raise ValueError("could not find a unique filename to write!")
        output_filename = f"presto-{this_unique_id}.out"

        # create molecule
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)

        # write out job
        cctk.XYZFile.write_molecule_to_file(input_filename, molecule, title="presto")

        # run job
        command = ["bash", "run_xtb.sh", f"presto-{this_unique_id}", str(self.charge), str(self.multiplicity)]
        process = sp.Popen(command, stdout=sp.PIPE)
        output, error = process.communicate()
        p_status = process.wait()
        output = output.decode("utf-8")

        if p_status != 0:
            raise ValueError(f"command line xtb job {this_unique_id} died with exit code {p_status}!")

        # get results
        job_directory = f"{XTB_DIRECTORY}/presto-{this_unique_id}"
        os.chdir(job_directory)

        # parse energy
        if not os.path.isfile("energy"):
            raise ValueError(f"xtb energy file not found for job {this_unique_id}")
        with open("energy", "r") as f:
            energy_lines = f.read().splitlines()
        energy = energy_lines[1]
        fields = energy.split()
        energy = float(fields[1])
        if not os.path.isfile("gradient"):
            raise ValueError(f"xtb gradient file not found for job {this_unique_id}")
        with open("gradient", "r") as f:
            gradient_lines = f.read().splitlines()

        # parse forces
        forces = []
        for line in gradient_lines:
            fields = line.split()
            if len(fields) == 3:
                x,y,z = float(fields[0]), float(fields[1]), float(fields[2])
                forces.append([-x,-y,-z])
        forces = cctk.OneIndexedArray(forces)
        forces = forces * constants.AMU_A2_FS2_PER_HARTREE_BOHR
        assert len(forces) == molecule.get_n_atoms(), "unexpected number of atoms"

        # delete job directory
        os.chdir(XTB_DIRECTORY)
        try:
            shutil.rmtree(job_directory)
        except Exception as e:
            print(e)
            print(f"warning: could not remove ${job_directory} but continuing")

        # restore working directory
        os.chdir(old_working_directory)

        # return result
        return energy, forces

class GaussianCalculator(Calculator):

    def __init__(self, charge=0, multiplicity=1,
                 link0={"mem":"1GB", "nprocshared":"4"},
                 route_card="#p hf 3-21g force",
                 footer=None):
        if not re.search("force", route_card):
            raise ValueError("need a force job to calculate forces")

        self.charge = charge
        self.multiplicity = multiplicity
        self.link0 = link0
        self.route_card = route_card
        self.footer = footer

    def evaluate(self, atomic_numbers, positions, high_atoms=None):
        """
        Gets the electronic energy and cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        # set working directory
        old_working_directory = os.getcwd()
        os.chdir(GAUSSIAN_DIRECTORY)

        # generate filenames
        global GAUSSIAN_COUNTER
        attempts = 0
        while True:
            GAUSSIAN_COUNTER += 1
            attempts += 1
            this_unique_id = f"{UNIQUE_ID}-{XTB_COUNTER:09d}"
            input_filename = f"presto-{this_unique_id}.gjf"
            if not os.path.isfile(input_filename):
                break
            if attempts > 10000:
                raise ValueError("could not find a unique filename to write!")
        output_filename = f"presto-{this_unique_id}.out"

        # create molecule
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)

        # write out job
        cctk.GaussianFile.write_molecule_to_file(input_filename, molecule, self.route_card, self.link0, self.footer)

        # run job
        command = ["bash", "run_gaussian.sh", f"presto-{this_unique_id}"]
        process = sp.Popen(command, stdout=sp.PIPE)
        output, error = process.communicate()
        p_status = process.wait()
        output = output.decode("utf-8")
        if p_status != 0:
            raise ValueError(f"gaussian job {this_unique_id} died with exit code {p_status}!")

        # get results
        job_directory = f"{GAUSSIAN_DIRECTORY}/presto-{this_unique_id}"
        os.chdir(job_directory)
        gaussian_file = cctk.GaussianFile.read_file(output_filename)
        ensemble = gaussian_file.ensemble
        molecule = ensemble.molecules[-1]
        properties_dict = ensemble.get_properties_dict(molecule)
        energy = properties_dict["energy"]
        forces = properties_dict["forces"]
        forces = forces * constants.AMU_A2_FS2_PER_HARTREE_BOHR

        # delete job directory
        os.chdir(GAUSSIAN_DIRECTORY)
        try:
            shutil.rmtree(job_directory)
        except Exception as e:
            print(e)
            print(f"warning: could not remove ${job_directory} but continuing")

        # restore working directory
        os.chdir(old_working_directory)

        # return result
        return energy,forces

class ONIOMCalculator(Calculator):
    def __init__(self, high_calculator, low_calculator):
        assert isinstance(high_calculator, Calculator), "high calculator isn't a proper Calculator!"
        assert isinstance(low_calculator, Calculator), "low calculator isn't a proper Calculator!"
        self.high_calculator = high_calculator
        self.low_calculator = low_calculator

    def evaluate(self, atomic_numbers, positions, high_atoms):
        high_atomic_numbers = atomic_numbers[high_atoms]
        high_positions = positions[high_atoms]

        e_hh, f_hh = self.high_calculator.evaluate(high_atomic_numbers, high_positions)
        e_hl, f_hl = self.low_calculator.evaluate(high_atomic_numbers, high_positions)
        e_ll, f_ll = self.low_calculator.evaluate(atomic_numbers, positions)

        energy = e_hh + e_ll - e_hl
        forces = f_hh + f_ll - f_hl

        return energy, forces
