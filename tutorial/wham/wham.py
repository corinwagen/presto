import sys, re, glob, cctk, argparse, yaml, os
import numpy as np
import subprocess as sp

sys.path.append("/n/home03/cwagen/Jacobsen/presto/")
import presto

# usage: python wham.py run 1 17 1.43 2.95 300 "../equil-00*/*_preequil.chk"

parser = argparse.ArgumentParser(prog="wham.py")
parser.add_argument("-c", "--config", type=str, default="wham.yaml")
parser.add_argument("type", type=str)
parser.add_argument("atom1", type=int)
parser.add_argument("atom2", type=int)
parser.add_argument("min_x", type=float)
parser.add_argument("max_x", type=float)
parser.add_argument("num", type=int)
parser.add_argument("chks")
args = vars(parser.parse_args(sys.argv[1:]))

print("wham - weighted histogram analysis method")

if args["type"] == "run":
    delta = (args["max_x"] - args["min_x"]) / args["num"]
    k = 3 / delta
    print(f"∆x: {delta:.3f}\tk = {k:.2f} kcal/(mol • Å)")

    settings = None
    assert os.path.exists(args["config"]), f"can't find file {args['config']}"
    print(f"reading {args['config']} as input file")
    with open(args["config"]) as config:
        settings = yaml.full_load(config)

    print("generating input files")
    files = glob.glob(args["chks"], recursive=True)
    count = 0
    for file in files:
        for i, x in np.ndenumerate(np.linspace(args["min_x"], args["max_x"], args["num"])):
            name = file.rsplit('/',1)[-1]
            name = re.sub(".chk", f"_{int(i[0]):04d}", name)

            if os.path.exists("{name}.chk"):
                continue

            constraint_dict = {
                "atom1": args['atom1'],
                "atom2": args['atom2'],
                "equilibrium": float(x),
                "force_constant": float(k),
            }
            if "constraints" in settings:
                settings["constraints"]["wham"] = constraint_dict
            else:
                settings["constraints"] = {"wham": constraint_dict}

            with open(f"{name}.yaml", "w") as config:
                yaml.dump(settings, config)

            # adjust starting bond distance to prevent insane forces when we start
            # the structures will still have to relax, of course
            traj = presto.config.build(f"{name}.yaml", f"{name}.chk", oldchk=file)
            m = traj.frames[-1].molecule()
            m.set_distance(args["atom1"], args["atom2"], x)
            traj.frames[-1].positions = m.geometry
            traj.save()

            assert traj.frames[-1].molecule().get_distance(args["atom1"], args["atom2"]) - x < 0.01

            count += 1

    print(f"wrote {count} files for submission")

elif args["type"] == "analyze":
    metadata_text = "# autogenerated by presto\n\n"
    files = glob.glob(args["chks"], recursive=True)
    for file in files:
        name = file.rsplit('/',1)[-1]
        name = re.sub(".chk", "", name)

        timeseries_text = f"# autogenerated from {name}.chk\n"

        traj = presto.config.build(f"{name}.yaml", f"{name}.chk", oldchk=file)

        k = traj.calculator.constraints[-1].force_constant / 0.0004184 # convert to kcal/mol
        d = traj.calculator.constraints[-1].equilibrium

        for idx, frame in enumerate(traj.frames):
            mol = frame.molecule()
            timeseries_text += f"{idx}\t{mol.get_distance(int(args['atom1']), int(args['atom2'])):.4f}\n"

        with open(f"{name}.csv", "w") as timeseries:
            timeseries.write(timeseries_text)

        metadata_text += f"{name}.csv\t{d:.4f}\t{k:.4f}\n"

    with open("metadata.txt", "w") as metadata:
        metadata.write(metadata_text)

else:
    raise ValueError(f"invalid type {args['type']} - need either ``run`` or ``analyze``!")
