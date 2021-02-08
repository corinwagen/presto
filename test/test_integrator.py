import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestLangevinIntegrator(unittest.TestCase):
    def gen_test_frame(self):
        zs = cctk.OneIndexedArray([2])
        traj = presto.trajectory.Trajectory(
            timestep=0.5,
            atomic_numbers=zs,
            high_atoms=np.array([]),
            active_atoms=np.array([1]),
            stop_time=100,
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.LangevinIntegrator(viscosity=0.0001),
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))

        e0 = cctk.OneIndexedArray([[0,0,0]])
        e1 = cctk.OneIndexedArray([[1,0,0]])
        frame = presto.frame.Frame(traj, e0, e1, e0)
        self.assertTrue(isinstance(frame, presto.frame.Frame))
        return frame

    def test_radius(self):
        frame = self.gen_test_frame()
        self.assertEqual(frame.radii()[1], 1.4)

#    def test_drag(self):
#        frame = self.gen_test_frame()
#        new_a = cctk.OneIndexedArray([1,0,0])
#        print(frame.trajectory.integrator.drag_forces(frame, True, new_a))

class TestSphericalIntegration(unittest.TestCase):
    def test_spherical_harmonic_potential(self):
        potential = presto.potentials.SphericalHarmonicPotential(radius=10, force_constant=1, convert_from_kcal=False)

        x = np.array([[1], [9], [11], [-12]])
        e, f = potential.evaluate(x)

        self.assertEqual(f[1], 0)
        self.assertEqual(f[2], 0)
        self.assertEqual(f[3], -1)
        self.assertEqual(f[4], 2)
        self.assertEqual(e,2.5)

        x = np.array([[0,0,10]])
        e, f = potential.evaluate(x)
        self.assertEqual(np.linalg.norm(f[1]), 0)
        self.assertEqual(e,0)

        x = np.array([[0,0,-8]])
        e, f = potential.evaluate(x)
        self.assertEqual(np.linalg.norm(f[1]), 0)
        self.assertEqual(e,0)

        x = np.array([[0,0,1]])
        e, f = potential.evaluate(x)
        self.assertEqual(np.linalg.norm(f[1]), 0)
        self.assertEqual(e,0)
