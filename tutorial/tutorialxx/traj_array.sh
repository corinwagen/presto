#!/bin/bash
### this file is not intended to be sbatch'ed on its own
#SBATCH --job-name=remd_traj_array_4000fs
#SBATCH --output=slurm-traj_arrays.out
#SBATCH --open-mode=append
#SBATCH --ntasks=1
## do not modify above this line
## set array indices from 0 to (number of trajectories - 1)
#SBATCH --array=0-3
# settings below are allocated per-trajectory
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=8000mb
#SBATCH -t 01:00:00
## partition is Yale cluster-specific
#SBATCH --partition=day

python traj_array.py -i $SLURM_ARRAY_TASK_ID --checkpoint_filename remd.chk
