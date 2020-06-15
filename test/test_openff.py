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
        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").molecule
        atomic_numbers = hydrogen_molecule.atomic_numbers
        positions = hydrogen_molecule.geometry

        off_calculator = calculators.OpenFFCalculator(charge=0, multiplicity=1, smiles_components=["HH"])
        energy, forces = off_calculator.evaluate(positions,atomic_numbers)

        self.assertLessEqual(abs(energy+1.0508014119), 0.00000001)
        expected_forces = [[ 0.21550274, 0, 0],[-0.21550274, 0, 0]]
        actual_forces = [ list(i) for i in forces ]
        for row1,row2 in zip(expected_forces, actual_forces):
            for entry1,entry2 in zip(row1, row2):
                delta = abs(entry1-entry2)
                self.assertLessEqual(delta, 0.00000001)
