# Parallelized replica exchange molecular dynamics (REMD) in _presto_

## Table of Contents

1. [Overview](#overview)
2. [Input and Output](#input-and-output)
3. [Instructions](#instructions)
4. [Parallelizing REMD with Slurm](#parallelizing-remd-with-slurm)
5. [Analyzing the REMD run](#analyzing-the-remd-run)

## Overview

A challenge in conventional molecular dynamics (MD) is the propensity for the system to be trapped in local potential energy minima. This issue is even more pronounced in the context of _ab initio_ MD, because the cost of simulating each timestep is higher.  [Replica exchange molecular dynamics](http://www.math.pitt.edu/~cbsg/Materials/Earl_ParallelTempering.pdf) (REMD), also known as parallel tempering, is an established approach to accelerate exploration of the potential energy surface.

In _presto_, REMD is implemented as a loop:

1. Run _n\_trajs_ trajectories with temperatures uniformly spanning _mintemp_ and _maxtemp_, for time _swap\_interval_.
2. Collect all the trajectories and make a pass through them, exchanging configurations between adjacent trajectories based on the Metropolis criterion.
3. Repeat until _stop\_time_.

The bottleneck in this loop is step (1), which is fortunately embarrassingly parallel. Huge gains in computation time can be realized by running the trajectories in parallel, subject to computational resources. More details about the parallel implementation can be found [below](#parallelizing-remd-with-slurm).

## Input and Output

This implementation of parallelized REMD requires the [Slurm](https://Slurm.schedmd.com/documentation.html) scheduling system, and assumes that jobs are submitted using `sbatch <jobscript>`.

### Provided files

1. `scripts/remd_par_manager.py`: manager script that handles the main REMD loop
   - `--checkpoint_filename`: path to checkpoint file (default remd.chk)
   - `--input`: path of input geometry (.xyz)
   - `--template`: path to [config file](https://github.com/corinwagen/presto/blob/master/CONFIG.md) (default template.yaml)
   - `--mintemp`: minimum trajectory temperature in K
   - `--maxtemp`: maximum trajectory temperature in K
   - `--trajs`: number of trajectories
   - `--swap`: length of swap interval in fs (default 2000)

   Run `$ python run_remd_par.py --help` for more details and options.
2. `scripts/run_traj_temp.py`: auxiliary script to run individual trajectories, not intended to be called alone
3. `presto/replica_exchange_par.py`: contains the ReplicaExchange class

### User-supplied files

1. a template for the .yaml config file, with the `target_temp` field filled with \<TEMP\>. The intended runtime of the trajectories is supplied here in the `stop_time` field, as with a usual single-trajectory run.
2. the geometry input file, in `.xyz` format
3. `remd_<jobname>.sh`: Slurm submit script for `remd_par_manager.py`. Example:

   ```sh
       #!/bin/bash
       #SBATCH --job-name=remd_par_manager
       #SBATCH --output=slurm-remd_par_manager.out
       #SBATCH --open-mode=append
       #SBATCH --ntasks=1
       #SBATCH --cpus-per-task=1
       #SBATCH --partition=day
       #SBATCH -t 00:05:00
       #SBATCH --mem-per-cpu=4000mb
       #SBATCH --mail-type=END,FAIL

       # add the path to run_remd_par.py if necessary. Remove --spawn whenever calling manually
       python run_remd_par.py --input geom.xyz --mintemp 300 --maxtemp 400 --trajs 3 --template template.yaml
   ```

4. `traj_array.sh`: Slurm submit script for `scripts/run_traj_temp.py`, not intended to be called by the user. Example:

   ``` sh
       #!/bin/bash
       ### this file is not intended to be sbatch'ed on its own
       #SBATCH --job-name=remd_traj_array_fs
       #SBATCH --output=slurm-traj_arrays.out
       #SBATCH --open-mode=append
       #SBATCH --ntasks=1
       ## do not modify above this line
       # set array indices from 0 to (number of trajectories - 1)
       #SBATCH --array=0-2
       # settings below are per-trajectory
       #SBATCH --cpus-per-task=4
       #SBATCH --mem-per-cpu=8000mb
       #SBATCH -t 00:15:00
       #SBATCH --partition=day
 
       # add the path to run_traj_temp.py and the name of your checkfile after -c 
       python run_traj_temp.py -i $SLURM_ARRAY_TASK_ID -c remd.chk
 
   ```

### Output files

1. `<temp>k.chk`: checkpoint file for a trajectory at \<temp\> K. Examine the trajectory with `scripts/analyze.py`.
2. `remd_par.log`: log file for all running modules. Use this file to monitor trajectory progress and check for warnings.
3. `remd.chk`: checkpoint file for `ReplicaExchange` object. Contains a pickled `ReplicaExchange` object that is loadable with `presto.replica_exchange_par.ReplicaExchange.load()`.
4. `slurm-remd_par_manager.out`: Slurm output file from manager script. Contains tracebacks of critical unhandled exceptions (look at this file if the job unexpectedly terminates).
5. `slurm-traj_arrays.out`: Slurm output file from run_traj_temp.py submit script. Rarely useful.

## Instructions

1. If necessary, load the requisite software modules (Anaconda, Gaussian, xTB), e.g. `module load Gaussian`. Activate the presto virtual environment, e.g. `$ conda activate presto`.

2. Ensure that After setting up all the necessary files, initiate the run using `$ sbatch remd_<jobname>.sh`.

   The only practical resource limitation is that the runtime of each trajectory for the swap interval (e.g. 50 fs) on one node cannot exceed the walltime of the cluster/partition. The total REMD runtime (`stop_time` in the config file) is restricted only by `sys.maxint` and the available storage for the trajectory checkpoint files; the number of trajectories is additionally restricted by the system-dependent Slurm `MaxArraySize` configuration parameter (usually 4E6).

3. This slurm script will start a job named `remd_par_manager`, which will initiate a Slurm job array named `remd_traj_array_<current time>fs`.

4. The manager script will spawn another instance of itself (`remd_par_manager`), which will start running when the job array is completed.

5. When the REMD run ends, each trajectory can be examined by running `scripts/analyze.py` on its .chk file.

6. To prematurely cancel the run, execute `$ scancel <jobid>` on the `remd_par_manager` job.

## Parallelizing REMD with Slurm

_This is meant as a developer's note, i.e. not required reading._

This implementation leverages the [Slurm job array](https://Slurm.schedmd.com/job_array.html) feature to run trajectories as individual Slurm jobs within a Slurm job array.

In summary, for every _swap\_interval_ chunk,

1. The manager script creates a `ReplicaExchange` object or loads one from the checkpoint file.
2. ReplicaExchange.run() is called, which writes a Slurm submit script for the job array consisting of _n\_trajs_ independent calls to the auxiliary script.
3. The manager script submits itself as a new job to the Slurm scheduler, with a dependency on completion of the job array.
4. Each instance of the auxiliary script runs one trajectory (`presto.trajectory.run()`) and saves the trajectory to its own checkpoint file (e.g. 300k.chk)
5. The new manager script instance is run, which assembles the newly completed trajectories into the `ReplicaExchange` object and exchanges the configurations, and saves the `ReplicaExchange` object to the checkpoint file.

This approach

- parallelizes the trajectory runs
- sidesteps limitations on the total REMD runtime due to cluster walltime limits
- sidesteps limitations on the number of trajectories due to the maximum number of nodes available

The one notable drawback occurs in cases where each _swap\_interval_ chunk takes a short time to run, because the trajectory runs are resubmitted as new jobs after each _swap\_interval_—this incurs the usual cost of scheduling and waiting for new resources to become available. In any reasonable use case, this drawback pales in comparison to the computation time of serialized REMD, or in an MPI implementation, the time required for a large number of nodes and cores to become simultaneously available.

## Analyzing the REMD run

### Reconstructing the temperature evolution of each replica

In REMD, efficient diffusion of configurations between temperatures is desired. _presto_ keeps tracks of the swaps performed after each _swap\_interval_ in the REMD checkpoint file, and provides a script (`scripts/remd_demux.py`) to demultiplex (or "demux") the trajectories, enabling the user to examine the walks taken by each replica through temperature space.

**Required files**:

1. checkpoint file to *completed* REMD run.
2. checkpoint files for all the trajectories (e.g. `300k.chk`).
3. `scripts/remd_demux.py`

To use, execute `$ python remd_demux.py --checkpoint_filename <path to .chk of completed REMD run>`.

**Output files**:

1. checkpoint files for the demuxed trajectories (e.g. `300k_demux.chk`)
2. PDB files containing the demuxed trajectories (e.g. `300k_demux.pdb`)
3. CSV files containing the temperature evolutions of each trajectory (e.g. `traj0.csv`). The first column contains the _index_ of the temperature, not the temperature in K. These data can be visualized in your favorite program.

### Cluster analysis

We often want to visualize the (relative) distributions of internal coordinates throughout an MD trajectory, e.g. _phi_ and _psi_ angles in peptides. A script `scripts/traj_cluster.py` is provided to plot the kernel density-estimated distributions of up to two internal coordinates (distance, length, dihedral) given a trajectory checkpoint file.

The `seaborn` package (`$ conda install seaborn`) is used for visualization.

**Required files**:

1. `scripts/traj_cluster.py`
   - `--checkpoint_filename`: path to trajectory checkpoint file (e.g. `300k.chk`)
   - `--distance`: a pair of atom indices (1-indexed)
   - `--angle`: three atom indices (1-indexed)
   - `--dihedral`: four atom indices (1-indexed)

   Specify up to two internal coordinates. Examples of acceptable combinations are:
   - `$ python traj_cluster.py -c 300k.chk --distance 3 4`
   - `$ python traj_cluster.py -c 300k.chk --distance 3 4 --angle 8 1 3`
   - `$ python traj_cluster.py -c 300k.chk --dihedral 17 20 8 7 --angle 1 2 5`

2. checkpoint file for the trajectory

**Output files**:

1. a PNG file containing the single distribution plot or joint distribution plot for the specified internal coordinates.
