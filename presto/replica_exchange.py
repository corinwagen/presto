import numpy as np
import math, copy, cctk, os, re, logging, time, yaml, random
import multiprocessing as mp

import presto

logger = logging.getLogger(__name__)

MIN_CHECKPOINT_INTERVAL = 50

class ReplicaExchange():
    """
    Runs several trajectories and manages interconversions between them.

    Based on:
        http://www.math.pitt.edu/~cbsg/Materials/Earl_ParallelTempering.pdf

    Attributes:
        stop_time (int):
        swaps (list of dict):
        swap_interval (int):
        checkpoint_filename (int):
        finished (bool):
        current_idx (int):
    """
    def __init__(self, trajectories, checkpoint_filename="remd.chk", swap_interval=10):
        temps = np.zeros(shape=len(trajectories))
        for idx, traj in enumerate(trajectories):
            assert isinstance(traj, presto.trajectory.Trajectory), "all trajectories must be EquilibrationTrajectories"
            assert traj.timestep == trajectories[0].timestep, "all trajectories must have same ``timestep``"
            assert traj.stop_time == trajectories[0].stop_time, "all trajectories must have same ``stop_time``"
            assert np.array_equal(traj.high_atoms, trajectories[0].high_atoms), "all trajectories must have same ``high_atoms``"
            assert np.array_equal(traj.active_atoms, trajectories[0].active_atoms), "all trajectories must have same ``active_atoms``"

        self.trajectories = sorted(trajectories, key=lambda x: x.bath_scheduler(0))
        self.stop_time = trajectories[0].stop_time

        self.swaps = list()
        assert isinstance(swap_interval, (float, int))
        assert swap_interval % trajectories[0].timestep == 0, "swap_interval must be a multiple of timestep"
        self.swap_interval = swap_interval

        assert isinstance(checkpoint_filename, str)
        self.checkpoint_filename = checkpoint_filename
        self.finished = False
        self.current_idx = 0

        self.load()

    def __str__(self):
        return f"ReplicaExchange({len(trajectories)} trajectories, swap_interval={swap_interval} fs, checkpoint_file={checkpoint_filename})"

    def __repr__(self):
        return f"ReplicaExchange({len(trajectories)} trajectories, swap_interval={swap_interval} fs, checkpoint_file={checkpoint_filename})"

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
            logger.info(f"Loaded ReplicaExchange from {self.checkpoint_filename}.")
        return self

    def run(self):
        if self.finished:
            logger.info(f"Replica exchange already finished!")
            return self

        processes = [None]*len(self.trajectories)
        start_idx = self.current_idx

        # we break the runs up into small chunks
        for current_idx in range(start_idx, int(self.stop_time/self.swap_interval)):
            next_idx = current_idx + 1
            target_time = next_idx * self.swap_interval
            for idx, traj in enumerate(self.trajectories):
                # how long does each traj need to run for?
                time_remaining = max(0, target_time - traj.last_time_run())

                if time_remaining:
                    processes[idx] = mp.Process(target=traj.run, kwargs={
                        "time": self.swap_interval,
                        "checkpoint_interval": min(MIN_CHECKPOINT_INTERVAL, self.swap_interval),
                    })
                    processes[idx].start()

            for process in processes:
                if process is not None:
                    process.join()

            for traj in self.trajectories:
                traj.load_from_checkpoint()
                assert traj.last_time_run() == target_time

            self.exchange(next_idx*self.swap_interval)
            self.current_idx = next_idx
            self.save()
        self.finished = True
        return self

    def exchange(self, time):
        kB = presto.constants.BOLTZMANN_CONSTANT

        for i in range(len(self.trajectories)-1):
            j = i+1

            E_i = self.trajectories[i].frames[-2].energy
            E_j = self.trajectories[j].frames[-2].energy
            T_i = self.trajectories[i].bath_scheduler(0)
            T_j = self.trajectories[j].bath_scheduler(0)
            b_i = 1 / (kB*T_i)
            b_j = 1 / (kB*T_j)

            p = min(1, np.exp( (E_i - E_j) * (b_i - b_j) ) )
            logger.info(f"E{i} & E{j}\tp={p}")

            if p > random.random():
                v_i_scaling = np.sqrt(T_j/T_i)
                v_j_scaling = np.sqrt(T_i/T_j)

                frame_i = self.trajectories[i].frames[-1]
                frame_j = self.trajectories[j].frames[-1]
                frame_i.velocities *= v_i_scaling
                frame_j.velocities *= v_j_scaling

                self.trajectories[i].frames[-1] = frame_j
                self.trajectories[j].frames[-1] = frame_i

                self.swaps.append({"time": time, "i": i, "j": j})
                logger.info(f"\nReplicas {i} & {j} swapped after {time} fs!\t{E_i} {E_j} p={p}")

    def report(self):
        counts = np.zeros(shape=len(self.trajectories))
        possible = self.current_idx * (len(self.trajectories) - 1)

        for swap in self.swaps:
            counts[swap["i"]] += 1

        text = f"Time: {self.current_idx * self.swap_interval} fs\n"
        text += f"Exchange probability: {np.sum(counts)/possible:.2%}\n"
        for i in range(len(self.trajectories) - 1):
            text += f"\tReplica {i} <=> Replica {i+1}  \t{counts[i]/self.current_idx:.2%}\n"

        return text
