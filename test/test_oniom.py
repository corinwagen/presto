import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto
from presto import calculators

if __name__ == '__main__':
    unittest.main()

class TestONIOM(unittest.TestCase):
    def test_simple(self):
        pass
#        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").get_molecule()
#        atomic_numbers = hydrogen_molecule.atomic_numbers
#        positions = hydrogen_molecule.geometry
#        high_atoms = np.array([1])
#        xtb_calculator = calculators.XTBCalculator()
#        oniom_calculator = calculators.ONIOMCalculator(high_calculator=xtb_calculator, low_calculator=xtb_calculator)
#
#        energy, forces, _ = oniom_calculator.evaluate(atomic_numbers, positions, high_atoms)
#        self.assertLessEqual(abs(energy+0.90379671599), 0.00000001)
#        expected_forces = [[ 0.21688017, 0, 0],[-0.21688017, 0, 0]]
#        actual_forces = [ list(i) for i in forces ]
#        for row1,row2 in zip(expected_forces, actual_forces):
#            for entry1,entry2 in zip(row1, row2):
#                delta = abs(entry1-entry2)
#                self.assertLessEqual(delta, 0.00000001)
