import numpy as np
import math, copy, cctk

import presto

class Frame():
    """
    Represents one frame in a trajectory.

    Attributes:
        trajectory (presto.Trajectory):
        positions (cctk.OneIndexedArray):
        velocities (cctk.OneIndexedArray):
        accelerations (cctk.OneIndexedArray):

        energy (float):
        bath_temperature (float):
    """

    def __init__(self, trajectory, x, v, a, bath_temperature=298, energy=0.0):
        assert isinstance(trajectory, presto.trajectory.Trajectory), "need trajectory"

        assert len(x) == len(v), "length of positions not same as length of velocities!"
        assert len(x) == len(a), "length of positions not same as length of accelerations!"

        assert isinstance(x, cctk.OneIndexedArray), "positions is not a one-indexed array!"
        assert isinstance(v, cctk.OneIndexedArray), "velocities is not a one-indexed array!"
        assert isinstance(a, cctk.OneIndexedArray), "accelerations is not a one-indexed array!"

        assert (x.ndim == 2) and (x.shape[1] ==  3), "positions must be an n x 3 ndarray"
        assert (v.ndim == 2) and (v.shape[1] ==  3), "velocities must be an n x 3 ndarray"
        assert (a.ndim == 2) and (a.shape[1] ==  3), "accelerations must be an n x 3 ndarray"

        assert isinstance(bath_temperature, (float, int, np.integer)), "bath temperature needs to be numeric!"
        assert bath_temperature >= 0, "bath temperature must be positive or 0"

        self.trajectory = trajectory
        self.positions = x
        self.velocities = v
        self.accelerations = a
        self.bath_temperature = bath_temperature
        self.energy = energy

    def __str__(self):
        temp = f"E={self.energy}, temp={self.bath_temperature}\n"
        n_atoms = len(self.positions)
        for atom in range(1,n_atoms+1):
            x,v,a = self.positions[atom],self.velocities[atom],self.accelerations[atom]
            temp += f"{atom:3d} [ {x[1]:8.3f} {x[2]:8.3f} {x[3]:8.3f} ] [ {v[1]:8.3f} {v[2]:8.3f} {v[3]:8.3f} ] [ {a[1]:10.2E} {a[2]:10.2E} {a[3]:10.2E} ]\n"
        return temp[:-1]

    def next(self, temp=None, forwards=True):
        """
        Computes next frame using ``self.trajectory.integrator``.

        The desired bath temperature is not used in the current force calculations, but is passed to the output frame.
        """
        if temp is None:
            temp = self.bath_temperature
        assert isinstance(temp, (float, int, np.integer)), "temp must be numeric!"

        integrator = self.trajectory.integrator
        energy, new_x, new_v, new_a = integrator.next(self, forwards=forwards)
        self.energy = energy
        return Frame(self.trajectory, new_x, new_v, new_a, temp)

    def prev(self, temp=None):
        """
        Computes previous frame using ``self.trajectory.integrator``.

        The desired bath temperature is not used in the current force calculations, but is passed to the output frame.
        """
        return self.next(temp, forwards=False)

    def temperature(self):
        """
        Computes the temperature based on the equipartition theorem, counting only the active atoms.

        T = sum{ m_i * v_i ** 2 / (kB * Nf) }
        """
        v = [np.linalg.norm(x) for x in self.velocities[self.trajectory.active_atoms]]
        m = self.trajectory.masses[self.trajectory.active_atoms].reshape(-1,1)
        K = m * np.power(v, 2)
        return float(np.mean(K)) / (3 * presto.constants.BOLTZMANN_CONSTANT)

    def pressure(self):
        """
        Computes the pressure based on the following formula:

        P = 1/(3*V) * (\sum{m_i * v_i * v_i + r_i * f_i}
        """
        m = self.trajectory.masses[self.trajectory.active_atoms]
        tot = 0
        for i in range(1, len(self.positions) + 1):
            tot += np.dot(m[i] * self.velocities[i], self.velocities[i]) + np.dot(self.positions[i], self.accelerations[i] *  m[i])

        return tot/3 * self.volume()

    def volume(self):
        return self.molecule().volume()

    def inactive_mask(self):
        """
        Returns an ``np.ndarray`` of the same length as ``positions`` where every active atom is ``False`` and every inactive atom is ``True``.
        """
        inactive_mask = np.ones(shape=len(self.positions)).view(cctk.OneIndexedArray)
        inactive_mask[self.trajectory.active_atoms] = 0
        inactive_mask  = inactive_mask.astype(bool)
        return inactive_mask

    def active_mask(self):
        """
        Returns an ``np.ndarray`` of the same length as ``positions`` where every active atom is ``False`` and every inactive atom is ``True``.
        """
        active_mask = np.zeros(shape=len(self.positions)).view(cctk.OneIndexedArray)
        active_mask[self.trajectory.active_atoms] = 1
        active_mask  = active_mask.astype(bool)
        return active_mask

    def molecule(self):
        return cctk.Molecule(self.trajectory.atomic_numbers, self.positions)

    def remove_com_motion(self):
        # move centroid to origin
        centroid = np.mean(self.positions, axis=0)
        self.positions = self.positions - centroid
        assert np.linalg.norm(np.sum(self.positions, axis=0)) < 0.0001, "didn't center well enough!"

        #### subtract out center-of-mass translational motion
        com_translation = np.sum(self.masses() * self.velocities, axis=0)
        correction_tran = np.tile(com_translation / np.sum(self.masses()), (len(self.velocities),1))
        self.velocities = self.velocities - correction_tran
        assert np.linalg.norm(np.sum(self.masses() * self.velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"
        return self

        ##### I CANNOT GET THIS TO WORK SO I'm RETURNING BEFORE IT - WILL COME BACK TO THIS

        e1 = np.array([1,0,0])
        e2 = np.array([0,1,0])
        e3 = np.array([0,0,1])

        avg_mass = np.mean(self.masses())
        com_rotation = np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)

        correction_x = np.cross(self.positions, np.tile(np.multiply(com_rotation, e1), (len(self.velocities),1)).view(cctk.OneIndexedArray))
        correction_x = correction_x / (np.sum(np.linalg.norm(np.cross(self.positions, e1), axis=1) ** 2) * avg_mass)
        correction_y = np.cross(self.positions, np.tile(np.multiply(com_rotation, e2), (len(self.velocities),1)).view(cctk.OneIndexedArray))
        correction_y = correction_y / (np.sum(np.linalg.norm(np.cross(self.positions, e2), axis=1) ** 2) * avg_mass)
        correction_z = np.cross(self.positions, np.tile(np.multiply(com_rotation, e3), (len(self.velocities),1)).view(cctk.OneIndexedArray))
        correction_z = correction_z / (np.sum(np.linalg.norm(np.cross(self.positions, e3), axis=1) ** 2) * avg_mass)

        correction = np.cross(self.positions, np.tile(com_rotation, (len(self.velocities),1)).view(cctk.OneIndexedArray))
        correction = correction / (np.sum(np.linalg.norm(np.cross(self.positions, e3), axis=1) ** 2) * avg_mass)

        #        self.velocities = self.velocities - correction_x.view(cctk.OneIndexedArray) - correction_y.view(cctk.OneIndexedArray) - correction_z.view(cctk.OneIndexedArray)
        self.velocities = self.velocities - correction.view(cctk.OneIndexedArray)
        print(np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0))
        print(np.linalg.norm(np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)))
        assert np.linalg.norm(np.sum(self.masses() * self.velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"
        assert np.linalg.norm(np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)) < 0.0001, "didn't remove COM rotation well enough!"

        return self

        ### subtract out center-of-mass rotational motion - this was really difficult for me to figure out :/
        print(np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0))
        L = np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)
        w = np.linalg.inv(self._get_inertia_tensor()) * L
        correction_r = np.cross(w.view(cctk.OneIndexedArray), self.positions, axis=0).view(cctk.OneIndexedArray)
        self.velocities = self.velocities - correction_r
        print(np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0))
        assert np.linalg.norm(np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)) < 0.0001, "didn't remove COM rotation well enough!"
        assert np.linalg.norm(np.sum(self.masses() * self.velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

        return self

    def _get_inertia_tensor(self):
        #### adapted from https://github.com/OpenMD/OpenMD/blob/master/src/brains/Thermo.cpp
        assert np.linalg.norm(np.sum(self.positions, axis=0)) < 0.0001, "didn't center well enough!"
        assert np.linalg.norm(np.sum(self.trajectory.masses.reshape(-1,1) * self.velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

        xx, xy, xz, yy, yz, zz = 0, 0, 0, 0, 0, 0
        for x, m in zip(self.positions, self.trajectory.masses):
            xx += x[1]*x[1]*m
            yy += x[2]*x[2]*m
            zz += x[3]*x[3]*m

            xy += x[1]*x[2]*m
            xz += x[1]*x[3]*m
            yz += x[2]*x[3]*m

        I = np.zeros(shape=(3,3))

        I[0,0] = yy + zz
        I[0,1] = -xy
        I[0,2] = -xz
        I[1,0] = -xy
        I[1,1] = xx + zz
        I[1,2] = -yz
        I[2,0] = -xz
        I[2,1] = -yz
        I[2,2] = xx + yy

        return I

    def masses(self):
        return self.trajectory.masses.reshape(-1,1).view(cctk.OneIndexedArray)
