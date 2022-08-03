import unittest, cctk
import numpy as np

import sys, os
sys.path.append('../presto')

import presto
from presto import calculators

if __name__ == '__main__':
    unittest.main()

class TestXTB(unittest.TestCase):
#    def test_gfn2(self):
#        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").get_molecule()
#        atomic_numbers = hydrogen_molecule.atomic_numbers
#        positions = hydrogen_molecule.geometry
#        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1)
#        energy, forces, _ = xtb_calculator.evaluate(atomic_numbers, positions, )
#        self.assertLessEqual(abs(energy+0.90379675435), 0.00000001)
#        expected_forces = [[ 0.21688017, 0, 0],[-0.21688017, 0, 0]]
#        actual_forces = [ list(i) for i in forces ]
#        print(actual_forces)
#        for row1,row2 in zip(expected_forces, actual_forces):
#            for entry1,entry2 in zip(row1, row2):
#                delta = abs(entry1-entry2)
#                self.assertLessEqual(delta, 0.00000001)

    def test_dipole(self):
        fluorobenzene = cctk.GaussianFile.read_file("test/static/PhF.gjf").get_molecule()
        _, _, _, p = presto.external.run_xtb(fluorobenzene, calc_dipole=True)
        self.assertTrue(p["dipole"][0] == -0.428)
#
#    def test_gfn0(self):
#        hydrogen_molecule = cctk.XYZFile.read_file("test/static/H2.xyz").get_molecule()
#        atomic_numbers = hydrogen_molecule.atomic_numbers
#        positions = hydrogen_molecule.geometry
#        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1, gfn=0)
#        energy, forces, _ = xtb_calculator.evaluate(atomic_numbers, positions, )
#        self.assertLessEqual(abs(energy+1.0083914049), 0.00000001)
#
#    def test_big(self):
#        molecule = cctk.XYZFile.read_file("test/static/nazarov-elim-solvated.xyz").get_molecule()
#        atomic_numbers = molecule.atomic_numbers
#        positions = molecule.geometry
#        xtb_calculator = calculators.XTBCalculator(charge=0, multiplicity=1, gfn="ff", parallel=4, topology="test/static/nazarov-elim.top")
#        energy, forces, _ = xtb_calculator.evaluate(atomic_numbers, positions, )
#        self.assertLessEqual(abs(energy+122.81453779461), 0.00000001)
