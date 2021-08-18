# Config Files

## Overview

Config files are the simplest way to interact with *presto*.
Using config files allows for routine use of *presto* without having to interact with the underlying API, which is generally much safer and simpler.

*presto* config files are written in the [YAML](https://yaml.org/) format and are generally 20-100 lines long. 
Since no coordinates are stored in the config file, each one can be reused for multiple trajectories with identical run parameters (e.g. duplicates).

A *presto* trajectory can be created from a config file through ``presto.config.build``, as shown below:

```python
import presto

trajectory1 = presto.build("config.yaml", "checkpoint1.chk", geometry="solvated_ts.xyz")
trajectory2 = presto.build("config.yaml", "checkpoint2.chk", geometry="solvated_ts.xyz")
```

## Options

Here are a list of all the possible top-level config file options.

### Required

**``type``**: What type of trajectory this file represents. Must be either ``reaction`` or ``equilibration``.

**``timestep``**: The desired timestep, in femtoseconds (usually 0.5 or 1).

**``stop_time``**: The maximum run time, in femtoseconds.

**``integrator``**:

**``calculator``**: The program(s) used to calculate energies and forces. Currently available options are `gaussian`, `xtb`, `orca`, and `oniom`. The available options and their defaults are listed below.

1. Gaussian calculator:

   ```yaml
   calculator:
    type: gaussian
    charge: 0 
    multiplicity: 1 
    route_card: "#p hf/3-21g force"
    link0:
        nprocshared: 4
        mem: "1GB"
    gaussian_chk: 
    footer: 
   ```

   `route_card` must start with `#p` and contain the `force` keyword. `gaussian_chk` is a string with the desired name of the Gaussian checkpoint file (defaults to `None`), and allows Gaussian to use the wavefunction in the previous checkpoint file as a starting guess for the next frame, affording speedups in many cases. `footer` is a string with any directives that you want to include at the bottom of the Gaussian input file (defaults to `None`).

2. xTB calculator

   ```yaml
   calculator:
    type: xtb
    charge: 0 
    multiplicity: 1 
    gfn: 2
    parallel: 1
    xcontrol_path: 
    topology: 
   ```

   `gfn` can take values `1`, `2`, and `ff`. `xcontrol_path` is a string containing the path to the .xcontrol file (defaults to None). `topology` path to the GFN-FF topology file, if applicable (defaults to None).

3. ORCA calculator

   ```yaml
   calculator:
    type: orca
    charge: 0 
    multiplicity: 1 
    keyword_line: "! HF-3c engrad nopop smallprint",
    nprocs: 4
    maxcore: 4000
    autostart: True
   ```

   `keyword_line` must start with `! ` and contain the `engrad` keyword. `maxcore` is an integer in units of MB. `autostart` allows ORCA to use the orbitals in the previously generated .gbw file as a starting guess for the next frame.

4. ONIOM calculator

   ```yaml
   calculator:
       type: oniom
       low_calculator:
           type: orca
           keyword_line: "! HF-3c engrad nopop smallprint"
           nprocs: 4
           maxcore: 8000
       high_calculator:
           type: gaussian
           route_card: "#p force b3lyp/6-31g(d) empiricaldispersion=gd3bj pop=none"
           link0:
               nprocshared: 4
               mem: "8GB"
   ```

   A combination of two calculators from (1) to (3). Use together with the `high_atoms` setting (see below). Note that ORCA, unlike Gaussian and xTB, is MPI-parallel. A user will have to request resources for *both* ORCA and Gaussian/xTB, i.e. `#SLURM --ntasks=4 #SLURM --cpus-per-task=4` for the above example.

### Optional

Lists of atoms (for **``high_atoms``**, **``active_atoms``**, and **``inactive_atoms``**) can be specified as individual atom numbers or as ranges. 
Ranges are inclusive on both ends.
For instance, ``high_atoms: 1-4, 7, 9`` will be parsed into the list ``[1, 2, 3, 4, 7, 9]``.

**``high_atoms``**: Which atoms belong to the "high" ONIOM layer. Defaults to ``None``. 

**``active_atoms``**: Which atoms are active (all by default).

**``inactive_atoms``**: Which atoms are inactive. Will be overridden by **``active_atoms``** if both are present.

**``save_interval``**: Which frames to save. The default value of 1 saves every frame, while setting this to 10 will save every 10th frame.

**``checkpoint_interval``**: How frequently to save to the checkpoint file. The default value of 10 saves the trajectory to disk after every 10 frames.

**``anchor``**: If present, tells *presto* to apply a weak harmonic potential between the origin and the specified atom number, to keep a given molecule centered.

**``forwards``**: Whether to run a trajectory forwards in time (``True``, default) or backwards (``False``). 
You would only want to run a ``ReactionTrajectory`` backwards in time, usually from a transition state.

**``potential``**:

**``bath_scheduler``** (``EquilibrationTrajectory`` only): 

**``constraints``**:

* **``fadein``

**``initialization``** (``ReactionTrajectory`` only):

* **``output_file``**
    
* **``temperature``**
    
* **``init_method``**
   
* **``max_attempts``**
    
* **``tolerance``**

**``termination_function``** (``ReactionTrajectory`` only):

**``monitor``**:

