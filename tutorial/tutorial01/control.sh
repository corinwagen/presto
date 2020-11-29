#!/bin/bash
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p serial_requeue
#SBATCH --mem=40000
#SBATCH -t 10080
#SBATCH -J presto_tutorial_preequil

mkdir /scratch/cwagen-gaussian
cp /n/home03/cwagen/Jacobsen/presto/gaussian/run_gaussian.sh /scratch/cwagen-gaussian/
mkdir /scratch/cwagen-xtb
cp /n/home03/cwagen/Jacobsen/presto/xtb/run_xtb.sh /scratch/cwagen-xtb/
python3.7 run.py
