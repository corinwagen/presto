#!/bin/bash
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -p serial_requeue 
#SBATCH --mem=10000
#SBATCH -t 1440
#SBATCH -J presto_ene_NAME
#SBATCH -o logfiles/NAME.slurm
#SBATCH -e logfiles/NAME.slurm

python run.py NAME
