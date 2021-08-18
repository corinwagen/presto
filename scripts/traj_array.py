# presto/scripts/run_traj_temp.py
# Marcus Sak, Jun 2021
# Script to run one trajectory as part of slurm job array

import sys
import presto
import logging
import argparse

logging.basicConfig(level=logging.INFO, filename=f"remd.log", filemode='a',
                    format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

logger = logging.getLogger(__name__)

parser = argparse.ArgumentParser(
    prog="run_traj_temp.py", description="Script to run single trajectory at specified temperature, usually called by replica_exchange_par.py")
parser.add_argument("--checkpoint_filename", "-c", type=str,
                    help="path to remd checkpoint file")
parser.add_argument("--index", "-i", type=int, help="index of trajectory")

args = vars(parser.parse_args(sys.argv[1:]))
remd = presto.replica_exchange.ReplicaExchangeParallel.load(args["checkpoint_filename"])

traj = remd.trajectories[args["index"]]
traj.run(time=remd.swap_interval)
traj.save()

sys.exit(0)