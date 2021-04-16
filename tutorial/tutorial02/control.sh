#!/bin/bash
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -p jacobsen2
#SBATCH --mem=40000
#SBATCH -t 10080
#SBATCH -J presto_tBuCl_equil

python3.7 run.py
