### testing code for hdf5

import numpy as np
import h5py

# parameters
n_atoms = 1000
hdf5_filename = "trajectory.hdf5"

# this class makes fake Frames
class Frame():
    def __init__(self):
        self.energy = np.random.random()
        self.positions = np.random.random(size=(n_atoms,3))
        self.velocities = np.random.random(size=(n_atoms,3))
        self.forces = np.random.random(size=(n_atoms,3))

# this class makes fake Trajectories
class Trajectory():
    def __init__(self, solute_atoms, timestep):
        self.frames = []
        self.solute_atoms = np.asarray(solute_atoms)
        self.timestep = timestep

# create a blank trajectory
solute_atoms = [1,2,3]
timestep = 1.0
trajectory = Trajectory(solute_atoms, timestep)

# create a few random Frames and add them to the Trajectory
frames = [ Frame() for i in range(3) ]
trajectory.frames.extend(frames)

# save the trajectory to disk
# this is the first time we've written to the file, so we'll have
# to initialize the hierarchical structure
print()
print("=== original ===")
with h5py.File(hdf5_filename, "w") as h5:
    # attrs is a conventional hdf5 dict that contains metadata
    # here, we'll use it to store data about the trajectory
    h5.attrs['timestep'] = trajectory.timestep
    h5.attrs['solute_atoms'] = trajectory.solute_atoms

    # collect the energies from the Trajectory
    #
    # note that the process of collecting energies from frames
    # and copying them into a list would be expensive if we had
    # to do it every time.  however, the alternative would be to
    # do away with the abstraction of Frame entirely and store
    # all the energies in Trajectory itself.  I think that's
    # undesirable from a design standpoint.  since all we have to
    # do is update the hdf5 file every so many points, this step
    # only adds a small linear overhead and shouldn't be too
    # expensive.
    energies = [ frame.energy for frame in trajectory.frames ]
    energies = np.asarray(energies)
    print("original energies:", str(energies))

    # store the energies
    #
    # if None is given in an axis, that axis is assumed to be resizable
    # (by default, hdf5 will determine how big the data chunks will be)
    # note that when creating resizable one-dimensional arrays, (None,)
    # rather than None is required.  also note that np.array is supported,
    # but not lists.
    #
    # for real-life deployment, we could replace None with the expected
    # size of the Trajectory, but I'm not sure if this would have any
    # advantages.
    #
    # I turned on compression here, but the effect won't be very big
    # because these are random numbers.
    h5.create_dataset("all_energies", data=energies, maxshape=(None,),
                      compression="gzip", compression_opts=9)

    # get and store the positions
    all_positions = [ frame.positions for frame in trajectory.frames ]
    all_positions = np.stack(all_positions)
    print("original positions (1st atom only):")
    print(all_positions[:,0,:])
    h5.create_dataset("all_positions", data=all_positions, maxshape=(None,n_atoms,3),
                      compression="gzip", compression_opts=9)

    # store the velocities and forces
    # there is probably a more elegant way to avoid repetitive code here
    all_velocities = [ frame.velocities for frame in trajectory.frames ]
    all_velocities = np.stack(all_velocities)
    h5.create_dataset("all_velocities", data=all_velocities, maxshape=(None,n_atoms,3),
                      compression="gzip", compression_opts=9)

    all_forces = [ frame.forces for frame in trajectory.frames ]
    all_forces = np.stack(all_forces)
    h5.create_dataset("all_forces", data=all_forces, maxshape=(None,n_atoms,3),
                      compression="gzip", compression_opts=9)

# print out what is saved
print()
print("=== after initial write: ===")
print()
with h5py.File(hdf5_filename, "r") as h5:
    all_energies = h5.get("all_energies")
    print("saved energies", str(energies[:]))
    print("saved positions")
    all_positions = h5.get("all_positions")
    print(all_positions[:,0,:])

# create a few more frames and add them to the Trajectory
frames = [ Frame() for i in range(4) ]
trajectory.frames.extend(frames)
print()
print("=== after adding some frames ===")
print("energies:")
print([frame.energy for frame in trajectory.frames])
print()
print("positions:")
all_positions = [ frame.positions for frame in trajectory.frames ]
all_positions = np.stack(all_positions)
print(all_positions[:,0,:])

# update the trajectory on disk
with h5py.File(hdf5_filename, "r+") as h5:
    # determine how many new points there are
    all_energies = h5.get("all_energies")
    old_n_frames = len(all_energies)
    now_n_frames = len(trajectory.frames)
    new_n_frames = now_n_frames - old_n_frames

    # collect the new energies
    new_energies = [ frame.energy for frame in trajectory.frames[-new_n_frames:] ]
    new_energies = np.asarray(new_energies)

    # resize array and save energies
    all_energies.resize((now_n_frames,))
    all_energies[-new_n_frames:] = new_energies

    # collect the new positions
    new_positions = [ frame.positions for frame in trajectory.frames[-new_n_frames:] ]
    new_positions = np.asarray(new_positions)

    # resize array and save positions
    all_positions = h5.get("all_positions")
    all_positions.resize((now_n_frames,n_atoms,3))
    all_positions[-new_n_frames:] = new_positions

    # repeat for velocities and forces
    new_velocities = [ frame.velocities for frame in trajectory.frames[-new_n_frames:] ]
    new_velocities = np.asarray(new_velocities)
    all_velocities = h5.get("all_velocities")
    all_velocities.resize((now_n_frames,n_atoms,3))
    all_velocities[-new_n_frames:] = new_velocities

    new_forces = [ frame.forces for frame in trajectory.frames[-new_n_frames:] ]
    new_forces = np.asarray(new_forces)
    all_forces = h5.get("all_forces")
    all_forces.resize((now_n_frames,n_atoms,3))
    all_forces[-new_n_frames:] = new_forces

# print out what is saved
print()
print("after initial update:")
print()
with h5py.File(hdf5_filename, "r") as h5:
    all_energies = h5.get("all_energies")
    print("saved energies", str(all_energies[:]))
    print("saved positions")
    all_positions = h5.get("all_positions")
    print(all_positions[:,0,:])



