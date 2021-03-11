# Config Files

## Overview

Config files are the simplest way to interact with *presto*.
Using config files allows for routine use of *presto* without having to interact with the underlying API, which is generally much safer and simpler.

*presto* config files are written in the [YAML](https://yaml.org/) format and are generally 20-100 lines long. 
Since no coordinates are stored in the config file, each one can be reused for multiple trajectories with identical run parameters (e.g. duplicates).

A *presto* trajectory can be created from a config file through ``presto.config.build``, as shown below:

```
import presto

trajectory1 = presto.config.build("config.yaml", "checkpoint1.chk", geometry="solvated_ts.xyz")
trajectory2 = presto.config.build("config.yaml", "checkpoint2.chk", geometry="solvated_ts.xyz")
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

**``potential``**:

**``bath_scheduler``** (``EquilibrationTrajectory`` only): 

**``constraints``**:

**``quasiclassical``** (``ReactionTrajectory`` only):

**``termination_function``** (``ReactionTrajectory`` only):

**``monitor``**:

