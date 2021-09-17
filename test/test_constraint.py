import unittest, cctk, os, sys
import numpy as np

sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestConstraint(unittest.TestCase):
    def gen_test_frame(self, distance):
        if os.path.exists("test/static/constraint-test.chk"):
            os.remove("test/static/constraint-test.chk")

        zs = cctk.OneIndexedArray([1, 1])
        c = presto.constraints.PairwisePolynomialConstraint(1, 2, distance, power=2)

        traj = presto.trajectory.Trajectory(
            timestep=0.5,
            atomic_numbers=zs,
            high_atoms=np.array([]),
            active_atoms=np.array([1, 2]),
            calculator=presto.calculators.Calculator([c]),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            stop_time=250,
            checkpoint_filename="test/static/constraint-test.chk",
            bath_scheduler=298,
        )

        if os.path.exists("test/static/constraint-test.chk.lock"):
            os.remove("test/static/constraint-test.chk.lock")

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))

        z = cctk.OneIndexedArray([[0,0,0], [0,0,0]])
        p = cctk.OneIndexedArray([[1,0,0], [0,0,0]])
        frame = presto.frame.Frame(traj, p, z, z)
        self.assertTrue(isinstance(frame, presto.frame.Frame))

        traj.frames = [frame]
        traj.save()
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

#        os.remove(t.checkpoint_filename)

    def test_anchor(self):
        anchor = presto.constraints.Anchor(1)
        position = cctk.OneIndexedArray([[1,0,0], [0,0,0]])
        position[1] = np.asarray([1, 1, 1])

        f, e = anchor.evaluate(position)
        for x in list(f[1]):
            self.assertTrue(x + 0.0004184 < 0.000001)
        self.assertTrue(e - 0.0031379999999999997 < 0.000001)

    def test_interlocking_sphere_pot(self):
        # nazarov ts
        traj = presto.config.build("test/static/ex.yaml", "test/static/ex.chk", "test/static/nazarov-elim-solvated.xyz")
        mol = traj.frames[0].molecule()

        constraint = presto.constraints.PairwisePolynomialConstraint(13, [14,15,16], 1.0, min=False, force_constant=50, fadein=100)
        f, e = constraint.evaluate(mol.geometry)
        self.assertTrue(np.linalg.norm(f[14]) == 0)
        self.assertFalse(np.linalg.norm(f[15]) == 0)
        self.assertTrue(np.linalg.norm(f[16]) == 0)

        f2, e2 = constraint.evaluate(mol.geometry, time=50)
        self.assertTrue(np.linalg.norm(f[15])/np.linalg.norm(f2[15]) - 2 < 0.0001)

        os.remove("test/static/ex.chk")
