import argparse, math, sys, os, subprocess, glob, re, shutil, logging, presto
import numpy as np
from asciichartpy import plot

parser = argparse.ArgumentParser(prog="analyze.py", description="Analyze a single presto job -- prints temperature and energy as a function of time, and can write a movie.")
parser.add_argument("--cutoff", "-c", default=0, type=int, help="index of first frame to analyze, defaults to 0 (i.e. analyzing all frames)")
parser.add_argument("config_filename", type=str, help="path to config file (usually ends in .yaml)")
parser.add_argument("checkpoint_filename", type=str, help="path to checkpoint file (usually ends in .chk)")

args = vars(parser.parse_args(sys.argv[1:]))

traj = presto.config.build(args["config_filename"], args["checkpoint_filename"], load_frames=slice(args["cutoff"], None, None))
print(f"{len(traj.frames)} frames loaded from {args['checkpoint_filename']} ({traj.num_frames()} total)")

temps = np.array([f.temperature() for f in traj.frames][:-1])
energies = np.array([f.energy for f in traj.frames][:-1])
times = np.array([f.time for f in traj.frames][:-1])

print("ENERGIES")
print(presto.analysis.autocorrelation_time(energies, traj.save_interval))

print("TEMPS")
print(presto.analysis.autocorrelation_time(temps, traj.save_interval))

