import argparse, math, sys, os, subprocess, glob, re, shutil, logging, presto
import numpy as np
from asciichartpy import plot

parser = argparse.ArgumentParser(prog="analyze.py", description="Analyze a single presto job -- prints temperature and energy as a function of time, and can write a movie.")
parser.add_argument("--cutoff", "-c", default=0, type=int, help="index of first frame to analyze, defaults to 0 (i.e. analyzing all frames)")
parser.add_argument("--movie", "-m", default=False, help="which atoms to include in movie, either 'high' or 'all'. if blank, no movie will be written.")
parser.add_argument("config_filename", type=str, help="path to config file (usually ends in .yaml)")
parser.add_argument("checkpoint_filename", type=str, help="path to checkpoint file (usually ends in .chk)")

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

if args["movie"]:
    movie_path = re.sub("chk$", "pdb", args["checkpoint_filename"])
    print(f"writing movie to {movie_path}...")
    traj.write_movie(movie_path, idxs=args["movie"])
