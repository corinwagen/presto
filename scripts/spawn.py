import argparse, sys, os, copy
sys.path.append("/n/home03/cwagen/Jacobsen/presto/")
import presto

# usage: python spawn.py equil.chk 2500 50 reaction.yaml traj

parser = argparse.ArgumentParser(prog="spawn.py")
parser.add_argument("--interval", "-i", type=int, default=100)
parser.add_argument("chk", type=str)
parser.add_argument("start_idx", type=int)
parser.add_argument("num", type=int)
parser.add_argument("config", type=str)
parser.add_argument("prefix", type=str)

args = vars(parser.parse_args(sys.argv[1:]))

for i in range(args["num"]):
    run_name = args["prefix"]
    chkname = f"{run_name}-{i:02d}f.chk"
    if os.path.exists(chkname):
        continue

    trajf = presto.config.build(args["config"], chkname, oldchk=args["chk"], oldchk_idx=args["start_idx"]+i*args["interval"])
    trajf.save()

    trajr = copy.deepcopy(trajf)
    trajr.forwards = False
    trajr.checkpoint_filename = f"{run_name}-{i:02d}r.chk"
    print(trajr.forwards)
    trajr.save()

print(f"Wrote {args['num']} * 2 files")
