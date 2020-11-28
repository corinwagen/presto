import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestFrame(unittest.TestCase):
    def gen_test_frame(self):
        zs = cctk.OneIndexedArray([2])
        traj = presto.trajectory.Trajectory(
            timestep=0.5,
            atomic_numbers=zs,
            high_atoms=np.array([]),
            active_atoms=np.array([1]),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            stop_time=10000,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))

        e0 = cctk.OneIndexedArray([[0,0,0]])
        e1 = cctk.OneIndexedArray([[1,0,0]])
        frame = presto.frame.Frame(traj, e0, e1, e0)
        self.assertTrue(isinstance(frame, presto.frame.Frame))
        return frame

    def test_temp(self):
        frame = self.gen_test_frame()
        self.assertEqual(int(frame.temperature()), 1604675)

    def test_next(self):
        frame = self.gen_test_frame()
        f2 = frame.next()
        self.assertTrue(isinstance(f2, presto.frame.Frame))
        self.assertListEqual(list(f2.positions[1]), [0.5, 0, 0])

        f3 = f2.next()
        self.assertListEqual(list(f3.positions[1]), [1, 0, 0])

        f4 = f3.next()
        self.assertListEqual(list(f4.positions[1]), [1.5, 0, 0])

        f5 = f4.next()
        self.assertListEqual(list(f5.positions[1]), [2, 0, 0])

        f0 = frame.prev()
        self.assertListEqual(list(f0.positions[1]), [-0.5, 0, 0])

    def test_com_motion(self):
        num_atoms = 4
        zs = cctk.OneIndexedArray([1] * num_atoms)
        traj = presto.trajectory.Trajectory(
            timestep=0.5,
            atomic_numbers=zs,
            high_atoms=np.array([]),
            active_atoms=np.array([]),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            stop_time = 1000,
        )

        positions = cctk.OneIndexedArray([[2,0,0],[-1,0,0],[0,1,0],[0,-1,0]])
        velocities = cctk.OneIndexedArray([[0,2,1],[0,-1,0],[1,0,-2],[-1,0,0]])
        accels = cctk.OneIndexedArray([[0,0,0],[0,0,0],[0,0,0],[0,0,0]])

        frame = presto.frame.Frame(traj, positions, velocities, accels)
        frame.remove_com_motion()
        self.assertTrue(np.linalg.norm(np.sum(traj.masses.reshape(-1,1) * frame.velocities, axis=0)) < 0.0001)
