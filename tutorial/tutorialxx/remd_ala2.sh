#!/bin/bash
#SBATCH --job-name=remd_par_manager_ala2
#SBATCH --output=slurm-remd_par_manager.out
#SBATCH --open-mode=append
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH -t 00:10:00
#SBATCH --mem-per-cpu=8000mb
#SBATCH --mail-type=FAIL
## partition is Yale cluster-specific
#SBATCH --partition=day

# Yale cluster-specific
# module purge 2>/dev/null
# module load miniconda 2>/dev/null

conda activate presto 2>/dev/null
python remd_par_manager.py --input ala2.xyz --swap 2000 --mintemp 300 --maxtemp 1000 --trajs 4 -t template.yaml
