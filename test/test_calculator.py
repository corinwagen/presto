import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

import xtb
from ctypes import c_int, c_double

class NoTestXTBCalculator(unittest.TestCase):
    def test_basic(self):
        path = "test/static/PhF.xyz"
        mol = cctk.XYZFile.read_file(path).molecule

        self.assertEqual(mol.num_atoms(), 12)

        calc = presto.calculators.XTBCalculator()
        energy, forces = calc.evaluate(mol.atomic_numbers, mol.geometry)
        print(energy)

        self.assertTrue((energy + 20.107812115939) < 0.0001)

    def test_xtb(self):
        #Adapted from https://github.com/grimme-lab/xtb/blob/master/python/xtb/test/test_interface.py
        natoms = 24
        numbers = np.array(
            [6, 7, 6, 7, 6, 6, 6, 8, 7, 6, 8, 7, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            dtype=c_int,
        )

        positions = np.array(
            [
                [2.02799738646442, 0.09231312124713, -0.14310895950963],
                [4.75011007621000, 0.02373496014051, -0.14324124033844],
                [6.33434307654413, 2.07098865582721, -0.14235306905930],
                [8.72860718071825, 1.38002919517619, -0.14265542523943],
                [8.65318821103610, -1.19324866489847, -0.14231527453678],
                [6.23857175648671, -2.08353643730276, -0.14218299370797],
                [5.63266886875962, -4.69950321056008, -0.13940509630299],
                [3.44931709749015, -5.48092386085491, -0.14318454855466],
                [7.77508917214346, -6.24427872938674, -0.13107140408805],
                [10.30229550927022, -5.39739796609292, -0.13672168520430],
                [12.07410272485492, -6.91573621641911, -0.13666499342053],
                [10.70038521493902, -2.79078533715849, -0.14148379504141],
                [13.24597858727017, -1.76969072232377, -0.14218299370797],
                [7.40891694074004, -8.95905928176407, -0.11636933482904],
                [1.38702118184179, 2.05575746325296, -0.14178615122154],
                [1.34622199478497, -0.86356704498496, 1.55590600570783],
                [1.34624089204623, -0.86133716815647, -1.84340893849267],
                [5.65596919189118, 4.00172183859480, -0.14131371969009],
                [14.67430918222276, -3.26230980007732, -0.14344911021228],
                [13.50897177220290, -0.60815166181684, 1.54898960808727],
                [13.50780014200488, -0.60614855212345, -1.83214617078268],
                [5.41408424778406, -9.49239668625902, -0.11022772492007],
                [8.31919801555568, -9.74947502841788, 1.56539243085954],
                [8.31511620712388, -9.76854236502758, -1.79108242206824],
            ],
            dtype=c_double,
        )

        options = {
            "print_level": 0,
            "parallel": 0,
            "accuracy": 1.0,
            "electronic_temperature": 300.0,
            "gradient": True,
            "restart": False,
            "ccm": True,
            "max_iterations": 30,
            "solvent": "ch2cl2",
        }

        results = xtb.interface.XTBLibrary().GFN2Calculation(
            natoms=natoms,
            numbers=numbers,
            charge=0.0,
            positions=positions,
            options=options,
            output="-",
            magnetic_moment=0,
        )

        print(results["energy"])
        self.assertTrue((results["energy"] + 42.170585 ) < 0.001)

if __name__ == '__main__':
    unittest.main()

