import logging, re, sys, os
logging.basicConfig(level=logging.INFO, filename=f"remd.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
import numpy as np
import presto
import dill

logger = logging.getLogger(__name__)

from mpi4py import MPI
MPI.pickle.__init__(dill.dumps, dill.loads)
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

n_trajs = 2

try:
    all_trajs = []

    if rank == 0:
        for temp in np.geomspace(300, 400, num=n_trajs):
            name = f"{int(temp)}k"
                
            with open("template.yaml", 'r') as file :
                filedata = file.read()
            filedata = filedata.replace("<TEMP>", f"{temp:.2f}")
            with open(f"{name}.yaml", 'w') as file:
                file.write(filedata)
            traj = presto.config.build(f"{name}.yaml", f"{name}.chk", geometry="dce.xyz")
            all_trajs.append(traj)

    trajs = comm.bcast(all_trajs, root=0)
    remd = presto.replica_exchange_par.ReplicaExchange(trajectories=trajs, swap_interval=50, checkpoint_filename="remd.chk")
    remd.run()

    if rank == 0:
        print(remd.report())

except Exception as e:
        print(e)
        sys.exit(1)
