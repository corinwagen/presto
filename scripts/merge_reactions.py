import sys
sys.path.append("/n/home03/cwagen/Jacobsen/presto/")

import presto, argparse, re, glob
import multiprocessing as mp

# usage: python merge_reactions.py reaction.yaml "c3-1HCl-000-real/c3-1HCl-000*run*.chk" final_trajs/

parser = argparse.ArgumentParser(prog="analyze.py")
parser.add_argument("config")
parser.add_argument("filename")
parser.add_argument("output_dir")

args = vars(parser.parse_args(sys.argv[1:]))

files = glob.glob(args["filename"], recursive=True)

for filename in files:
    if re.search("r.chk$", filename):
        continue 

    print(filename)
    assert re.search("f.chk$", filename), "For this script, all files should end in `f` or `r`!" 
    reverse_filename = re.sub("f.chk$", "r.chk", filename)

    assert os.path.exists(reverse_filename), f"Can't find reverse file {reverse_filename}!"

    f_traj = presto.config.build(args["config"], filename) 
    r_traj = presto.config.build(args["config"], reverse_filename) 

    traj = presto.trajectory.join(f_traj, r_traj)

    newfile = filename.rsplit('/',1)[-1]
    newfile = re.sub("f.chk$", ".chk", newfile)

    traj.checkpoint_filename = f"{args['output_dir']}/{newfile}"
    traj.save()
