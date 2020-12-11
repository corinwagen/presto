import argparse, math, sys, os, subprocess
import numpy as np
import cctk

try:
    import importlib.resources as pkg_resources
except ImportError:
    import importlib_resources as pkg_resources

import presto.solvents as solvents

#### Usage:

#### Solvent ``name`` should be added as ``presto/solvents/name.xyz`` and must contain "density=___" and "mw=____" on the title line.

#### python solvate.py -s ether -n 250 -o solvated_structure.xyz -f molecule.xyz
#### python solvate.py -s benzene toluene -n 100 100 -o solvated_structure.xyz -f molecule.xyz

#### This program expects that ``packmol`` can be executed in bash. You may wish to add a ``~/.bashrc`` alias to that effect.

#### Corin Wagen, 2020

parser = argparse.ArgumentParser(prog="solvate.py", description="A script to solvate arbitrary xyz files, generating spheres of realistic solvent density.")
parser.add_argument("--file", "-f", type=str, help="xyz file containing the desired input structure to solvate.")
parser.add_argument("--solvent", "-s", type=str, nargs="+", help="solvents to use (specified by name, multiple arguments allowed).")
parser.add_argument("--num", "-n", type=int, nargs="+", help="number of each solvent to add. same order as list of solvents.")
parser.add_argument("--output", "-o", type=str, help="desired output xyz file.")

args = vars(parser.parse_args(sys.argv[1:]))

assert "file" in args.keys(), "need input file"
assert "solvent" in args.keys(), "need type of solvent"
assert "num" in args.keys(), "need number of solvent atoms"
assert "output" in args.keys(), "need output file"

assert len(args["solvent"]) == len(args["num"]), "missing solvents/num, lists must be same size!"

print("Building packmol input file...")

#### build first half of packmol input file
text = "#\n# input file built automatically by build_input.py\n# presto\n\n"
text += "tolerance 2.0\nfiletype xyz\n\n"
text += f"structure {args['file']}\n  number 1\n  fixed 0. 0. 0. 0. 0. 0.\n  centerofmass\nend structure\n\n"

print(f"Loading input file {args['file']} and calculating volume...")
volume = cctk.XYZFile.read_file(args["file"]).molecule.volume()

print(f"Loading solvent {args['solvent']} information...")
#### load solvent file
for s, n in zip(args["solvent"], args["num"]):
    with pkg_resources.path(solvents, f"{s}.xyz") as file:
        f = cctk.XYZFile.read_file(file)
        title_dict = {x.split("=")[0]: x.split("=")[1] for x in f.title.split(" ")}

        assert "mw" in title_dict.keys(), f"need mw=__ in title of {s}.xyz!"
        assert "density" in title_dict.keys(), f"need density=__ in title of {s}.xyz!"

        volume += n * float(title_dict["mw"]) / float(title_dict["density"]) * 1.6606 # 10^24 (Å**3 per mL) divided by Avogadro's number

#### choose appropriately-sized enclosing sphere
radius = np.cbrt(0.75 * volume / math.pi)

for s, n in zip(args["solvent"], args["num"]):
    with pkg_resources.path(solvents, f"{s}.xyz") as file:
        text += f"structure {file}\n  number {n}\n  inside sphere 0. 0. 0. {radius:.2f}\nend structure\n\n"

text += f"output {args['output']}"

#### write temporary packmol input file
with open("temp.inp", "w+") as file:
    file.write(text)
print(f"temp.inp created!")

#### call packmol!
subprocess.call(['/bin/bash', '-i', '-c', "packmol < temp.inp"])

#### either delete temporary file or leave it if packmol failed
if os.path.exists(args["output"]):
#    os.remove("temp.inp")
    print(f"temp.inp removed")
    print(f"confining radius = {radius} Å")
else:
    print("file not created - try running ``packmol < temp.inp`` manually")
