import unittest, cctk, os
import numpy as np

import sys
sys.path.append('../presto')
import presto

if __name__ == '__main__':
    unittest.main()

class TestConfig(unittest.TestCase):
    def test_load_config(self):
        path = "test/static/ex.yaml"
        presto.config.build(path, "test/static/ex.chk", "test/static/nazarov-elim-solvated.xyz")

        path = "test/static/ex2.yaml"
        presto.config.build(path, "test/static/ex2.chk", oldchk="test/static/ex.chk")
        os.remove("test/static/ex.chk")
        os.remove("test/static/ex2.chk")

        if presto.config.HAS_G16:
            path = "test/static/ex3.yaml"
            presto.config.build(path, "test/static/ex3.chk")
            os.remove("test/static/ex3.chk")
