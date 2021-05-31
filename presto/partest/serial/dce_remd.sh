#!/bin/bash
#SBATCH --job-name=dce_remd_p2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=day
#SBATCH -t 15:00:00
#SBATCH --mem-per-cpu=8100mb
#SBATCH --mail-type=END,FAIL

module purge
module load SciPy-bundle
module load miniconda
module load Gaussian
source activate presto-d

python ./run.py


