# presto/scripts/run_traj_temp.py
# Marcus Sak, Jun 2021
# Script to run one trajectory as part of slurm job array

import sys
import presto
import logging
import argparse
import dill

logging.basicConfig(level=logging.INFO, filename=f"remd_par.log", filemode='a',
                    format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

logger = logging.getLogger(__name__)

MIN_CHECKPOINT_INTERVAL = 50

parser = argparse.ArgumentParser(
    prog="run_traj_temp.py", description="Script to run single trajectory at specified temperature, usually called by replica_exchange_par.py")
parser.add_argument("--checkpoint_filename", "-c", type=str,
                    help="path to remd checkpoint file")
parser.add_argument("--index", "-i", type=int, help="index of trajectory")
parser.add_argument("--swap", "-s", default=50, type=int,
                    help="time interval between swaps (fs)")

args = vars(parser.parse_args(sys.argv[1:]))

chkfile = args["checkpoint_filename"]
with (open(chkfile, "rb")) as f:
    remd = dill.load(f)

traj = remd.trajectories[args["index"]]
traj.run(time=args["swap"], checkpoint_interval=min(MIN_CHECKPOINT_INTERVAL, args["swap"]))
traj.save()

sys.exit(0)