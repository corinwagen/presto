import sys
sys.path.append("/n/jacobsen_lab/cwagen/presto/")

import numpy as np
import presto, argparse, re, glob, yaml, math, os
from asciichartpy import plot

parser = argparse.ArgumentParser(prog="analyze.py")
parser.add_argument("-m", "--monitor", default=False, action="store_true")
parser.add_argument("--movie", default=False)
parser.add_argument("config")
parser.add_argument("files", nargs="+")

args = vars(parser.parse_args(sys.argv[1:]))

constraints = None
monitor = list()
with open(args["config"], "r+") as f:
    settings = yaml.safe_load(f)
    print("\n\033[3mConstraints:\033[0m")
    print(f"{0:>3d}\t{'':20s}\t{'Not finished':20s}")
    for i, (k, v) in enumerate(settings["termination_function"].items()):
        print(f"{i+1:>3d}\t{k:20s}\t{v:20s}")
    print("")

    if "monitor" in settings:
        for row in list(settings["monitor"].values()):
            monitor.append(row.split(" "))

    constraints = list(settings["termination_function"].values())

print("\n\033[3mTrajectories:\033[0m")
print(f"\033[1m{'Filename':40s}\t{'Initial':8s}\t{'Final':8s}\t{'Total Time':8s}\t{'Finished?'}\033[0m")
for filename in args["files"]:
    traj = presto.config.build(args["config"], filename)

    exit_code = traj.finished

    mf = traj.frames[-1].molecule().assign_connectivity()
    mi = traj.frames[0].molecule().assign_connectivity()

    status_i = 0
    status_f = 0

    for idx, row in enumerate(constraints):
        words = list(filter(None, row.split(" ")))
        if words[0] == "bond":
            if mi.get_bond_order(int(words[1]), int(words[2])):
                status_i = idx + 1
            if mf.get_bond_order(int(words[1]), int(words[2])):
                status_f = idx + 1
        elif words[0] == "distance":
            assert len(words) == 5, f"Termination condition ``bond`` must be of form ``bond atom1 atom2 [greater_than/less_than] value`` -- {row} is invalid!"
            if words[3] == "greater_than":
                if mi.get_distance(int(words[1]), int(words[2])) > float(words[4]):
                    status_i = idx + 1
                if mf.get_distance(int(words[1]), int(words[2])) > float(words[4]):
                    status_f = idx + 1
            elif words[3] == "less_than":
                if mi.get_distance(int(words[1]), int(words[2])) < float(words[4]):
                    status_i = idx + 1
                if mf.get_distance(int(words[1]), int(words[2])) < float(words[4]):
                    status_f = idx + 1

    time = len(traj.frames) * traj.timestep

    filename = filename.rsplit('/',1)[-1]
    filename = re.sub(".chk", "", filename)

    print(f"{filename:40s}\t{status_i:8d}\t{status_f:8d}\t   {time:>5.1f}\t{traj.finished}")

    if args["monitor"]:
        max_width = 100
        scale = math.ceil(len(traj.frames) / max_width)
        if scale < 1:
            scale == 1

        for coord in monitor:
            Y = None
            if coord[0] == "distance":
                Y = [f.molecule().get_distance(int(coord[1]), int(coord[2])) for f in traj.frames]
            elif coord[0] == "angle":
                Y = [f.molecule().get_angle(int(coord[1]), int(coord[2]), int(coord[3])) for f in traj.frames]
            elif coord[0] == "dihedral":
                Y = [f.molecule().get_dihedral(int(coord[1]), int(coord[2]), int(coord[3]), int(coord[4])) for f in traj.frames]
            else:
                print(f"Unrecognized coordinate type {coord[0]}!")
                break

            Y = np.asarray(Y)

            print(f"\033[3m{' '.join(coord)}\033[0m")
            print(plot(np.mean(Y[:(len(Y)//scale)*scale].reshape(-1,scale), axis=1), {"height": 10}))
            print("\n")

    if args["movie"]:
        assert os.path.exists(args["movie"]), f"can't write to directory {args['movie']}"
        traj.write_movie(f"{args['movie']}/{filename}.mol2", idxs=traj.high_atoms)
