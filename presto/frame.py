import numpy as np
import math, copy, cctk

import cctk
from cctk.helper_functions import get_symbol, get_vdw_radius

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
        Computes the instantaneous temperature based on the equipartition theorem, counting only the active atoms.

        T = sum{ m_i * v_i ** 2} / (kB * Nf)
        """
        v = np.linalg.norm(self.velocities[self.trajectory.active_atoms], axis=1)
        m = self.trajectory.masses.view(cctk.OneIndexedArray)[self.trajectory.active_atoms]
        K = np.multiply(m.view(np.ndarray), np.power(v, 2))
        F = 3 * len(self.trajectory.active_atoms) - 3

        if F == 0: # single particle
            F = 3

        return float(np.sum(K) / (F * presto.constants.BOLTZMANN_CONSTANT))

    def pressure(self):
        """
        Computes the pressure based on the following formula:

        P = 1/(3*V) * (\sum{m_i * v_i * v_i + r_i * f_i}
        """
        m = self.trajectory.masses.view(cctk.OneIndexedArray)[self.trajectory.active_atoms].view(np.ndarray)
        v = self.velocities[self.trajectory.active_atoms].view(np.ndarray)
        a = self.accelerations[self.trajectory.active_atoms].view(np.ndarray)
        x = self.positions[self.trajectory.active_atoms].view(np.ndarray)

        volume = self.volume()

        v = np.linalg.norm(self.velocities[self.trajectory.active_atoms], axis=1)
        m = self.trajectory.masses.view(cctk.OneIndexedArray)[self.trajectory.active_atoms]
        K = np.multiply(m.view(np.ndarray), np.power(v, 2))

        pressure = np.sum(K) / (3 * volume)
        for pos, mass, accel in zip(x, m, a):
            pressure += np.dot(pos, mass * accel) / (3 * volume)

        return pressure / presto.constants.AMU_A_FS2_PER_ATM

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

    def molecule(self, idxs=None):
        if idxs is not None:
            return cctk.Molecule(self.trajectory.atomic_numbers[idxs], self.positions[idxs])
        else:
            return cctk.Molecule(self.trajectory.atomic_numbers, self.positions)

    def remove_com_motion(self):
        # move centroid to origin
        centroid = np.mean(self.positions, axis=0)
        self.positions = self.positions - centroid
        assert np.linalg.norm(np.sum(self.positions, axis=0)) < 0.0001, "didn't center well enough!"

        #### subtract out center-of-mass translational motion (linear momentum)
        com_translation = np.sum(self.masses() * self.velocities, axis=0)
        correction_tran = np.tile(com_translation / np.sum(self.masses()), (len(self.velocities),1))
        self.velocities = self.velocities - correction_tran
        assert np.linalg.norm(np.sum(self.masses() * self.velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

        return self

        #### subtract out center-of-mass rotational motion - not working
        com_rotation = np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)
        print(com_rotation)

        repeat_com_rotation = np.tile(com_rotation, (self.positions.shape[0], 1))
        parallel_position_vectors = np.dot(self.positions, com_rotation).reshape(-1,1) / np.dot(com_rotation, com_rotation) * repeat_com_rotation
        perp_position_vectors = self.positions - parallel_position_vectors

        correction = np.cross(
            perp_position_vectors,
            com_rotation,
        ).view(cctk.OneIndexedArray)

        scale = np.power(np.linalg.norm(perp_position_vectors, axis=1), 2).reshape(-1,1) * self.masses()
        scale = self.masses()
        correction = correction / scale

        correction_applied = np.sum(np.cross(correction, self.masses() * self.positions), axis=0)
        correction = correction * np.linalg.norm(com_rotation) / (np.linalg.norm(correction_applied))
        self.velocities = self.velocities - correction.view(cctk.OneIndexedArray)

        assert np.linalg.norm(np.sum(self.masses() * self.velocities, axis=0)) < 0.0001, "COM rotation correction introduced translation!"
        assert np.linalg.norm(np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)) < 0.0001, "didn't remove COM rotation well enough!"
        return self

    def masses(self):
        return self.trajectory.masses.reshape(-1,1).view(cctk.OneIndexedArray)

    def radii(self):
        vdw_radii = {z: get_vdw_radius(z) for z in set(self.trajectory.atomic_numbers)}
        radii_by_num = np.array([vdw_radii[z] for z in self.trajectory.atomic_numbers]).view(cctk.OneIndexedArray)
        return radii_by_num

    def L(self):
        """ Angular momentum """
        return np.sum(np.cross(self.velocities, self.masses() * self.positions), axis=0)
