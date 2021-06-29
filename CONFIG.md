# Config Files

## Overview

Config files are the simplest way to interact with *presto*.
Using config files allows for routine use of *presto* without having to interact with the underlying API, which is generally much safer and simpler.

*presto* config files are written in the [YAML](https://yaml.org/) format and are generally 20-100 lines long. 
Since no coordinates are stored in the config file, each one can be reused for multiple trajectories with identical run parameters (e.g. duplicates).

A *presto* trajectory can be created from a config file through ``presto.config.build``, as shown below:

```
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

**``calculator``**:


### Optional

Lists of atoms (for **``high_atoms``**, **``active_atoms``**, and **``inactive_atoms``**) can be specified as individual atom numbers or as ranges. 
Ranges are inclusive on both ends.
For instance, ``high_atoms: 1-4, 7, 9`` will be parsed into the list ``[1, 2, 3, 4, 7, 9]``.

**``high_atoms``**: Which atoms belong to the "high" ONIOM layer. Defaults to ``None``. 

**``active_atoms``**: Which atoms are active (all by default).

**``inactive_atoms``**: Which atoms are inactive. Will be overridden by **``active_atoms``** if both are present.

**``save_interval``**: Which frames to save. The default value of 1 saves every frame, while setting this to 10 will save every 10th frame.

**``anchor``**: If present, tells *presto* to apply a weak harmonic potential between the origin and the specified atom number, to keep a given molecule centered.

**``forwards``**: Whether to run a trajectory forwards in time (``True``, default) or backwards (``False``). 
You would only want to run a ``ReactionTrajectory`` backwards in time, usually from a transition state.

**``potential``**:

**``bath_scheduler``** (``EquilibrationTrajectory`` only): 

**``constraints``**:

**``quasiclassical``** (``ReactionTrajectory`` only):

* **``output_file``**
    
* **``temperature``**
    
* **``init_method``**
   
* **``max_attempts``**
    
* **``tolerance``**

**``termination_function``** (``ReactionTrajectory`` only):

**``monitor``**:

