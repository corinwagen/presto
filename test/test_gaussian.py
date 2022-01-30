import unittest, cctk
import numpy as np

import sys, shutil
sys.path.append('../presto')

import presto
from presto import calculators

if __name__ == '__main__':
    unittest.main()

class TestGaussian(unittest.TestCase):
    def test_gaussian(self):
        if not presto.config.HAS_G16:
            return True

        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").molecule
        atomic_numbers = hydrogen_molecule.atomic_numbers
        positions = hydrogen_molecule.geometry
        gaussian_calculator = calculators.GaussianCalculator(
            charge=0,
            multiplicity=1,
            link0={"mem":"1GB", "nprocshared":"1"},
            route_card = "#p hf 3-21g force",
            footer = None
        )
        energy, forces = gaussian_calculator.evaluate(atomic_numbers, positions)
        self.assertLessEqual(abs(energy+1.0508014119), 0.00000001)
        expected_forces = [[ 0.21550274, 0, 0],[-0.21550274, 0, 0]]
        actual_forces = [ list(i) for i in forces ]
        for row1,row2 in zip(expected_forces, actual_forces):
            for entry1,entry2 in zip(row1, row2):
                delta = abs(entry1-entry2)
                self.assertLessEqual(delta, 0.00000001)
