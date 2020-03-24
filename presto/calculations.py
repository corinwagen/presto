import numpy as np
import cctk
import ctypes

import xtb

class Calculation():
    """
    Attributes:
        molecule (cctk.Molecule): molecule to calculate
        params (dict): custom params for calculation
        energy (float):
        forces (cctk.OneIndexedArray)
        tail (str): tail of output, for troubleshooting
    """

    def __init__(self, molecule, params=None):
        assert isinstance(molecule, cctk.Molecule), "need a valid molecule!"

        self.molecule = molecule
        self.params = params

    def evaluate(self):
        pass


class XTBCalculation(Calculation):
    """
    """
    def evaluate(self):
        """
        """

        #### np.int8 converts to ctypes.c_bytes, whereas np.intc converts to ctypes.c_int
        num_atoms = self.molecule.num_atoms()
        numbers = self.molecule.atomic_numbers.view(np.ndarray).astype(ctypes.c_int)

        positions = self.molecule.geometry.view(np.ndarray)
        positions = positions / 0.529177 # Å to Bohr
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

        grad = output["gradient"]
        energy = output["energy"]

        self.energy = energy
        self.forces = np.array(grad).view(cctk.OneIndexedArray)
