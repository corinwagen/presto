import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestFrame(unittest.TestCase):
    def test_temp(self):
        zs = cctk.OneIndexedArray([2])
        traj = presto.trajectory.Trajectory(0.5, zs, [], [1], presto.calculators.XTBCalculator(), presto.integrators.VelocityVerletIntegrator())
        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))

        e0 = cctk.OneIndexedArray([0,0,0])
        e1 = cctk.OneIndexedArray([1,0,0])
        frame = presto.frame.Frame(traj, e0, e1, e0, [1])
        self.assertTrue(isinstance(frame, presto.frame.Frame))
        self.assertEqual(int(frame.temperature()), 1604675)
