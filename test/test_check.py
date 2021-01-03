import unittest, cctk, os
import numpy as np

import sys
sys.path.append('../presto')
import presto

if __name__ == '__main__':
    unittest.main()

class TestCheck(unittest.TestCase):
    def gen_test_traj(self):
        traj = presto.trajectory.Trajectory(
            timestep=0.5,
            atomic_numbers=cctk.OneIndexedArray([1,1]),
            high_atoms=np.array([]),
            active_atoms=np.array([1,2]),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(potential=presto.potentials.SphericalHarmonicPotential(radius=10)),
            stop_time=10000,
        )

        p1 = cctk.OneIndexedArray([[12,0,0],[11.5,0,0]])
        p2 = cctk.OneIndexedArray([[12,0,0],[10,0,0]])
        v = cctk.OneIndexedArray([[2,0,0],[0,0,0]])
        a = cctk.OneIndexedArray([[0,0,0],[0,0,0]])
        frame1 = presto.frame.Frame(traj, p1, v, a)
        frame2 = presto.frame.Frame(traj, p2, v, a)
        traj.frames = [frame1, frame2]
        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(frame1, presto.frame.Frame))
        self.assertTrue(isinstance(frame2, presto.frame.Frame))
        return traj

    def test_radius_check(self):
        check = presto.checks.RadiusCheck()
        traj = self.gen_test_traj()
        with self.assertRaises(AssertionError):
            check.check(traj)

    def test_velocity_check(self):
        check = presto.checks.VelocityCheck()
        traj = self.gen_test_traj()
        with self.assertRaises(AssertionError):
            check.check(traj)

    def test_topology_check(self):
        check = presto.checks.TopologyCheck(interval=1)
        traj = self.gen_test_traj()
        with self.assertRaises(AssertionError):
            check.check(traj)
