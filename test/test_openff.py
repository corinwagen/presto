import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto
from presto import calculators

if __name__ == '__main__':
    unittest.main()

class TestOpenFF(unittest.TestCase):
    def test_openff(self):
        molecule = cctk.XYZFile.read_file("test/static/PhF.xyz").molecule
        atomic_numbers = molecule.atomic_numbers
        positions = molecule.geometry

        off_calculator = calculators.OpenFFCalculator(charge=0, multiplicity=1, smiles_components=["C1=CC=C(C=C1)F"])
        energy, forces = off_calculator.evaluate(atomic_numbers, positions)

#        self.assertLessEqual(abs(energy), 0.00000001)
        print(energy)
        print(forces)
