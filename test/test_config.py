import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')
import presto

if __name__ == '__main__':
    unittest.main()

class TestYAML(unittest.TestCase):
    def test_load_config(self):
        path = "test/static/ex.yaml"
        presto.config.load(path)

