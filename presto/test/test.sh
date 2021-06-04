#!/bin/bash
#SBATCH --job-name=test
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=day
#SBATCH -t 1:00:00
#SBATCH --mem-per-cpu=6000mb
#SBATCH --mail-type=END,FAIL

module purge
module load miniconda
source activate presto-d

python slurm_submit.py --spawn


