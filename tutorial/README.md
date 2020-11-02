# Tutorial

For this tutorial, we will examine the reaction of acetyl chloride and sodium azide in acetonitrile.
[Previous gas-phase results](https://cctk.readthedocs.io/en/latest/tutorial_05.html) suggest that strong nucleophiles avoid a discrete tetrahedral intermediate
when reacting with acyl chlorides,
instead proceeding through a concerted addition-elimination mechanism.
However, the effect of solvation and explicit counterions on this picture remain unknown.

The simplicity of this system (8 heavy atoms) makes it a relatively facile choice.

## Step 1: Generate Solvated System

The starting material and product were brought together in GaussView to a rough pre-reactive conformation, and the system was solvated with 50 acetonitrile molecules using ``packmol/build_input.py``:

```
$ python ../packmol/build_input.py -f AcCl_NaN3.xyz -o solvated.xyz -s acetonitrile -n 50
```

The radius of the resultant solvated system was 10.2 Å, and the system had 311 atoms in total. 
(Larger solutes will require correspondingly larger solvation shells.)

## Step 2: Equilibrate System

To equilibrate the system properly, two separate equilibration runs were employed.

The first ("preequilibration") begins at 1000 K with frozen solute and slowly cools the system to room temperature over 5.0 ps, equilibrating for an additional 5.0 ps at room temperature.
The corresponding config file (``preequil.yaml``) is shown below. Notice that since only the solvent is being simulated, only ``xtb`` is needed.

```
type: equilibration

timestep: 1
high_atoms: 1-11
inactive_atoms: 1-11
stop_time: 10000

integrator:
    type: langevin
    viscosity: 0.0001

potential:
    type: spherical_harmonic
    radius: 10.5

calculator:
    type: xtb
    gfn : 0
    parallel: 8

bath_scheduler:
    type: linear
    start_temp: 1000
    target_temp: 298
    target_time: 5000
```

Once the solvent preequilibration is done, equilibration of the whole system can begin.
This equilibration uses an ONIOM calculator with two constraints:
one for the C–N distance and one for the C–Cl distance. 
These constraints prevent collapse to starting material or product, freezing the system in a conformation near the transition state.
*Note that systems restrained in this fashion are fundamentally unphysical and tend to try to "escape" the high-energy configuration by any means possible.
Any unconstrained reaction that the system can undergo to lower its energy is likely to occur; 
so be sure to visualize your results frequently to make sure nothing bizarre has happened!*

An additional "anchor" is also put in place on C1 to prevent the solute from leaving the center of the sphere.

```
# presto config file

type: equilibration

timestep: 1
high_atoms: 1-11
stop_time: 20000

anchor: 1

integrator:
    type: langevin
    viscosity: 0.0001

potential:
    type: spherical_harmonic
    radius: 10.5

calculator:
    type: oniom
    low_calculator:
        type: xtb
        gfn : 0
        parallel: 8
    high_calculator:
        type: gaussian
        route_card: "#p force b3lyp/6-31g(d) empiricaldispersion=gd3bj pop=none"
        link0:
            nprocshared: 16
            mem: "32GB"

bath_scheduler:
    type: constant
    target_temp: 298

constraints:
    constraint1:
        atom1: 1
        atom2: [8,9,10]
        equilibrium: 3.53
        force_constant: 500
        power: 2
    constraint2:
        atom1: 1
        atom2: 7
        equilibrium: 1.80
        force_constant: 500
        power: 2
``` 

On a 2020 Intel Cascade Lake processor, *presto* can run 25 frames in 4–10 minutes (depending on the load from other users). 
Accordingly, this 20 ps equilibration should take 2–5 days to run.

To analyze these jobs as they progress, the ``analyze.py`` and ``analyze_reaction.py`` scripts can be used.
``analyze.py`` gives a detailed look at the temperature/energetic profile of a single job, 
while ``analyze_reaction.py`` allows the batch analysis of many jobs in terms of starting/ending conditions.
Using ``analyze_reaction.py --monitor`` permits visualization of key reaction coordinates (defined in ``rxn.yaml``).

```
$ python analyze.py -c 0 preequil.yaml preequil.chk
$ python analyze_reaction.py -m rxn.yaml equil.chk
```

## Step 3: Compute Potential Energy Surface in Explicit Solvent

To find the actual transition state, the potential energy surface in explicit solvent must be calculated.
We will use the weighted histogram analysis method (WHAM) to do this, 
using the [*wham* program from the Grossfield lab](http://membrane.urmc.rochester.edu/?page_id=126).

Since the nucleophile has two identical nucleophilic nitrogens, we opted to scan along the C–Cl distance for simplicity.
The script ``wham/wham.py`` generates new ``.yaml`` files and starting configurations from the equilibrated system, which can be run in parallel.
Here, we generate 100 new runs with C1–Cl7 distances ranging from 1.7 Å to 2.3 Å, and run them using ``wham/submit_all.sh``.

```
$ cd wham
$ python wham.py run 1 7 1.7 2.3 100 "../equil.chk"
$ bash submit_all.sh
```

The files can be monitored using ``analyze_reaction.py``:

```
$ python analyze_reaction.py rxn.yaml wham/*.chk
```

When the jobs are complete, the data can be exported to ``.csv`` files for import into *wham*. 
The appropriate ``metadata.txt`` file is also written (see *wham* documentation for a full explanation).

```
$ cd wham
$ python wham.py analyze 1 7 1.7 2.3 100 "*.chk"
$ wham 1.7 2.3 100 0.001 298 0 metadata.txt wham-output
```

## Step 4: Run Trajectories

## Step 4: Analysis/Results

## Step 5: Interpretation And Future Work

To properly examine this system (e.g. for publication), 
- ergodicity = multiple starting configurations
