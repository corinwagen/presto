import argparse, math, sys, os, subprocess, glob, re, shutil
import numpy as np
from asciichartpy import plot

sys.path.append('../presto')
import presto

parser = argparse.ArgumentParser(prog="analyze.py")
parser.add_argument("--movie", "-m", default=False, action="store_true")
parser.add_argument("--pressure", "-p", default=False, action="store_true")
parser.add_argument("--cutoff", "-c", default=500, type=int)
parser.add_argument("files", type=str)

args = vars(parser.parse_args(sys.argv[1:]))

for filename in glob.iglob(args["files"], recursive=True):
    if re.search("submit", filename):
        continue

    traj = presto.trajectory.Trajectory(checkpoint_filename=filename)
    print(f"{len(traj.frames)} frames loaded from {filename}")
    if traj.finished:
        print("trajectory finished!")

    temps = np.array([f.temperature() for f in traj.frames][args["cutoff"]:])
    energies = np.array([f.energy for f in traj.frames][args["cutoff"]:-1])
    rel_energies = energies - np.min(energies)
    rel_energies = energies * 627.509

    max_width = 100
    scale = math.ceil(len(energies) / max_width)
    if scale < 1:
        scale == 1

    print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} K (± {np.std(temps):.2f})")
    print(plot(np.mean(temps[:(len(temps)//scale)*scale].reshape(-1,scale), axis=1), {"height": 20}))
    print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")
    print(plot(np.mean(rel_energies[:(len(rel_energies)//scale)*scale].reshape(-1,scale), axis=1), {"height":20}))

    if args["pressure"]:
        pressures = np.array([f.pressure() for f in traj.frames][args["cutoff"]:])
        print(f"PRESSURE:\t\t\t{np.mean(pressures):.5f} atm (± {np.std(pressures):.5f})")
        print(plot(np.mean(pressures[:(len(pressures)//scale)*scale].reshape(-1,scale), axis=1), {"height":20}))

    if args["movie"]:
        movie_path = re.sub("chk$", "pdb", filename)
        print(f"writing movie to {movie_path}...")
        traj.write_movie(movie_path)
