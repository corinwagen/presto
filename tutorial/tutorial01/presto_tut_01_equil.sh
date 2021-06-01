#!/bin/bash
#SBATCH --job-name=presto_tut_00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --partition=day
#SBATCH -t 24:00:00
#SBATCH --mem-per-cpu=9000mb
#SBATCH --mail-type=END,FAIL

module load miniconda
conda activate presto

python run.py


