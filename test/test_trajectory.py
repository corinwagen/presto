import unittest, cctk
import numpy as np
from datetime import datetime

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
            stop_time = 200,
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

    def test_benzene(self):
        def boring_scheduler(time):
            return 298

        start = cctk.XYZFile.read_file("presto/solvents/benzene.xyz").molecule
        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=start.atomic_numbers,
            high_atoms=np.array([]),
            active_atoms=np.arange(1,start.num_atoms()+1),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            bath_scheduler=boring_scheduler,
            stop_time = 250,
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

#    def solvent_box(self):
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
            stop_time = 50,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(traj, presto.trajectory.EquilibrationTrajectory))
        self.assertEqual(traj.bath_scheduler(0), 298)

        print(datetime.now())
        traj.run(checkpoint_filename="chk.chk", checkpoint_interval=50, positions=start.geometry)
        print(datetime.now())
        self.assertTrue(isinstance(traj.forward_frames[0], presto.frame.Frame))

        temps = [f.temperature() for f in traj.forward_frames][10:]
        energies = [f.energy for f in traj.forward_frames][10:-1]
        pressures = [f.pressure() for f in traj.forward_frames][10:]

        print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
        print(f"PRESSURE:\t\t{np.mean(pressures):.2f} (± {np.std(pressures):.2f})")
        print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")

        print("done")
