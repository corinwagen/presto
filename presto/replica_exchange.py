# presto/presto/replica_exchange.py
# Jul 2021

import numpy as np
import logging
import random
import sys
import subprocess
import presto
import dill
import re
import os
import yaml
import multiprocessing as mp

logger = logging.getLogger(__name__)

MIN_CHECKPOINT_INTERVAL = 50

class MissingSbatchFlags(Exception):
    pass

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
    def __init__(self, trajectories, checkpoint_filename="remd.chk", swap_interval=100):
        for traj in trajectories:
            assert isinstance(traj, presto.trajectory.EquilibrationTrajectory), "all trajectories must be EquilibrationTrajectories"
            assert traj.timestep == trajectories[0].timestep, "all trajectories must have same ``timestep``"
            assert traj.stop_time == trajectories[0].stop_time, "all trajectories must have same ``stop_time``"
            assert np.array_equal(traj.high_atoms, trajectories[0].high_atoms), "all trajectories must have same ``high_atoms``"
            assert np.array_equal(traj.active_atoms, trajectories[0].active_atoms), "all trajectories must have same ``active_atoms``"

        # sort by temp
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

        # prevent parallel class from loading
        if not isinstance(self, ReplicaExchangeParallel): 
            self.load()

    def __str__(self):
        return f"ReplicaExchange({len(self.trajectories)} trajectories, swap_interval={self.swap_interval} fs, checkpoint_file={self.checkpoint_filename})"

    def __repr__(self):
        return f"ReplicaExchange({len(self.trajectories)} trajectories, swap_interval={self.swap_interval} fs, checkpoint_file={self.checkpoint_filename})"

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

        # we break the runs up into small chunks of size swap_interval
        # each trajectory is basically run in parallel for time swap_interval in each iter
        # we make as many mp.Process objects as there are trajectories
        for current_idx in range(start_idx, int(self.stop_time/self.swap_interval)):
            next_idx = current_idx + 1
            target_time = next_idx * self.swap_interval
            
            for idx, traj in enumerate(self.trajectories):
                # how long does each traj need to run for?
                # the last iter may have time_remaining \neq swap_interval
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
            # all the chunks in this iter are done

            # run saves frames to chk file, so this ensures that run is done and saved properly
            for traj in self.trajectories:
                traj.load_from_checkpoint()
                assert traj.last_time_run() == target_time

            self.current_idx = next_idx
            self.exchange() # TODO: make sure calling exchange without time is ok
            self.save()
        self.finished = True
        return self

    def exchange(self):
        """ time is from 0
        """
        time = self.current_idx * self.swap_interval
        kB = presto.constants.BOLTZMANN_CONSTANT
        
        # make one pass from low to high T
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
                # or momenta scaling
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
        # len of counts is no of temps
        possible = self.current_idx * (len(self.trajectories) - 1)

        for swap in self.swaps:
            counts[swap["i"]] += 1

        text = f"Time: {self.current_idx * self.swap_interval} fs\n"
        text += f"Exchange probability: {np.sum(counts)/possible:.2%}\n"
        for i in range(len(self.trajectories) - 1):
            text += f"\tReplica {i} <=> Replica {i+1}  \t{counts[i]/self.current_idx:.2%}\n"

        return text

class ReplicaExchangeParallel(ReplicaExchange):
    """
    Runs several trajectories and manages interconversions between them. Slurm-parallelized version.

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

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def update_trajs(self):
        """
        Updates all trajectories from respective chk files on newly unpickled remd object
        Not run in the first iteration
        Does not modify any files
        """
        self.current_idx += 1

        for traj in self.trajectories:
            traj.load_from_checkpoint(frames=slice(-2, None, None))
            # need last two frames to do exchange
            # ensure all the trajectories are run up to the same time
            assert traj.last_time_run() == self.current_idx * self.swap_interval, "ensure that trajectories all ended at the same time"

        if self.current_idx * self.swap_interval == self.stop_time:
            self.finished = True

    def run(self, slurm=True):
        """ generates a (slurm) job array for trajectories in each segment and submits it
        """

        # always self.update_trajs before self.run
        if self.finished:
            logger.info(f"Replica exchange already finished!")
            return self

        next_idx = self.current_idx + 1
        target_time = next_idx * self.swap_interval

        if isinstance(self.trajectories[0].calculator, presto.calculators.XTBCalculator):
            n_threads = self.trajectories[0].calculator.parallel
        elif isinstance(self.trajectories[0].calculator, presto.calculators.GaussianCalculator):
            n_threads = int(
                self.trajectories[0].calculator.link0["nprocshared"])

        if slurm:
            slurm_script = 'traj_array.sh'

            assert os.path.exists(slurm_script), "The Slurm submit script traj_array.sh is required but not found"

            # dict to ensure that (some) necessary sbatch options are specified
            sbatch_flags = {'-J': False, '-c': False, '--array': False}
            with open(slurm_script, 'r') as f:
                source = f.read().splitlines()  # no newline in source

            with open(slurm_script, 'w') as f:
                for line in source:
                    if "job-name" in line or '-J ' in line:
                        # modify job name appropriately
                        line = re.sub('array_(.*?)fs', f'array_{target_time}fs', line)
                        sbatch_flags['-J'] = True
                    elif "cpus-per-task" in line or '#SBATCH -c' in line:
                        # check if cpus-per-task is equal to n_threads
                        sbatch_flags['-c'] = True
                        thread_match = re.search('(\d+)$', line)
                        input_threads = int(thread_match.group())
                        if input_threads != n_threads:
                            line = re.sub('(\d+)$', str(n_threads), line)
                            logger.warning(
                                "--cpus-per-task in traj_array.sh is not equal to number of processors specified in config file, automatically changing")
                    elif "--array" in line:
                        # check if array size is equal to num of trajs
                        input_trajs = int(re.search('(\d+)$', line).group())
                        sbatch_flags['--array'] = True
                        if input_trajs != len(self.trajectories) - 1:
                            line = re.sub('(\d+)$', str(len(self.trajectories) - 1), line)
                            logger.warning(
                                "--array size in traj_array.sh is not equal to number of trajectories specified when calling remd_par_manager.py, automatically changing")
                    
                    f.write(line+'\n')

                for k, v in sbatch_flags.items():
                    if not v:
                        logger.error(
                            f"did not specify sbatch option {k} in traj_array.sh, exiting now")
                        sys.exit(1)

            try:
                sbatch_msg = subprocess.check_output(
                    ['sbatch', slurm_script])
                if 'Submitted' not in sbatch_msg.decode('utf-8'):
                    raise subprocess.CalledProcessError

            except subprocess.CalledProcessError as e:
                logger.error("Could not submit slurm job array script")
                sys.exit(1)
            logger.info("Wrote and submitted traj_array.sh")
            return int(sbatch_msg.split()[-1])  # slurm jobid of the

    def exchange(self):
        """ time is from 0
            Saves updates trajectories to trajectory chkfiles
        """
        super().exchange()

        for traj in self.trajectories:
            traj.save()

    def save(self):
        """
        Saves ReplicaExchange object to chkfile (pickle), keeping only the last frame of each trajectory

        """
        for traj in self.trajectories:
            traj.frames = [traj.frames[-1]]

        with (open(self.checkpoint_filename, "wb")) as f:
            dill.dump(self, f, protocol=-1)  # HIGHEST_PROTOCOL

        logger.info(f"Saved ReplicaExchange to {self.checkpoint_filename}.")

    @classmethod
    def load(cls, checkpoint):
        """ Loads ReplicaExchange object from chkfile

        Returns:
            ReplicaExchange object
        """

        try:
            with (open(checkpoint, "rb")) as f:
                remd = dill.load(f)
        except FileNotFoundError:
            print(
                "checkpoint file not found, do not call this script with --spawn on the first instance")
        logger.info(f"Loaded ReplicaExchange from {checkpoint}.")

        return remd
