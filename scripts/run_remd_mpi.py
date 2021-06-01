from mpi4py import MPI
import argparse, copy, cctk, dill, logging, math, os, random, re, sys, time, yaml
import numpy as np
import presto

logging.basicConfig(level=logging.INFO, filename=f"remd.log",
                    format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

logger = logging.getLogger(__name__)

MPI.pickle.__init__(dill.dumps, dill.loads)
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

parser = argparse.ArgumentParser(prog="run_remd_mpi.py", description="Runs replica exchange MD for accelerated sampling of conformational space. Outputs chkfiles for all trajectories. Run > python replica_exchange_mpi.py --help for options.")
parser.add_argument("input", default=None, type=str, help="name of input geometry (.xyz)")
parser.add_argument("template", type=str, default="template.yaml", help="path to template file (usually ends in .yaml)")
parser.add_argument("checkpoint_filename", type=str, default="remd.chk", help="path to checkpoint file (usually ends in .chk)")
parser.add_argument("--mintemp", "-a", default=100, type=int, help="minimum trajectory temperature (K)")
parser.add_argument("--maxtemp", "-z", default=800, type=int, help="maximum trajectory temperature (K)")
parser.add_argument("--trajs", "-n", default=8, type=int, help="number of trajectories (equal to slurm --ntasks)")
parser.add_argument("--swap", "-s", default=50, type=int, help="time interval between swaps (fs)")

args = vars(parser.parse_args(sys.argv[1:]))

try:
    all_trajs = []

    if rank == 0:
        for temp in np.geomspace(args["mintemp"], args["maxtemp"], num=args["trajs"]):
            name = f"{int(temp)}k"
            with open(args["template"], 'r') as file:
                filedata = file.read()
            filedata = filedata.replace("<TEMP>", f"{temp:.2f}")
            with open(f"{name}.yaml", 'w') as file:
                file.write(filedata)
            traj = presto.config.build(
                f"{name}.yaml", f"{name}.chk", geometry=args["input"])
            all_trajs.append(traj)

    trajs = comm.bcast(all_trajs, root=0)
    remd = presto.replica_exchange_mpi.ReplicaExchange(trajectories=trajs, swap_interval=args["swap"], checkpoint_filename=args["checkpoint_filename"])
    remd.run()

    if rank == 0:
        print(remd.report())

except Exception as e:
    print(e)
    sys.exit(1)
