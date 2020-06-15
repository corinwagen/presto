import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto
from presto import calculators

if __name__ == '__main__':
    unittest.main()

class TestXTB(unittest.TestCase):
    def test_gfn2(self):
        import os
        print(os.getcwd())
        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").molecule
        atomic_numbers = hydrogen_molecule.atomic_numbers
        positions = hydrogen_molecule.geometry
        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1)
        energy, forces = xtb_calculator.evaluate(atomic_numbers, positions, print_timing=True)
        self.assertLessEqual(abs(energy+0.90379671599), 0.00000001)
        expected_forces = [[ 0.21688017, 0, 0],[-0.21688017, 0, 0]]
        actual_forces = [ list(i) for i in forces ]
        for row1,row2 in zip(expected_forces, actual_forces):
            for entry1,entry2 in zip(row1, row2):
                delta = abs(entry1-entry2)
                self.assertLessEqual(delta, 0.00000001)

    def test_gfn0(self):
        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").molecule
        atomic_numbers = hydrogen_molecule.atomic_numbers
        positions = hydrogen_molecule.geometry
        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1, gfn=0)
        energy, forces = xtb_calculator.evaluate(atomic_numbers, positions, print_timing=True)
        self.assertLessEqual(abs(energy+1.0083914049), 0.00000001)
        print(forces)

    def test_big(self):
        molecule = cctk.XYZFile.read_file("test/static/nazarov-elim-solvated.xyz").molecule
        atomic_numbers = molecule.atomic_numbers
        positions = molecule.geometry
        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1, gfn=2, parallel=4)
        energy, forces = xtb_calculator.evaluate(atomic_numbers, positions, print_timing=True)
        print(energy)
        self.assertLessEqual(abs(energy+966.42822055789), 0.00000001)

    def test_constraint(self):
        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").molecule
        atomic_numbers = hydrogen_molecule.atomic_numbers
        positions = hydrogen_molecule.geometry
#        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1, gfn=2, constraints=["DISTANCE: 0, 1, 0.8"])
        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1, gfn=2, constraints=["DISTANCE: 1, 2, 0.8"])
        energy, forces = xtb_calculator.evaluate(atomic_numbers, positions, print_timing=True)
#        self.assertLessEqual(abs(energy+1.0083914049), 0.00000001)
        self.assertLessEqual(abs(energy+0.90379671599), 0.00000001)
        print(forces)


