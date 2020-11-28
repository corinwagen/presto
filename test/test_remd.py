import unittest, cctk
import numpy as np
from datetime import datetime

import sys, os
sys.path.append('../presto')

import presto
from asciichartpy import plot

if __name__ == '__main__':
    unittest.main()

class TestReplicaExchange(unittest.TestCase):
    def test_remd(self):
        if os.path.exists("test/static/remd-chk1.chk"):
            os.remove("test/static/remd-chk1.chk")
        if os.path.exists("test/static/remd-chk2.chk"):
            os.remove("test/static/remd-chk2.chk")
        def sched_300k(time):
            return 300

        def sched_330k(time):
            return 330

        zs = cctk.OneIndexedArray([2, 10])
        traj1 = presto.trajectory.EquilibrationTrajectory(
            timestep=1,
            atomic_numbers=zs,
            high_atoms=np.array([2]),
            active_atoms=np.array([1,2]),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.LangevinIntegrator(),
            bath_scheduler=sched_300k,
            checkpoint_filename="test/static/remd-chk1.chk",
            stop_time = 400,
        )

        traj2 = presto.trajectory.EquilibrationTrajectory(
            timestep=1,
            atomic_numbers=zs,
            high_atoms=np.array([2]),
            active_atoms=np.array([1,2]),
            calculator=presto.calculators.XTBCalculator(),
            integrator=presto.integrators.LangevinIntegrator(),
            bath_scheduler=sched_330k,
            checkpoint_filename="test/static/remd-chk2.chk",
            stop_time = 400,
        )

        x = cctk.OneIndexedArray([[1,0,0], [0,0,0]])
        traj1.initialize(positions=x)
        x = cctk.OneIndexedArray([[2,0,0], [0,0,0]])
        traj2.initialize(positions=x)

        remd = presto.replica_exchange.ReplicaExchange(trajectories=[traj1, traj2], swap_interval=25, checkpoint_filename="test/static/remd.chk")

        remd.run()

