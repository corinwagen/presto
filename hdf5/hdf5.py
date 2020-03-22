### testing code for hdf5

import numpy as np
import h5py

# create some random numbers
np_dataset1 = np.random.random(size = (1000,20))
np_dataset2 = np.random.random(size = (1000,200))

# write to disk
with h5py.File("test.hdf5", "w") as f:
    h5_dataset1 = f.create_dataset("dataset_name_1", data=np_dataset1)
    h5_dataset2 = f.create_dataset("dataset_name_2", data=np_dataset2)
    print(h5_dataset1)
    print(h5_dataset2)

# read back
print()
with h5py.File("test.hdf5", "r") as f:
    print(f.keys())
    h5_dataset1 = f.get("dataset_name_1")
    h5_dataset2 = f.get("dataset_name_2")
    print(h5_dataset1)
    print(h5_dataset2)
