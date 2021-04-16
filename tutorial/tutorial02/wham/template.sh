#!/bin/bash
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p serial_requeue
#SBATCH --mem=40000
#SBATCH -t 10080
#SBATCH -J presto_tBuCl_wham_NAME
#SBATCH -o logfiles/NAME.slurm
#SBATCH -e logfiles/NAME.slurm

python3.7 run.py NAME
