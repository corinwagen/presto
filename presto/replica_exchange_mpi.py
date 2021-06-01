from mpi4py import MPI
import numpy as np
import argparse
import copy
import cctk
import dill
import logging
import math
import os
import random
import re
import sys
import time
import yaml
import presto

logger = logging.getLogger(__name__)

comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

MIN_CHECKPOINT_INTERVAL = 50

class ReplicaExchange():
    """Runs several trajectories and manages interconversions between them.

    Based on:
        http://www.math.pitt.edu/~cbsg/Materials/Earl_ParallelTempering.pdf

    Attributes:
        stop_time (int):
        swaps (list of dict):
        swap_interval (int):
        checkpoint_filename (int):
        finished (bool):
        current_idx (int):

    Assumes there are ranks from 0 to len(trajectories) - 1

    """

    def __init__(self, trajectories, checkpoint_filename="remd.chk", swap_interval=10):
        if rank == 0:
            # rank 0 does all the checking
            for idx, traj in enumerate(trajectories):
                assert isinstance(
                    traj, presto.trajectory.EquilibrationTrajectory), "all trajectories must be EquilibrationTrajectories"
                assert traj.timestep == trajectories[0].timestep, "all trajectories must have same ``timestep``"
                assert traj.stop_time == trajectories[0].stop_time, "all trajectories must have same ``stop_time``"
                assert np.array_equal(
                    traj.high_atoms, trajectories[0].high_atoms), "all trajectories must have same ``high_atoms``"
                assert np.array_equal(
                    traj.active_atoms, trajectories[0].active_atoms), "all trajectories must have same ``active_atoms``"

            assert isinstance(swap_interval, (float, int))
            assert swap_interval % trajectories[0].timestep == 0, "swap_interval must be a multiple of timestep"
            assert isinstance(checkpoint_filename, str)

        # these attributes are privately owned by all process
        self.swaps = []
        self.trajs = sorted(trajectories, key=lambda x: x.bath_scheduler(0))
        self.temps = [traj.bath_scheduler(0) for traj in self.trajs]
        self.traj = self.trajs[rank]
        self.stop_time = trajectories[0].stop_time
        self.swap_interval = swap_interval

        self.checkpoint_filename = checkpoint_filename
        self.finished = False
        self.current_idx = 0

        self.load()

    def __str__(self):
        return f"ReplicaExchange({len(self.trajs)}) trajectories, swap_interval={self.swap_interval} fs, checkpoint_file={self.checkpoint_filename}"

    def __repr__(self):
        return f"ReplicaExchange({len(self.trajs)} trajectories, swap_interval={self.swap_interval} fs, checkpoint_file={self.checkpoint_filename})"

    def save(self):
        file_dict = {
            "stop_time": self.stop_time,
            "swap_interval": self.swap_interval,
            "swaps": self.swaps,
            "finished": self.finished,
            "current_idx": self.current_idx,
        }
        with open(self.checkpoint_filename, "w+") as f:
            yaml.dump(file_dict, f)
        logger.info(f"Saving ReplicaExchange to {self.checkpoint_filename}.")
        return self

    def load(self):
        if os.path.exists(self.checkpoint_filename):
            with open(self.checkpoint_filename, "r+") as f:
                file_dict = yaml.safe_load(f)
                self.stop_time = file_dict["stop_time"]
                self.swap_interval = file_dict["swap_interval"]
                self.swaps = file_dict["swaps"]
                self.finished = file_dict["finished"]
                self.current_idx = file_dict["current_idx"]
            logger.info(
                f"Loaded ReplicaExchange from {self.checkpoint_filename}.")
        return self

    def run(self):
        if self.finished:
            if rank == 0:
                logger.info(
                    f"From rank {rank}: Replica exchange already finished!")
            return self

        start_idx = self.current_idx

        # self.trajs is an array that everyone has privately
        for current_idx in range(start_idx, int(self.stop_time/self.swap_interval)):
            next_idx = current_idx + 1
            target_time = next_idx * self.swap_interval

            time_remaining = max(
                0, target_time - self.trajs[rank].last_time_run())

            if time_remaining:
                self.traj.run(time=self.swap_interval, checkpoint_interval=min(
                    MIN_CHECKPOINT_INTERVAL, self.swap_interval))
                self.traj.load_from_checkpoint()
                assert self.traj.last_time_run() == target_time

                self.exchange(next_idx * self.swap_interval)
                # barrier at exchange

                self.current_idx = next_idx

                if rank == 0:
                    self.save()

        # all done
        self.finished = True
        if rank == 0:
            self.save()
        return self

    def exchange(self, time):
        """ time is from 0
        """
        # these two are only nonNone when rank == 0
        # indices of energies and frames are pegged: if we swap energies, swap frames too
        # original version of code read energies from frames[-2]
        # g_energies = comm.gather(self.traj.frames[-2].energy, root=0)

        # now, we read all properties from frames[-1]
        g_frames = comm.gather(self.traj.frames[-1], root=0)

        if rank == 0:
            kB = presto.constants.BOLTZMANN_CONSTANT

            # make one pass from low to high T
            for i in range(len(self.trajs) - 1):
                j = i+1

                E_i = g_frames[i].energy

                E_j = g_frames[j].energy

                b_i = 1 / (kB * self.temps[i])

                b_j = 1 / (kB * self.temps[j])

                p = min(1, np.exp((E_i - E_j) * (b_i - b_j)))
                logger.info(f"E{i} & E{j}\tp={p}")

                if p > random.random():
                    # or momenta scaling
                    v_i_scaling = np.sqrt(self.temps[j] / self.temps[i])
                    v_j_scaling = np.sqrt(self.temps[i] / self.temps[j])

                    frame_i = g_frames[i]
                    frame_j = g_frames[j]
                    frame_i.velocities *= v_i_scaling
                    frame_j.velocities *= v_j_scaling

                    g_frames[i] = frame_j
                    g_frames[j] = frame_i

                    self.swaps.append({"time": time, "i": i, "j": j})
                    logger.info(
                        f"\nReplicas {i} & {j} swapped after {time} fs!\t{E_i} {E_j} p={p}")

        # all together now: update own trajectory's last frame to g_frames[rank]
        new_last_frame = comm.scatter(g_frames, root=0)
        self.traj.frames[-1] = new_last_frame
        # are we saving this last frame to chekpoint?

        return

    def report(self):
        if rank == 0:
            counts = np.zeros(shape=len(self.trajs))
            # len of counts is no of temps
            possible = self.current_idx * (len(self.trajs) - 1)
            for swap in self.swaps:
                counts[swap["i"]] += 1

            text = f"Time: {self.current_idx * self.swap_interval} fs\n"
            text += f"Exchange probability: {np.sum(counts)/possible:.2%}\n"
            for i in range(len(self.trajs) - 1):
                text += f"\tReplica {i} <=> Replica {i+1}  \t{counts[i]/self.current_idx:.2%}\n"

            return text
        return None
