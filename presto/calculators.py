import numpy as np
import cctk
import ctypes

import xtb

from presto import constants

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
    def evaluate(self, atomic_numbers, positions):
        """
        Args:
            positions (cctk.OneIndexedArray):
            atomic_numbers (cctk.OneIndexedArray):
            params (dict): custom params for calculation

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

        grad = output["gradient"]
        energy = output["energy"]
        forces = np.array(grad).view(cctk.OneIndexedArray) *  constants.AMU_A2_FS2_PER_HARTREE_BOHR

        return energy, forces

class GaussianCalculator(Calculator):

    def evaluate(self, molecule):
        pass

class ONIOMCalculator(Calculator):

    def evaluate(self, molecule):
        pass
