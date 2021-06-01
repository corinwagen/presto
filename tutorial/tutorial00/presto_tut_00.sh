#!/bin/bash
#SBATCH --job-name=presto_tut_00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=day
#SBATCH -t 00:05:00
#SBATCH --mem-per-cpu=8000mb
#SBATCH --mail-type=END,FAIL

module load miniconda
conda activate presto-d

python test_presto.py


