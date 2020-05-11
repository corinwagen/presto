#!/bin/bash 

#SBATCH -N 1        # number of nodes

#SBATCH -n 16   # number of cores 

#SBATCH -p serial_requeue # partition to submit to 

#SBATCH --mem=34000  # memory per node in MB (see also --mem-per-cpu)

#SBATCH -t 7200 # expected runtime in minutes

#SBATCH -J presto_500-waters_Langevin_GFN0-xtb # name of this job

python test/run_water.py
