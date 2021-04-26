import numpy as np

class ParTest(object):
    """Testing how MPI4py works in classes

    """
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def add(self):
        from mpi4py import MPI
        size = MPI.COMM_WORLD.Get_size()
        rank = MPI.COMM_WORLD.Get_rank()

        print(f"hello from process {rank} of {size}")
        if not rank:
            return self.x + self.y
        else:
            return 'abc'

if __name__ == "__main__":
    p = ParTest(1, 2)
    print(p.add())
