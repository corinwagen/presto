import sys, re, glob, cctk, argparse, yaml, os, tqdm, pandas
import numpy as np
import multiprocessing as mp
from asciichartpy import plot

sys.path.append("/n/jacobsen_lab/cwagen/presto/")
import presto

# usage: python wham2d.py run 94 36 50 208 36 50 coords.csv solv.chk

parser = argparse.ArgumentParser(
    prog="wham2d.py",
    description="""Create and parse files for integration with ``wham2d`` (2-dimensional weighted histogram analysis method).
Choosing type ``run`` means this script will take in one or more equilibrated starting trajectories and generate many constrained input files from each one. These trajectories can then be run in parallel.
Choosing type ``analyze`` means this script will take in finished trajectories (generated from ``run``) and generate files for use with ``wham`` software as distributed by the Grossfield lab (http://membrane.urmc.rochester.edu/?page_id=126).""")
parser.add_argument("-c", "--config", type=str, default="wham.yaml", help="path to default .yaml config file")
parser.add_argument("-C", "--cutoff", type=int, default=1000, help="cutoff for reading each individual file. frames before this cutoff will be discarded.")
parser.add_argument("type", type=str, help="either ``run`` (to generate input files) or ``analyze`` (to parse output files).")
parser.add_argument("x_atom1", type=int, help="X: number of first atom of interest")
parser.add_argument("x_atom2", type=int, help="X: number of second atom of interest")
parser.add_argument("x_force_constant", type=float, help="X: force constant")
parser.add_argument("y_atom1", type=int, help="Y: number of first atom of interest")
parser.add_argument("y_atom2", type=int, help="Y: number of second atom of interest")
parser.add_argument("y_force_constant", type=float, help="X: force constant")
parser.add_argument("points_csv", type=str, help="path to .csv file containing X and Y distances")
parser.add_argument("chks", help="path to .chk files. for ``run``, this must be equilibrated starting configurations. for ``analyze``, this must be finished points.")
args = vars(parser.parse_args(sys.argv[1:]))

print("wham2d - 2d weighted histogram analysis method")

print(f"reading {args['points_csv']} as coordinates file")
crdfile = pandas.read_csv(args["points_csv"])
assert "X" in crdfile, f"{args['points_csv']} must have column ``X`` defined!"
assert "Y" in crdfile, f"{args['points_csv']} must have column ``Y`` defined!"
coordinates = crdfile.to_dict("records")

min_x = min([c["X"] for c in coordinates])
max_x = max([c["X"] for c in coordinates])
min_y = min([c["Y"] for c in coordinates])
max_y = max([c["Y"] for c in coordinates])

if args["type"] == "run":
    settings = None
    assert os.path.exists(args["config"]), f"can't find file {args['config']}"
    print(f"reading {args['config']} as input file")
    with open(args["config"]) as config:
        settings = yaml.full_load(config)

    print(f"coordinate x: min = {min_x:.2f} Å, max = {max_x:.2f} Å, k = {args['x_force_constant']:.2f} kcal/mol")
    print(f"coordinate y: min = {min_y:.2f} Å, max = {max_y:.2f} Å, k = {args['y_force_constant']:.2f} kcal/mol")

    print("generating input files")
    files = glob.glob(args["chks"], recursive=True)
    count = 0
    for file in files:
        for i, row in enumerate(coordinates):
            x = row["X"]
            y = row["Y"]

            name = file.rsplit('/',1)[-1]
            name = re.sub(".chk", f"_{i:04d}", name)

            if os.path.exists("{name}.chk"):
                continue

            constraint_dict = {
                "atom1": args['x_atom1'],
                "atom2": args['x_atom2'],
                "equilibrium": float(x),
                "force_constant": args["x_force_constant"],
            }
            if "constraints" in settings:
                settings["constraints"]["wham_x"] = constraint_dict
            else:
                settings["constraints"] = {"wham_x": constraint_dict}

            settings["constraints"]["wham_y"] = {
                "atom1": args['y_atom1'],
                "atom2": args['y_atom2'],
                "equilibrium": float(y),
                "force_constant": args["y_force_constant"],
            }

            with open(f"{name}.yaml", "w") as config:
                yaml.dump(settings, config)

            # adjust starting bond distance to prevent insane forces when we start
            # the structures will still have to relax, of course
            traj = presto.config.build(f"{name}.yaml", f"{name}.chk", oldchk=file)
            m = traj.frames[-1].molecule()
            m.set_distance(args["x_atom1"], args["x_atom2"], x)
            m.set_distance(args["y_atom1"], args["y_atom2"], y)
            traj.frames[-1].positions = m.geometry
            traj.save()

            x_actual = traj.frames[-1].molecule().get_distance(args["x_atom1"], args["x_atom2"])
            y_actual = traj.frames[-1].molecule().get_distance(args["y_atom1"], args["y_atom2"])
            if x_actual - x > 0.01:
                print(f"WARNING: {name}.chk could not be precisely set to x initial distance (desired: {x:.2f}, actual: {x_actual:.2f}). there may be large initial forces!")
            if y_actual - y > 0.01:
                print(f"WARNING: {name}.chk could not be precisely set to y initial distance (desired: {y:.2f}, actual: {y_actual:.2f}). there may be large initial forces!")

            count += 1

    print(f"wrote {count} files for submission")

elif args["type"] == "analyze":
    metadata_text = "# autogenerated by presto\n\n"
    files = glob.glob(args["chks"], recursive=True)
    print(f"Ignoring first {args['cutoff']} frames of every trajectory: set --cutoff option to change!")

    x_histogram = np.zeros(shape=100)
    y_histogram = np.zeros(shape=100)
    count = 0

    def read_chk(file):
        name = file.rsplit('/',1)[-1]
        name = re.sub(".chk", "", name)

        timeseries_text = f"# autogenerated from {name}.chk\n"
        traj = presto.config.build(f"{name}.yaml", f"{name}.chk", load_frames=slice(args["cutoff"], None))
        kx = traj.calculator.constraints[-2].force_constant / 0.0004184 # convert to kcal/mol
        dx = traj.calculator.constraints[-2].equilibrium
        ky = traj.calculator.constraints[-1].force_constant / 0.0004184 # convert to kcal/mol
        dy = traj.calculator.constraints[-1].equilibrium

        x_dists = []
        y_dists = []
        for idx, mol in enumerate(traj.as_ensemble().molecules):
            x_dist = mol.get_distance(int(args['x_atom1']), int(args['x_atom2']))
            y_dist = mol.get_distance(int(args['y_atom1']), int(args['y_atom2']))
            x_dists.append(x_dist)
            y_dists.append(y_dist)
            timeseries_text += f"{args['cutoff'] + idx}\t{x_dist:.4f}\t{y_dist:.4f}\n"

        with open(f"{name}.csv", "w") as timeseries:
            timeseries.write(timeseries_text)

        x_file_hist, bin_edges = np.histogram(x_dists, bins=100, range=(min_x, max_x))
        y_file_hist, bin_edges = np.histogram(y_dists, bins=100, range=(min_y, max_y))
        return x_file_hist, y_file_hist, len(x_dists), f"{name}.csv\t{dx:.4f}\t{dy:.4f}\t{kx:.4f}\t{ky:.4f}\n"

    # reading is slow, do it in parallel
    pool = mp.Pool(processes=1)
    for (x_file_hist, y_file_hist, file_count, file_metadata_text) in tqdm.tqdm(pool.imap(read_chk, files), total=len(files)):
        x_histogram += x_file_hist
        y_histogram += y_file_hist
        count += file_count
        if file_count > 0:
            metadata_text += file_metadata_text

    print(f"\nX histogram ({min_x:.2f} to {max_x:.2f}, n={count}):")
    print(plot(x_histogram, {"height": 10}))
    print(f"\nY histogram ({min_y:.2f} to {max_y:.2f}, n={count}):")
    print(plot(y_histogram, {"height": 10}))

    with open("metadata.txt", "w") as metadata:
        metadata.write(metadata_text)

else:
    raise ValueError(f"invalid type {args['type']} - need either ``run`` or ``analyze``!")

