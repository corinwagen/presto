import unittest, cctk
import numpy as np

import sys
sys.path.append('../presto')

import presto

if __name__ == '__main__':
    unittest.main()

class TestHydrogen(unittest.TestCase):
    def test_h2(self):
        def boring_scheduler(time):
            return 298

        start = cctk.XYZFile.read_file("test/static/H2.xyz").molecule
        traj = presto.trajectory.EquilibrationTrajectory(
            timestep=0.5,
            atomic_numbers=start.atomic_numbers,
            high_atoms=np.array([]),
            active_atoms=np.arange(1,start.num_atoms()+1),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.VelocityVerletIntegrator(),
            bath_scheduler=boring_scheduler,
            stop_time = 25,
        )

        self.assertTrue(isinstance(traj, presto.trajectory.Trajectory))
        self.assertTrue(isinstance(traj, presto.trajectory.EquilibrationTrajectory))
        self.assertEqual(traj.bath_scheduler(0), 298)

        traj.run(checkpoint_filename="chk.chk", checkpoint_interval=50, positions=start.geometry)
        times = list(range(len(traj.forward_frames)))
        times = np.array(times)*traj.timestep
        #print(np.mean(traj.forward_frames[0].positions,axis=0))
        for time,frame in zip(times,traj.forward_frames):
            print(f"{time:.1f}  ", end="")
            h1,h2 = frame.positions[1], frame.positions[2]
            distance = cctk.helper_functions.compute_distance_between(h1,h2)
            print(frame)
            print(f"r={distance:.2f}")
            print("---------------------------")
        self.assertTrue(isinstance(traj.forward_frames[0], presto.frame.Frame))
        #self.assertTrue(np.array_equal(traj.forward_frames[0].positions, start.geometry))

        temps = [f.temperature() for f in traj.forward_frames]
        energies = [f.energy for f in traj.forward_frames]
        #print(temps)
        #print(energies)

