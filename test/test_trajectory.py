import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestTrajectory(unittest.TestCase):
    def test_equil_trajectory(self):
        def boring_scheduler(time):
            return 298

        zs = cctk.OneIndexedArray([2, 10])
        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=zs,
            high_atoms=np.array([2]),
            active_atoms=np.array([1]),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            bath_scheduler=boring_scheduler,
            stop_time = 20,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(traj, presto.trajectory.EquilibrationTrajectory))

        self.assertEqual(traj.bath_scheduler(0), 298)

        x = cctk.OneIndexedArray([[2,0,0], [0,0,0]])
        traj.run(checkpoint_filename="chk.chk", checkpoint_interval=50, positions=x)

        self.assertTrue(isinstance(traj.forward_frames[0], presto.frame.Frame))
        self.assertTrue(np.array_equal(traj.forward_frames[0].positions, x))

        temps = [f.temperature() for f in traj.forward_frames]
        energies = [f.energy for f in traj.forward_frames]
        print(temps)
        print(energies)

    def test_solvent_box(self):
        def boring_scheduler(time):
            return 298

        start = cctk.XYZFile.read_file("test/static/30_dcm.xyz").molecule
        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=start.atomic_numbers,
            high_atoms=np.array([]),
            active_atoms=np.arange(1,start.num_atoms()+1),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            bath_scheduler=boring_scheduler,
            stop_time = 5,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(traj, presto.trajectory.EquilibrationTrajectory))
        self.assertEqual(traj.bath_scheduler(0), 298)

        traj.run(checkpoint_filename="chk.chk", checkpoint_interval=50, positions=start.geometry)
        self.assertTrue(isinstance(traj.forward_frames[0], presto.frame.Frame))
        self.assertTrue(np.array_equal(traj.forward_frames[0].positions, start.geometry))

        temps = [f.temperature() for f in traj.forward_frames]
        energies = [f.energy for f in traj.forward_frames]
        print(temps)
        print(energies)
