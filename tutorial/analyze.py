import argparse, math, sys, os, subprocess, glob, re, shutil
import numpy as np
from asciichartpy import plot

sys.path.append('../presto')
import presto

parser = argparse.ArgumentParser(prog="analyze.py")
parser.add_argument("--movie", "-m", default=False) # "high" or "all"
parser.add_argument("--volume", "-v", default=False, action="store_true")
parser.add_argument("--angular_momentum", "-L", default=False, action="store_true")
parser.add_argument("--cutoff", "-c", default=500, type=int)
parser.add_argument("config_filename", type=str)
parser.add_argument("checkpoint_filename", type=str)

args = vars(parser.parse_args(sys.argv[1:]))

traj = presto.config.build(args["config_filename"], args["checkpoint_filename"], load_frames=slice(args["cutoff"], None, None))
print(f"{len(traj.frames)} frames loaded from {args['checkpoint_filename']} ({traj.num_frames()} total)")
if traj.finished:
    print("trajectory finished!")

temps = np.array([f.temperature() for f in traj.frames])
energies = np.array([f.energy for f in traj.frames][:-1])
rel_energies = energies - np.min(energies)
rel_energies = energies * 627.509

max_width = 100
scale = math.ceil(len(energies) / max_width)
if scale < 1:
    scale == 1

height = 16

print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} K (± {np.std(temps):.2f})")
print(plot(np.mean(temps[:(len(temps)//scale)*scale].reshape(-1,scale), axis=1), {"height": height}))
print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")
print(plot(np.mean(rel_energies[:(len(rel_energies)//scale)*scale].reshape(-1,scale), axis=1), {"height":height}))
if args["angular_momentum"]:
    Ls = np.array([f.L() for f in traj.frames])
    print(f"Ls:\t\t\t{np.mean(Ls):.5f} (± {np.std(Ls):.5f})")
    print(plot(np.mean(Ls[:(len(Ls)//scale)*scale].reshape(-1,scale), axis=1), {"height":20}))

if args["movie"]:
    movie_path = re.sub("chk$", "pdb", args["checkpoint_filename"])
    print(f"writing movie to {movie_path}...")
    traj.write_movie(movie_path, idxs=args["movie"])

