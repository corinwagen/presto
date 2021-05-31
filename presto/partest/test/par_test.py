import numpy as np

from mpi4py import MPI
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

class ParTest(object):
    """Testing how MPI4py works in classes

    """
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def add(self):
        print(f"for process {rank}, self.x is at {id(self.x)}")
        if not rank:
            return self.x + self.y
        else:
            return 'abc'

if __name__ == "__main__":
    p = ParTest(1, 2)
    # print("pre-addition")
    print(p.add())

    # sendbuf = float(rank)
    # recvbuf = None
    # if rank == 0:
    #     recvbuf = np.empty(size, dtype='f')
    #recvbuf = comm.gather(sendbuf, root=0)
    #print(f"sendbuf of process {rank}:{sendbuf}")
    #print(f"recvbuf of process {rank}:{recvbuf}")
