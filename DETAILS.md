# Details

## Building Solvent Shells

Solvation of starting structures can be done using *presto*'s pre-loaded solvents, shown below. The dipole moment and polarizibility have been benchmarked to experiment for some commonly used solvents. In general, the dipole moment is slightly overestimated by GFN2-xtb and GFN0-xtb.

| Solvent | Keyword | Dipole (Exp./GFN2/GFN0, D) | Polariz. (Exp./GFN2/GFN0, Å<sup>3</sup>)|  
| --------- | --------- | --------- | --------- | 
| Acetonitrile | ``acetonitrile`` | 3.92 / 5.77 / 3.85 | 4.28 / 4.40 / 4.36 | 
| Benzene | ``benzene`` | 
| Chloroform | ``chloroform`` | 1.01 / 1.47 / 1.20 | 8.13 / 8.09 / 8.09 |
| Cyclohexane | ``cyclohexane`` | 
| Dichloroethane (*gauche* conformer) | ``dce_gauche`` |
| Dichloroethane (*anti* conformer) | ``dce_anti`` |
| Dichloromethane | ``dcm`` | 1.60 / 1.79 / 1.77 | 6.66 / 6.19 / 6.18 | 
| Dibutyl Ether | ``dibutylether`` | 
| Diethyl Ether | ``ether`` |
| Diispropyl Ether | ``diisopropylether`` |
| Dioxane | ``dioxane`` |
| Ethanol | ``ethanol`` |
| Ethyl Acetate | ``ethyl_acetate`` | 1.78 / 4.03 / 2.56 | 8.62 / 8.67 / 8.59 | 
| *n*-Hexane | ``hexanes`` |
| Methanol | ``methanol``| 1.70 / 1.57 / 1.91 | 3.21 / 3.18 / 3.20 |
| Tetrahydrofuran | ``thf`` | 1.63 / 1.55 / 2.03 | 7.88 / 7.80 / 7.64 | 
| Toluene | ``toluene`` | 0.33 / 0.55 / 0.51 | 11.86 / 11.83 / 11.77 | 
| Water | ``water`` | 1.86 / 1.81 / 2.22 | 1.50 / 1.41 / 1.40 | 
| Xenon | ``xenon`` |

Solvation can be performed by the Python script ``scripts/solvate.py``. 
To use ``solvate.py``, [*PACKMOL*](http://m3g.iqm.unicamp.br/packmol/home.shtml) must be accessible via the bash command ``packmol``.
(You may wish to define an appropriate bash alias.) 
The output of ``python solvate.py --help`` is reproduced here:

```
usage: solvate.py [-h] [--file FILE] [--solvent SOLVENT [SOLVENT ...]]
                      [--num NUM [NUM ...]] [--output OUTPUT]

A script to solvate arbitrary xyz files, generating spheres of realistic
solvent density.

optional arguments:
  -h, --help            show this help message and exit
  --file FILE, -f FILE  xyz file containing the desired input structure to
                        solvate.
  --solvent SOLVENT [SOLVENT ...], -s SOLVENT [SOLVENT ...]
                        solvents to use (specified by name, multiple arguments
                        allowed).
  --num NUM [NUM ...], -n NUM [NUM ...]
                        number of each solvent to add. same order as list of
                        solvents.
  --output OUTPUT, -o OUTPUT
                        desired output xyz file.
```

Running ``solvate.py`` is straightforward, and requires only a starting ``.xyz`` file:

```
$ python scripts/build_input.py -f test/static/PhF.xyz -o solvated.xyz -s benzene -n 50
```

``solvate.py`` will compute the volume of the solute automatically and then choose an appropriate sphere size, placing the solute in the center.
The output ``.xyz`` file will always contain the solute first, and can be visualized with Avogadro, CYLView, or other software prior to the start of the simulation.

