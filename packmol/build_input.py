import argparse, math, sys
import numpy as np
import cctk

import sys
sys.path.append('../presto')

try:
    import importlib.resources as pkg_resources
except ImportError:
    import importlib_resources as pkg_resources

import presto.solvents as solvents

#### Usage:

#### Solvent ``name`` should be added as ``presto/solvents/name.xyz`` and must contain "density=___" and "mw=____" on the title line.

#### python build_input.py -s ether -n 250 -o solvated_structure.xyz -f molecule.xyz
#### python build_input.py -s benzene toluene -n 100 100 -o solvated_structure.xyz -f molecule.xyz

parser = argparse.ArgumentParser(prog="build_input.py")
parser.add_argument("--file", "-f", type=str)
parser.add_argument("--solvent", "-s", type=str, nargs="+")
parser.add_argument("--num_atoms", "-n", type=int, nargs="+")
parser.add_argument("--output", "-o", type=str)

args = vars(parser.parse_args(sys.argv[1:]))

assert "file" in args.keys(), "need input file"
assert "solvent" in args.keys(), "need type of solvent"
assert "num_atoms" in args.keys(), "need number of solvent atoms"
assert "output" in args.keys(), "need output file"

assert len(args["solvent"]) == len(args["num_atoms"]), "missing solvents/num_atoms, lists must be same size!"

text = "#\n# input file built automatically by build_input.py\n# presto\n\n"
text += "tolerance 2.0\nfiletype xyz\n\n"
text += f"structure {args['file']}\n  number 1\n  fixed 0. 0. 0. 0. 0. 0.\n  centerofmass\nend structure\n\n"

volume = cctk.XYZFile.read_file(args["file"]).molecule.volume()

for s, n in zip(args["solvent"], args["num_atoms"]):
    with pkg_resources.path(solvents, f"{s}.xyz") as file:
        f = cctk.XYZFile.read_file(file)
        title_dict = {x.split("=")[0]: x.split("=")[1] for x in f.title.split(" ")}

        assert "mw" in title_dict.keys(), f"need mw=__ in title of {s}.xyz!"
        assert "density" in title_dict.keys(), f"need density=__ in title of {s}.xyz!"

        volume += n * float(title_dict["mw"]) / float(title_dict["density"]) * 1.6606 # 10^24 (Å**3 per mL) divided by Avogadro's number

radius = np.cbrt(0.75 * volume / math.pi)

for s, n in zip(args["solvent"], args["num_atoms"]):
    with pkg_resources.path(solvents, f"{s}.xyz") as file:
        text += f"structure {file}\n  number {n}\n  inside sphere 0. 0. 0. {radius:.2f}\nend structure\n\n"

text += f"output {args['output']}"
print(text)