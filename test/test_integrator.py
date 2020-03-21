import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

class TestLangevinHull(unittest.TestCase):
    def test_simplex(self):
        v = [[1,0,0],[0,1,0],[1,1,0]]
        s = presto.integrators.Simplex(np.array([1,2,3]), np.array(v))

        self.assertListEqual(v, s.vertices.tolist())
        self.assertEqual(s.area(), 0.5)
        self.assertListEqual(s.centroid().tolist(), [2/3, 2/3, 0])
        self.assertListEqual(s.normal().tolist(), [0, 0, 1])

        velocities = np.ones(shape=(4,3))
        self.assertListEqual(list(s.velocity(velocities)), [1, 1, 1])

    def test_hull(self):
        xyz = cctk.XYZFile.read_file("test/static/30_dcm.xyz")
        self.assertEqual(len(xyz.molecule.atomic_numbers), 150)

        positions = xyz.molecule.geometry.view(np.ndarray)
        self.assertEqual(positions.shape[0], 150)
        self.assertEqual(positions.shape[1], 3)

        integrator = presto.integrators.LangevinHullIntegrator()
        simplices = integrator.compute_hull(positions)
        self.assertTrue(isinstance(simplices[0], presto.integrators.Simplex))
        self.assertTrue(isinstance(simplices[0].indices, np.ndarray))
        self.assertTrue(isinstance(simplices[0].vertices, np.ndarray))

        self.assertListEqual(list(simplices[0].indices), [73, 38, 99])

        velocities = np.ones_like(positions)
        viscosity = 1
        temp = 300
        pressure = 1
        timestep = 0.1

        pf = integrator.pressure_forces(simplices, pressure)
        self.assertEqual(pf.shape[0], len(simplices))
        self.assertEqual(pf.shape[1], 3)

        df = integrator.drag_forces(simplices, velocities, viscosity)
        self.assertEqual(df.shape[0], len(simplices))
        self.assertEqual(df.shape[1], 3)

        rf = integrator.random_forces(simplices, viscosity, timestep, temp)
        self.assertEqual(rf.shape[0], len(simplices))
        self.assertEqual(rf.shape[1], 3)

        forces = integrator.map_forces_to_points(positions, simplices, pf+df+rf)
        self.assertEqual(forces.shape[0], 150)
        self.assertEqual(forces.shape[1], 3)
        print(forces)

if __name__ == '__main__':
    unittest.main()

