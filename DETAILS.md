# Details

## Building Solvent Shells

Solvation of starting structures can be done using *presto*'s pre-loaded solvents:

| Solvent | Keyword |
| --------- | --------- |
| Acetonitrile | ``acetonitrile`` |
| Benzene | ``benzene`` |
| Chloroform | ``chloroform`` |
| Cyclohexane | ``cyclohexane`` |
| Dichloroethane (*gauche* conformer) | ``dce_gauche`` |
| Dichloroethane (*anti* conformer) | ``dce_anti`` |
| Dichloromethane | ``dcm`` |
| Dibutyl Ether | ``dibutylether`` |
| Diethyl Ether | ``ether`` |
| Diispropyl Ether | ``diisopropylether`` |
| Dioxane | ``dioxane`` |
| Ethanol | ``ethanol`` |
| Ethyl Acetate | ``ethyl_acetate`` |
| *n*-Hexane | ``hexanes`` |
| Methanol | ``methanol``|
| Tetrahydrofuran | ``thf`` |
| Toluene | ``toluene`` |
| Water | ``water`` |
| Xenon | ``xenon`` |

Solvation is accomplished by the Python script ``scripts/solvate.py``. To use ``solvate.py``, [*PACKMOL*](http://m3g.iqm.unicamp.br/packmol/home.shtml) must be accessible via the bash command ``packmol``.
(You may wish to define an appropriate bash alias.) The output of ``python solvate.py --help`` is reproduced here:

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

