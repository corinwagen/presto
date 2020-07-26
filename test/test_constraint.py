import unittest, cctk, os, sys
import numpy as np

sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestConstraint(unittest.TestCase):
    def gen_test_frame(self, distance):
        zs = cctk.OneIndexedArray([1, 1])

        c = presto.constraint.PairwisePolynomialConstraint(1, 2, distance, power=2)

        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=zs,
            high_atoms=np.array([]),
            active_atoms=np.array([1, 2]),
            calculator=presto.calculators.NullCalculator([c]),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            stop_time=250,
            checkpoint_filename="test/static/constraint-test.chk",
            bath_scheduler=298,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))

        z = cctk.OneIndexedArray([[0,0,0], [0,0,0]])
        p = cctk.OneIndexedArray([[1,0,0], [0,0,0]])
        frame = presto.frame.Frame(traj, p, z, z)
        self.assertTrue(isinstance(frame, presto.frame.Frame))

        traj.frames = [frame]
        return frame

    def test_constraint(self):
        f1 = self.gen_test_frame(1)

        f2 = f1.next()
        f3 = f2.next()

        for x, y in zip(np.ravel(f3.positions), np.ravel(f2.positions)):
            self.assertTrue(x - y == 0)

        for x, y in zip(np.ravel(f3.accelerations), np.ravel(f2.accelerations)):
            self.assertTrue(x - y == 0)

        f1 = self.gen_test_frame(1.5)
        t = f1.trajectory

        t.run(keep_all=True)

        distances = list()
        for f in t.frames:
            m = f.molecule()
            distances.append(m.get_distance(1,2))

        from asciichartpy import plot
        print(plot(distances[::4], {"height": 12}))

        os.remove(t.checkpoint_filename)