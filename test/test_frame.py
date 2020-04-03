import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestFrame(unittest.TestCase):
    def test_temp(self):
        e0 = cctk.OneIndexedArray([0,0,0])
        e1 = cctk.OneIndexedArray([1,0,0])
        frame = presto.frame.Frame(e0, e1, e0, [1])
        self.assertTrue(isinstance(frame, presto.frame.Frame))
