import unittest, cctk
import numpy as np
from datetime import datetime

import sys, os
sys.path.append('../presto')

import presto

from asciichartpy import plot

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

#        self.assertEqual(traj.bath_scheduler(0), 298)

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
#        if os.path.exists("test/static/chk.chk"):
#            os.remove("test/static/chk.chk")

        def boring_scheduler(time):
            return 298

        start = cctk.XYZFile.read_file("presto/solvents/benzene.xyz").molecule
        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=start.atomic_numbers,
            high_atoms=np.array([]),
            inactive_atoms=np.array([]),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.LangevinIntegrator(viscosity=0.0006),
            bath_scheduler=boring_scheduler,
            stop_time = 1500,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(traj, presto.trajectory.EquilibrationTrajectory))
        self.assertEqual(traj.bath_scheduler(0), 298)

        traj.run(checkpoint_filename="test/static/benzene.chk", checkpoint_interval=50, positions=start.geometry)

        temps = np.array([f.temperature() for f in traj.frames])
        energies = np.array([f.energy for f in traj.frames])
        rel_energies = energies - np.min(energies)
        rel_energies = energies * 627.509

        print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
        print(plot(np.mean(temps[:(len(temps)//18)*18].reshape(-1,18), axis=1), {"height": 20}))
        print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")
        print(plot(np.mean(rel_energies[:(len(rel_energies)//18)*18].reshape(-1,18), axis=1), {"height":20}))

#        os.remove("test/static/chk.chk")

#    def solvent_box(self):
    def test_solvent_box(self):
        if os.path.exists("test/static/solvent.chk"):
            os.remove("test/static/solvent.chk")
        def boring_scheduler(time):
            return 298

        start = cctk.XYZFile.read_file("test/static/250_et2o.xyz").molecule
        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=start.atomic_numbers,
            high_atoms=np.array([]),
            active_atoms=np.arange(1,start.num_atoms()+1),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.LangevinIntegrator(viscosity=0.0001),
            bath_scheduler=boring_scheduler,
            stop_time = 100,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(traj, presto.trajectory.EquilibrationTrajectory))
        self.assertEqual(traj.bath_scheduler(0), 298)

        print(datetime.now())
        traj.run(checkpoint_filename="test/static/chk.chk", checkpoint_interval=10, positions=start.geometry)
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
        os.remove("test/static/solvent.chk")

