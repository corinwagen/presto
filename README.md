# presto

*Python-based Reactions in Explicit Solvent with Trajectories via ONIOM*

[![PyPI version](https://badge.fury.io/py/presto-md.svg)](https://badge.fury.io/py/presto-md)

## Introduction

*presto* is a Python 3-based package that runs QM/QM' molecular dynamics simulations of small organic molecules in spheres of explicit solvent (50-250 solvent molecules). *presto* is loosely based on Singleton’s *PROGDYN*, as described in recent publications on the [nitration of toluene](https://pubs.acs.org/doi/10.1021/jacs.6b07328) and [hydrochlorination of dienes](https://pubs.acs.org/doi/10.1021/jacs.0c06295), but is written in a modern and object-oriented style which permits easier extension and modification.

**IMPORTANT:**
*presto* is currently in "alpha": testing is ongoing and no guarantees as to correctness or API consistency can be made at this time. 
As of Fall 2020 the package approximately works, but bugs are certainly present in a project of this size.
If you are interesting in using *presto* or contributing as a developer, please let me know!

## Contents
- [Description](#description)
- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [Acknowledgements](#acknowledgements)
- [License](#license)


## Description


Conventional quantum chemical calculations (such as *ab initio* wavefunction methods and density functional theory) can describe chemical reactivity with high accuracy, but scale poorly with increasing system size. As a consequence, most computational analyses of organic reactions are performed in the gas phase with implicit solvation, which is unable to describe the behavior of many common species (e.g. ion pairs). In contrast, molecular dynamics permits the study of large, explicitly solvated systems, but the underlying molecular mechanics-based Hamiltonian renders such simulations unable to describe changes in bonding. *presto* seeks to combine elements of both approaches to permit the study of reactivity in explicit solvent. 

Following precedent by Singleton and others, *presto* employs the [ONIOM scheme](https://pubs.acs.org/doi/10.1021/cr5004419) developed by Morokuma to embed an accurate “high” system (typically modelled using DFT) inside a larger “low” system (modelled using semiempirical methods). Internally, *presto* repeatedly writes coordinates to each individual program and reads the corresponding energy and forces using [*cctk*](https://cctk.readthedocs.io/en/latest/). Currently, *presto* is compatible with Gaussian 16 and Stefan Grimme’s [*xtb*](https://github.com/grimme-lab/xtb/), but support for other programs can easily be added.

The speed of *presto* is entirely limited by the speed of the force calculations, which in turn depend on the size of the system. For medium-sized systems (10–20 heavy atoms) each individual DFT calculation takes about 30–90 seconds. The recommended timestep is 0.5 or 1.0 femtoseconds, resulting in an overall simulation speed of 1–2 picoseconds/day. If a faster simulation is desired, *xtb*-based methods can be used for both components of the ONIOM system: as with all computational projects, judicious benchmarking is key for determining the minimum acceptable level of theory. 

There are numerous challenges with running molecular dynamics that are not present with ordinary DFT calculations. Here are a few challenges, and the solutions chosen by *presto*:

- Edge effects can result in unrealistic solvation: only a vanishingly small percentage of solvent molecules are near an interface in a real (macroscopic) reaction, but a large fraction of the system is near the boundary for small spheres of solvent. Accordingly, *presto* confines the system of interest to the center of the solvent sphere with a shallow harmonic potential, ensuring that several solvent shells insulate the system from any boundaries. 

- An actual microdroplet of organic solvent would evaporate rapidly in the gas phase. To address this, *presto* applies a restoring force to any molecules which stray farther than a user-defined radius from the origin. This enforces a realistic solvent density and prevents evaporative cooling.

- Real reactions are in thermodynamic equilibrium with an external heat bath, and thus maintain a steady temperature by changing their total energy. However, conventional “thermostats” for molecular dynamics simulations result in unphysical dynamics, either by scaling particle velocities (Berendsen) or by inducing collisions with an imaginary heat bath (Langevin). *presto* employs the Langevin thermostat, but only for the outer solvent shells not directly in contact with the system of interest. Since the different layers of the droplet are in thermal equilibrium, this has the effect of controlling the entire system’s temperature while preserving realistic (non-Langevin) dynamics for the solute and its immediate environment.

- For all but the fastest reactions, the timescales accessible by molecular dynamics are insufficient to observe processes of interest. (At room temperature, it will take roughly 17,000 fs to observe a process with ∆G = 4.0 kcal/mol -- which is still a relatively low barrier for an organic reaction!) Accordingly, *presto* permits the addition of pairwise constraining potentials to study non-ground states (akin to a "scan" in electronic structure programs). The transition state can be located using biased sampling methods, and individual reaction trajectories can then be started from the region of the transition state. See the tutorial for more details.

*presto* is under active development by Corin Wagen (cwagen@g.harvard.edu). Please use the issues page for feature requests or bug reports, and contact me if you have more substantive inquiries.

## Dependencies

### External:
- [Gaussian 16](https://gaussian.com/gaussian16/)
- [*xtb*](https://github.com/grimme-lab/xtb)
- [*PACKMOL*](http://m3g.iqm.unicamp.br/packmol/home.shtml) (recommended, must be accessible via ``packmol`` from command line)
- [*wham*](http://membrane.urmc.rochester.edu/?page_id=126) (recommended)

### Internal:
- [`numpy`](https://numpy.org/)
- `pyyaml`
- `tabulate`, `tqdm`, `asciichartpy`
- `nglview` (if `Jupyter` visualization is desired)

## Getting Started

#### 1. Install *presto* and associated dependencies:
```
$ pip install presto-md
```

You may wish to create a ``conda`` environment for *presto* and associated packages, such as *xtb*:
```
$ conda create --name presto python=3.8 
$ pip install presto-md
$ conda install -c conda-forge xtb
```

#### 2. System-specific configuration:
*presto* requires scratch directories with which to communicate with external programs. 
These directories are specified by a config file, which *presto* finds via the environment variable ``$PRESTO_CONFIG``.

Both Gaussian and *xtb* require individual scratch directories with the scripts ``gaussian/run_gaussian.sh`` and ``xtb/run_xtb.sh`` inside them.
These scripts (located in the repo) should work out-of-the box for most environments, but may require modification for your system.

Here is an example config file:

```
### presto configuration ###
[xtb]
XTB_PATH = @auto # detect from conda
XTB_SCRIPT_DIRECTORY = ~/presto-testing/xtb/

[gaussian]
GAUSSIAN_SCRIPT_DIRECTORY = ~/presto-testing/gaussian/
```

After reading this file, *presto* will expect these directories to be present with the corresponding bash scripts.

#### 3. Running your first job

For each trajectory, *presto* requires both a config file and a checkpoint file.

A config file contains information about the run: how the forces will be computed, the desired temperature, runtime, and so forth. 
Config files are agnostic to molecular structure and can be recycled for many different trajectories; 
they are written in the ``.yaml`` format and are easily editable by hand.

A checkpoint file contains the masses, positions, forces, and accelerations of individual atoms at each timestep.
Checkpoint files are written in the ``.hdf5`` format and are not human-readable.
If your run is very long, the checkpoint file may grow to several gigabytes or more!
To begin a new run, either an ``.xyz`` geometry or a previous checkpoint file must be supplied to initialize the new checkpoint file.

Here, we will run molecular dynamics on a single benzene molecule using GFN2-xtb.

The config file (``test.yaml``) is shown here:

```
# presto config file
type: equilibration
timestep: 1
stop_time: 250
anchor: 1

integrator:
    type: langevin
    viscosity: 0.0001

calculator:
    type: xtb
    gfn : 2
    parallel: 8

bath_scheduler:
    type: constant
    target_temp: 298
```

This is a fairly simple config file: for more complex examples, see the attached tutorial.
(I will write a more comprehensive overview of all possible options and what they mean later).

We also need a starting geometry (``benzene.xyz``):

```
12
benzene
 C                 -3.00142242   -0.33428165    0.00000000
 C                 -1.60626242   -0.33428165    0.00000000
 C                 -0.90872442    0.87346935    0.00000000
 C                 -1.60637842    2.08197835   -0.00119900
 C                 -3.00120342    2.08190035   -0.00167800
 C                 -3.69880442    0.87369435   -0.00068200
 H                 -3.55118142   -1.28659865    0.00045000
 H                 -1.05675442   -1.28679465    0.00131500
 H                  0.19095558    0.87354935    0.00063400
 H                 -1.05617842    3.03412135   -0.00125800
 H                 -3.55132542    3.03418135   -0.00263100
 H                 -4.79840842    0.87387735   -0.00086200
 ```
 
Finally, we need an actual script to load and run our trajectory (``test_presto.py``):
 
```
import logging, presto
logging.basicConfig(level=logging.INFO, filename=f"test.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

traj = presto.config.build("test.yaml", "test.chk", geometry="benzene.xyz")
traj.run(checkpoint_interval=25)
```

Here, we initialize the ``logging`` module so we can monitor the progress of our trajectory.
We then initialize a ``presto.trajectory.Trajectory`` object from ``test.yaml`` and ``benzene.xyz``, creating ``test.chk`` in the process.
Finally, we run our trajectory, saving to ``test.chk`` every 25 frames.

This script should only take 1-2 minutes to run. After it finishes, you can see two new files:

```
(presto) [presto-testing]$ ls
gaussian  xtb  benzene.xyz  presto.config  test_presto.py  test.yaml
(presto) [presto-testing]$ python test_presto.py
(presto) [presto-testing]$ ls
gaussian  xtb  benzene.xyz  presto.config  test.chk  test.log  test_presto.py  test.yaml
(presto) [presto-testing]$ cat test.log
11-28 14:24 presto.trajectory  Initializing new equilibration trajectory...
11-28 14:24 presto.trajectory  Saving trajectory to new checkpoint file test.chk (1 frames)
11-28 14:24 presto.trajectory  Loaded trajectory from checkpoint file test.chk -- 1 frames read.
11-28 14:24 presto.trajectory  Propagating trajectory.
11-28 14:24 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 26 in total)
11-28 14:24 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 51 in total)
11-28 14:24 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 76 in total)
11-28 14:24 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 101 in total)
11-28 14:25 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 126 in total)
11-28 14:25 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 151 in total)
11-28 14:25 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 176 in total)
11-28 14:25 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 201 in total)
11-28 14:25 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (25 frames added; 226 in total)
11-28 14:25 presto.trajectory  Saving trajectory to existing checkpoint file test.chk (24 frames added; 250 in total)
(presto) [presto-testing]$
```

If you see a logfile like this, *presto* has successfully completed the trajectory! 
You can analyze the checkpoint file using the scripts in ``scripts/``, or look at more advanced use cases in ``tutorial/``.

## Acknowledgements

**Eugene Kwan** for assistance with software design, extensive technical help, and preliminary testing.

**J. Daniel Gezelter** for helpful discussions and advice about best practices in molecular dynamics, 
and an incredible willingness to help a complete stranger debug his Langevin integration code.

**Stefan Grimme** and **Sebastian Ehlert** for help with *xtb*.


## License

This project is licensed under the Apache License, Version 2.0. Please see `LICENSE` for full terms and conditions.

*Copyright 2020 by Corin Wagen*
