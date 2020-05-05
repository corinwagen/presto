import numpy as np
import cctk
import ctypes

import os
import random
import string
import subprocess

import xtb

from presto import constants

###########################
### Gaussian Parameters ###
###########################

# A-Za-z0-9
LETTERS_AND_DIGITS = string.ascii_letters + string.digits

# select a unique 8-letter string that will
# be used to identify this particular Python process
UNIQUE_ID = random.choice(string.ascii_letters)
for i in range(7):
    UNIQUE_ID += random.choice(LETTERS_AND_DIGITS)

# will be incremented by one every time a calculation is run
COUNTER = 0

# this is the absolute path to the directory where the run_gaussian.sh script is
GAUSSIAN_DIRECTORY = f"{os.getcwd()}/gaussian/"

###########################

class Calculator():
    """
    """

    def __init__(self):
        pass

    def evaluate(self):
        pass


class XTBCalculator(Calculator):
    """
    """
    def evaluate(self, atomic_numbers, positions, params={}):
        """
        Args:
            atomic_numbers (cctk.OneIndexedArray):
            positions (cctk.OneIndexedArray):
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

class GaussianCalculator(Calculator):

    def evaluate(self, positions, atomic_numbers, charge=0, multiplicity=1,
                 link0={"mem":"1GB", "nprocshared":"4"}
                 route_card="hf 3-21g force"
                 footer=None):
        """
        Gets the electronic energy and cartesian forces for the specified geometry.

        Args:
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        # set working directory
        old_working_directory = os.getcwd()
        os.chdir(GAUSSIAN_DIRECTORY)

        # generate filenames
        COUNTER += 1
        this_unique_id = f"{UNIQUE_ID}-{COUNTER:09d}"
        input_filename = f"presto-{this_unique_id}.gjf"
        output_filename = f"presto-{this_unique_id}.out"

        # create molecule
        molecule = cctk.Molecule(atomic_numbers, geometry, charge=charge, multiplicity=multiplicity)

	# write out job
        cctk.GaussianFile.write_molecule_to_file(input_filename, molecule, route_card, link0, footer)

        # run job
        command = ["bash", "run_gaussian.sh", this_unique_id]
        process = sp.Popen(command, stdout=sp.PIPE)
        output, error = process.communicate()
        p_status = process.wait()
        output = output.decode("utf-8")
        print(output)
        print(p_status)

        # get results and change units
        file = cctk.GaussianFile.read_file(output_filename)
        ensemble = file.ensemble
        molecule = file.molecules[-1]
        properties_dict = ensemble.get_properties_dict(molecule)
        print(properties_dict)

        # restore working directory
        os.chdir(old_working_directory)

        # return result
        pass

class ONIOMCalculator(Calculator):

    def evaluate(self, molecule):
        pass
