import presto, argparse, os, logging

parser = argparse.ArgumentParser(prog="presto-run.py")
parser.add_argument("config", type=str)
parser.add_argument("checkpoint", type=str)
parser.add_argument("--geometry", "-g", type=str)
parser.add_argument("--interval", "-i", default=10, type=int)

assert "checkpoint" in args, "Need checkpoint filename!"
assert "config" in args, "Need config filename!"
args = vars(parser.parse_args(sys.argv[1:]))

traj = None
if os.path.exists(args["checkpoint"]):
    traj = presto.config.build(args["config"], args["checkpoint"])
else:
    #### need to initialize
    assert "geometry" in args, "No checkpoint file - need starting geometry!"
    traj = presto.config.build(args["config"], args["checkpoint"], geometry=args["geometry"])

logging.basicConfig(level=logging.INFO, filename="run.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M', filemode="w")
traj.run(checkpoint_interval=args["interval"])
