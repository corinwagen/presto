import unittest, cctk
import numpy as np
from datetime import datetime

import sys, os
sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestTrajectory(unittest.TestCase):
    def test_equil_trajectory(self):
        os.remove("test/static/chk.chk")
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
        traj.run(checkpoint_filename="test/static/chk.chk", checkpoint_interval=50, positions=x)

        self.assertTrue(isinstance(traj.frames[0], presto.frame.Frame))
        self.assertTrue(np.array_equal(traj.frames[0].positions, x))

        temps = [f.temperature() for f in traj.frames]
        energies = [f.energy for f in traj.frames]
        print(temps)
        print(energies)

        os.remove("test/static/chk.chk")

    def test_benzene(self):
        os.remove("test/static/chk.chk")
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

        print(start.atomic_numbers)

        traj.run(checkpoint_filename="test/static/chk.chk", checkpoint_interval=50, positions=start.geometry)
        self.assertTrue(isinstance(traj.frames[0], presto.frame.Frame))

        temps = [f.temperature() for f in traj.frames]
        energies = [f.energy for f in traj.frames]

        print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
        print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")

        os.remove("test/static/chk.chk")

#    def solvent_box(self):
    def test_solvent_box(self):
        os.remove("test/static/chk.chk")
        def boring_scheduler(time):
            return 298

        start = cctk.XYZFile.read_file("test/static/250_et2o.xyz").molecule
        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=start.atomic_numbers,
            high_atoms=np.array([]),
            active_atoms=np.arange(1,start.num_atoms()+1),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            bath_scheduler=boring_scheduler,
            stop_time = 100,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(traj, presto.trajectory.EquilibrationTrajectory))
        self.assertEqual(traj.bath_scheduler(0), 298)

        print(datetime.now())
        traj.run(checkpoint_filename="test/static/chk.chk", checkpoint_interval=50, positions=start.geometry)
        print(datetime.now())
        self.assertTrue(isinstance(traj.frames[0], presto.frame.Frame))

        temps = [f.temperature() for f in traj.frames][10:]
        energies = [f.energy for f in traj.frames][10:-1]
        pressures = [f.pressure() for f in traj.frames][10:]

        print(len(traj.frames))
        print(temps)
        print(np.std(temps))
        print(np.std(energies)*627.509)

        print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
        print(f"PRESSURE:\t\t{np.mean(pressures):.2f} (± {np.std(pressures):.2f})")
        print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")

        traj.write_movie("movie.pdb")

        print("done")
        os.remove("test/static/chk.chk")
