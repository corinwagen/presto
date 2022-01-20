import unittest, cctk, os
import numpy as np

import sys
sys.path.append('../presto')
import presto

if __name__ == '__main__':
    unittest.main()

class TestPackmol(unittest.TestCase):
    def test_packmol_ext(self):
        if presto.config.HAS_PACKMOL:

            radius = presto.external.run_packmol(
                "test/static/H2.xyz",
                "test/static/solvated_H2.xyz",
            )

            self.assertTrue(radius < 14 and radius > 13)

