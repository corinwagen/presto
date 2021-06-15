# presto/scripts/traj_cluster.py
# Marcus Sak, Jun 2021
# Script for cluster analysis

import argparse
import sys
import numpy as np
import presto
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="traj_cluster.py", description="Given checkpoint file for trajectory and up to two desired internal coordinates, plots their distribution over the frames of the trajectory. Atom indices start from 1.")

    parser.add_argument("--checkpoint_filename", "-c", type=str,
                        help="path to trajectory checkpoint file (usually ends in .chk)    ", required=True)
    parser.add_argument("--distance", "-l", type=int, nargs=2, action='append',
                        help="a pair of atom indices to track distance", required=False)
    parser.add_argument("--angle", "-a", type=int, nargs=3, action='append',
                        help="three atom indices to track angle", required=False)
    parser.add_argument("--dihedral", "-d", type=int, nargs=4, action='append',
                        help="four atom indices to track dihedral", required=False)

    args = vars(parser.parse_args(sys.argv[1:]))
    chkfile = args['checkpoint_filename']
    del args['checkpoint_filename']

    int_coords = []
    for v in args.values():
        while v:
            int_coords.append(v.pop(0))

    assert len(int_coords) > 0 and len(
        int_coords) < 3, "only one or two internal coordinates should be specified"

    traj = presto.trajectory.Trajectory.new_from_checkpoint(chkfile)
    frames = traj.as_ensemble().molecules

    coord_values = []  # 2D array of internal coordinate values for whole trajectory
    for coord in int_coords:
        value = []  # array of int coord values for all frames
        if len(coord) == 2:
            for frame in frames:
                value.append(frame.get_distance(atoms=coord))
        elif len(coord) == 3:
            for frame in frames:
                value.append(frame.get_angle(atoms=coord))
        elif len(coord) == 4:
            for frame in frames:
                value.append(frame.get_dihedral(atoms=coord))
        coord_values.append(value)

    label = {2: 'distance', 3: 'angle', 4: 'dihedral'}

    if len(coord_values) == 1:  # only one internal coordinate
        label1 = f"{label[len(int_coords[0])]} {int_coords[0]}"
        df = pd.DataFrame(coord_values[0], columns=[label1])
        sns.displot(data=df, x=label1, kind="kde")
        plt.savefig('cluster1d.png', dpi=300)
        plt.show()
    else:  # two internal coordinates
        label1 = f"{label[len(int_coords[0])]} {int_coords[0]}"
        label2 = f"{label[len(int_coords[1])]} {int_coords[1]}"
        df = pd.DataFrame(np.transpose(coord_values), columns=[label1, label2])
        sns.jointplot(data=df, x=label1, y=label2, kind="kde")
        plt.savefig('cluster2d.png', dpi=300)
        plt.show()
