# presto

*Python-based Reactions in Explicit Solvent with Trajectories via ONIOM*

## Introduction

*presto* is a Python 3-based package that runs QM/QM' molecular dynamics simulations of small organic molecules in spheres of explicit solvent (50-250 solvent molecules). *presto* is loosely based on Singleton’s *PROGDYN*, as described in recent publications on the [nitration of toluene](https://pubs.acs.org/doi/10.1021/jacs.6b07328) and [hydrochlorination of dienes](https://pubs.acs.org/doi/10.1021/jacs.0c06295), but is written in a modern and object-oriented style which permits easier extension and modification.

**IMPORTANT:**
*presto* is currently in "alpha": testing is ongoing and no guarantees as to correctness or API consistency can be made at this time. 
As of Fall 2020 the package approximately works, but bugs are certainly present in a project of this size.

## Description


Conventional quantum chemical calculations (such as *ab initio* wavefunction methods and density functional theory) can describe chemical reactivity with high accuracy, but scale poorly with increasing system size. As a consequence, most computational analyses of organic reactions are performed in the gas phase with implicit solvation, which is unable to describe the behavior of many common species (e.g. ion pairs). In contrast, molecular dynamics permits the study of large, explicitly solvated systems, but the underlying molecular mechanics-based Hamiltonian renders such simulations unable to describe changes in bonding. *presto* seeks to combine elements of both approaches to permit the study of reactivity in explicit solvent. 

Following precedent by Singleton and others, *presto* employs the [ONIOM scheme](https://pubs.acs.org/doi/10.1021/cr5004419) developed by Morokuma to embed an accurate “high” system (typically modelled using DFT) inside a larger “low” system (modelled using semiempirical methods). Internally, *presto* repeatedly writes coordinates to each individual program and reads the corresponding energy and forces using [*cctk*](https://cctk.readthedocs.io/en/latest/). Currently, *presto* is compatible with Gaussian 16 and Stefan Grimme’s [*xtb*](https://github.com/grimme-lab/xtb/), but support for other programs can easily be added.

The speed of *presto* is entirely limited by the speed of the force calculations, which in turn depend on the size of the system. For medium-sized systems (10–20 heavy atoms) each individual DFT calculation takes about 30–90 seconds. The recommended timestep is 0.5 or 1.0 femtoseconds, resulting in an overall simulation speed of 1–2 picoseconds/day. If a faster simulation is desired, *xtb*-based methods can be used for both components of the ONIOM system: as with all computational projects, judicious benchmarking is key for determining the minimum acceptable level of theory. 

There are numerous challenges with running molecular dynamics that are not present with ordinary DFT calculations. Here are a few challenges, and the solutions chosen by *presto*:

- Edge effects can result in unrealistic solvation: only a vanishingly small percentage of solvent molecules are near an interface in a real (macroscopic) reaction, but a large fraction of the system is near the boundary for small spheres of solvent. Accordingly, *presto* confines the system of interest to the center of the solvent sphere with a shallow harmonic potential, ensuring that several solvent shells insulate the system from any boundaries. 

- An actual microdroplet of organic solvent would evaporate rapidly in the gas phase. To address this, *presto* applies a restoring force to any molecules which stray farther than a user-defined radius from the origin. This enforces a realistic solvent density and prevents evaporative cooling.

- Real reactions are in thermodynamic equilibrium with an external heat bath, and thus maintain a steady temperature by changing their total energy. However, conventional “thermostats” for molecular dynamics simulations result in unphysical dynamics, either by scaling particle velocities (Berendsen) or by inducing collisions with an imaginary heat bath (Langevin). *presto* employs the Langevin thermostat, but only for the outer solvent shells not directly in contact with the system of interest. Since the different layers of the droplet are in thermal equilibrium, this has the effect of controlling the entire system’s temperature while preserving realistic (non-Langevin) dynamics for the solute and its immediate environment.

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

*in progress*

- Install git repo (pip!)
- Determine location for /scratch/ directories, and copy run_gaussian.sh / run_xtb.sh there.
- Create customized submission script.
- test?


## Acknowledgements

**Eugene Kwan** for assistance with software design and extensive technical help.

**J. Daniel Gezelter** for helpful discussions and advice about best practices in molecular dynamics, 
and an incredible willingness to help a complete stranger debug his Langevin integration code.

**Stefan Grimme** and **Sebastian Ehlert** for help with *xtb*.


## License

This project is licensed under the Apache License, Version 2.0. Please see `LICENSE` for full terms and conditions.

*Copyright 2020 by Corin Wagen*
