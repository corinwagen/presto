import numpy as np
import math, copy, cctk

import time as timelib

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
        time (float): time of current frame within trajectory, in fs
        energy (float):
        bath_temperature (float):
        dipole (np.ndarray):
        elapsed (float): wallclock time to run frame
        scale_factor (float): amount positions have been scaled by
    """

    def __init__(self, trajectory, x, v, a, time=0, bath_temperature=298, energy=0.0, elapsed=0, scale_factor=1.0, **args):
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

        assert isinstance(elapsed, (float, int, np.integer)), "elapsed needs to be numeric!"

        if time is not None:
            assert isinstance(time, (float, int, np.integer)), "time must be numeric"
            time = float(time)

        self.trajectory = trajectory
        self.positions = x
        self.velocities = v
        self.accelerations = a
        self.bath_temperature = bath_temperature
        self.energy = energy
        self.time = time
        self.elapsed = elapsed
        self.scale_factor = scale_factor

        self.dipole = None
        if "dipole" in args:
            assert isinstance(args["dipole"], np.ndarray), "dipole must be ndarray with 3 elements"
            self.dipole = args["dipole"]

    def __str__(self):
        return f"Frame({len(self.positions)} atoms, time={self.time:.1f})"

    def __repr__(self):
        return f"presto.frame.Frame({len(self.positions)} atoms, time={self.time:.1f})"

    def potential_energy(self):
        """ Returns the potential energy in kcal/mol. """
        return self.energy * presto.constants.KCAL_PER_HARTREE

    def kinetic_energy(self, convert_to_kcal=True):
        """ Returns the kinetic energy in kcal/mol. """
        v = np.linalg.norm(self.velocities[self.trajectory.active_atoms], axis=1)
        m = self.trajectory.masses.view(cctk.OneIndexedArray)[self.trajectory.active_atoms]
        K = np.multiply(m.view(np.ndarray), np.power(v, 2))
        if convert_to_kcal:
            return np.sum(K) / (2 * presto.constants.AMU_A2_FS2_PER_KCAL_MOL)
        else:
            return np.sum(K) / 2

    def total_energy(self):
        """ Returns the total energy. """
        return self.kinetic_energy() + self.potential_energy()

    def temperature(self):
        """
        Computes the instantaneous temperature based on the equipartition theorem, counting only the active atoms.

        T = sum{ m_i * v_i ** 2} / (kB * Nf)
        """
        K = self.kinetic_energy(convert_to_kcal=False) * 2
        F = 3 * len(self.trajectory.active_atoms) - 3

        if F == 0: # single particle
            F = 3

        return float(K / (F * presto.constants.BOLTZMANN_CONSTANT))

    def pressure(self):
        """
        Computes the pressure based on the following formula:

        P = 1/(3*V) * (sum{m_i * v_i * v_i + r_i * f_i}
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
        return self.molecule().volume(qhull=True)

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

        # subtract out center-of-mass translational motion (linear momentum)
        com_translation = np.sum(self.masses() * self.velocities, axis=0)
        correction_tran = np.tile(com_translation / np.sum(self.masses()), (len(self.velocities),1))
        self.velocities = self.velocities - correction_tran
        assert np.linalg.norm(np.sum(self.masses() * self.velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

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

    def add_thermal_energy(self, atoms=None, remove_com_translation=True):
        """
        Add Boltzmann-appropriate thermal energy to atoms.

        Args:
            atoms (list of indices): which atoms to add to. if left blank, will be added to all active atoms.
            remove_com_translation (bool): whether to remove center-of-mass translational motion or not

        Returns:
            nothing
        """
        # build boolean array of which atoms to zero out
        if atoms is None:
            inactive_mask = self.inactive_mask()
        else:
            inactive_mask = np.zeros(shape=len(self.positions)).view(cctk.OneIndexedArray)
            inactive_mask[atoms] = 1
            inactive_mask = inactive_mask.astype(bool)

        # add random velocity to everything
        masses = self.trajectory.masses
        sigma = np.sqrt(self.trajectory.bath_scheduler(0) * presto.constants.BOLTZMANN_CONSTANT / masses.reshape(-1,1))
        velocities = np.random.normal(scale=sigma, size=self.positions.shape).view(cctk.OneIndexedArray)
        velocities[inactive_mask] = 0

        if remove_com_translation:
            com_translation = np.sum(masses.reshape(-1,1) * velocities, axis=0)

            # total COM momentum / sum of masses = velocity to nudge everything by
            correction_tran = np.tile(com_translation / np.sum(masses[~inactive_mask]), (len(velocities),1))
            correction_tran[inactive_mask] = 0
            velocities = velocities - correction_tran

            # check total COM translation
            assert np.linalg.norm(np.sum(masses.reshape(-1,1) * velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

        velocities = velocities.view(cctk.OneIndexedArray)
        self.velocities += velocities

    # 9.17.21 - leaving this method here for convenience, but this is no longer the main way Controller propagates frames.
    def next(self, temp=None, forwards=True):
        """
        Computes next frame using ``self.trajectory.integrator``.
        The desired bath temperature is not used in the current force calculations, but is passed to the output frame.
        """
        if temp is None:
            temp = self.bath_temperature
        assert isinstance(temp, (float, int, np.integer)), "temp must be numeric!"

        try:
            start = timelib.time()
            energy, new_x, new_v, new_a, properties = self.trajectory.integrator.next(self, forwards=forwards, time=self.trajectory.timestep+self.time)
            end = timelib.time()
            elapsed = end - start

            # strictly speaking the energy is for this frame, but we'll give the next frame this energy too in case it's the last one (better than leaving it null).
            self.energy = energy
            return Frame(self.trajectory, new_x, new_v, new_a, bath_temperature=temp, time=self.time+self.trajectory.timestep, energy=energy, elapsed=elapsed)
        except Exception as e:
            raise ValueError(f"Error in frame.next(): {e}")

    def prev(self, temp=None):
        return self.next(temp=temp, forwards=False)

    def scale(self, scale_factor=1):
        """
        Scales a system, used for pressure control.
        """
        self.positions *= scale_factor
        self.scale_factor *= scale_factor
