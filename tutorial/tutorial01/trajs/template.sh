#!/bin/bash
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p jacobsen2
#SBATCH --mem=40000
#SBATCH -t 5000
#SBATCH -J presto_NAME
#SBATCH -o logfiles/NAME.slurm
#SBATCH -e logfiles/NAME.slurm

mkdir /scratch/cwagen-gaussian
cp /n/jacobsen_lab/cwagen/presto/gaussian/run_gaussian.sh /scratch/cwagen-gaussian/
mkdir /scratch/cwagen-xtb
cp /n/jacobsen_lab/cwagen/presto/xtb/run_xtb.sh /scratch/cwagen-xtb/
python3.7 run.py NAME
