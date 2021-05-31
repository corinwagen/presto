#!/bin/bash
#SBATCH --job-name=dce_remd_par
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=8
#SBATCH --partition=day
#SBATCH -t 1:00:00
#SBATCH --mem-per-cpu=8100mb
#SBATCH --mail-type=END,FAIL

module purge
module load miniconda
source activate presto-d

mpiexec python run.py


