import logging, re, sys, os
#logging.basicConfig(level=logging.INFO, filename=f"remd.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
#import numpy as np
#import presto
import dill
from par_test import ParTest
#logger = logging.getLogger(__name__)

from mpi4py import MPI
MPI.pickle.__init__(dill.dumps, dill.loads)
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

p = ParTest(1, 2)
# print("pre-addition")
print(p.add())
