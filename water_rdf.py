import argparse, math, sys, os, subprocess, glob, re, shutil
import numpy as np

import matplotlib.pyplot as plt

sys.path.append('../presto')
import presto

parser = argparse.ArgumentParser(prog="analyze.py")
parser.add_argument("--cutoff", "-c", default=500, type=int)
parser.add_argument("file", type=str)
args = vars(parser.parse_args(sys.argv[1:]))


traj = presto.trajectory.Trajectory(checkpoint_filename=args["file"])
print(f"{len(traj.frames)} frames loaded from {args['file']}")
if traj.finished:
    print("trajectory finished!")

idxs = traj.atomic_numbers == 8

rdf, radii = presto.analysis.radial_distribution(traj.frames[args["cutoff"]:], idxs)

rdf *= 28.22 # avg water volume here

f = plt.figure(figsize=(10,10))
plt.plot(radii, rdf)
plt.title("Radial Distribution Function for Water")
plt.xlabel("O–O Distance (Å)")
plt.show()
plt.savefig("water_rdf.png")
