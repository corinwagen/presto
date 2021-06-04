# presto/presto/replica_exchange_par.py
# Marcus Sak, Jun 2021
# parallel ReplicaExchange class

import numpy as np
import logging
import random
import sys
import subprocess
import presto

logger = logging.getLogger(__name__)

MIN_CHECKPOINT_INTERVAL = 50

class ReplicaExchange():
    """
    Runs several trajectories and manages interconversions between them.

    Based on:
        http://www.math.pitt.edu/~cbsg/Materials/Earl_ParallelTempering.pdf
    """

    def __init__(self, trajectories, checkpoint_filename="remd.chk", swap_interval=10):
        for idx, traj in enumerate(trajectories):
            assert isinstance(
                traj, presto.trajectory.EquilibrationTrajectory), "all trajectories must be EquilibrationTrajectories"
            assert traj.timestep == trajectories[0].timestep, "all trajectories must have same ``timestep``"
            assert traj.stop_time == trajectories[0].stop_time, "all trajectories must have same ``stop_time``"
            assert np.array_equal(
                traj.high_atoms, trajectories[0].high_atoms), "all trajectories must have same ``high_atoms``"
            assert np.array_equal(
                traj.active_atoms, trajectories[0].active_atoms), "all trajectories must have same ``active_atoms``"

        # sort by temp
        self.trajectories = sorted(
            trajectories, key=lambda x: x.bath_scheduler(0))
        self.stop_time = trajectories[0].stop_time

        self.swaps = list()
        assert isinstance(swap_interval, (float, int))
        assert swap_interval % trajectories[0].timestep == 0, "swap_interval must be a multiple of timestep"
        assert self.stop_time % swap_interval == 0, "stop time must a multiple of timestep"
        self.swap_interval = swap_interval

        assert isinstance(checkpoint_filename, str)
        self.checkpoint_filename = checkpoint_filename
        self.finished = False
        self.current_idx = 0

    def __str__(self):
        return f"ReplicaExchange({len(self.trajectories)} trajectories, swap_interval={self.swap_interval} fs, checkpoint_file={self.checkpoint_filename})"

    def __repr__(self):
        return f"ReplicaExchange({len(self.trajectories)} trajectories, swap_interval={self.swap_interval} fs, checkpoint_file={self.checkpoint_filename})"

    def update_trajs(self):
        """
        Updates all trajectories from respective chk files on newly unpickled remd object
        Not run in the first iteration
        """
        self.current_idx += 1

        for traj in self.trajectories:
            traj.load_from_checkpoint()
            # ensure all the trajectories are run up to the same time
            assert traj.last_time_run() == self.current_idx * self.swap_interval

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

        #time_remaining = max(
        #    0, target_time - self.trajectories[0].last_time_run())

        #if not time_remaining:
        #    return

        #temps_str = ','.join([str(temp) for temp in self.temps])

        is_gaussian = False
        if isinstance(self.trajectories[0].calculator, presto.calculators.XTBCalculator):
            n_threads = self.trajectories[0].calculator.parallel
        elif isinstance(self.trajectories[0].calculator, presto.calculators.GaussianCalculator):
            is_gaussian = True
            n_threads = int(
                self.trajectories[0].calculator.link0["nprocshared"])

        if slurm:
            with open(f"traj_array.sh", 'w') as f:
                f.write("#!/bin/bash\n")
                f.write(f"#SBATCH --job-name=remd_traj_array_{target_time}fs\n")
                f.write(f"#SBATCH --output=slurm-traj_arrays.out\n")
                f.write(f"#SBATCH --open-mode=append\n")
                f.write(f"#SBATCH --ntasks=1\n")
                f.write(f"#SBATCH --cpus-per-task={n_threads}\n")
                f.write(f"#SBATCH --array=0-{len(self.trajectories)-1}\n")
                f.write(f"#SBATCH --partition=day\n")
                # TODO: modifiable time and mem?
                f.write(f"#SBATCH -t 00:15:00\n")
                f.write(f"#SBATCH --mem-per-cpu=8000mb\n")
                #f.write(f"#SBATCH --mail-type=END,FAIL\n")
                f.write("\n")
                f.write(f"module purge\n")
                # TODO: needs to be modifiable, maybe use template file
                # load anaconda module
                f.write(f"module load miniconda\n")
                #f.write(f"source /gpfs/loomis/apps/avx/software/miniconda/4.9.2/etc/profile.d/conda.sh\n")
                # load gaussian module
                if is_gaussian:
                    f.write(f"module load Gaussian\n")
                #activate presto venv
                f.write(f"conda activate presto-d\n")
                f.write(f"python run_traj_temp.py -i $SLURM_ARRAY_TASK_ID -c {self.checkpoint_filename}\n")

            try:
                sbatch_msg = subprocess.check_output(['sbatch', 'traj_array.sh'])
                if 'Submitted' not in sbatch_msg.decode('utf-8'):
                    raise subprocess.CalledProcessError

            except subprocess.CalledProcessError as e:
                logger.error("Could not submit slurm job array script")
                sys.exit(1)

            return int(sbatch_msg.split()[-1]) # slurm jobid of the 

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

            p = min(1, np.exp((E_i - E_j) * (b_i - b_j)))
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
                logger.info(
                    f"\nReplicas {i} & {j} swapped after {time} fs!\t{E_i} {E_j} p={p}")

        for traj in self.trajectories:
            traj.save()

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
