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

        active_atoms (list): list of indices

        bath_temperature (float):
    """

    def __init__(self, trajectory, x, v, a, active_atoms, bath_temperature=298):
        assert isinstance(trajectory, presto.trajectory.Trajectory), "need trajectory"

        assert len(x) == len(v), "length of positions not same as length of velocities!"
        assert len(x) == len(a), "length of positions not same as length of accelerations!"

        assert isinstance(x, cctk.OneIndexedArray), "positions is not a one-indexed array!"
        assert isinstance(v, cctk.OneIndexedArray), "velocities is not a one-indexed array!"
        assert isinstance(a, cctk.OneIndexedArray), "accelerations is not a one-indexed array!"

        assert (x.ndim == 2) and (x.shape[1] ==  3), "positions must be an n x 3 ndarray"
        assert (v.ndim == 2) and (v.shape[1] ==  3), "velocities must be an n x 3 ndarray"
        assert (a.ndim == 2) and (a.shape[1] ==  3), "accelerations must be an n x 3 ndarray"

        assert (isinstance(bath_temperature, float)) or (isinstance(bath_temperature, int)), "bath temperature needs to be numeric!"
        assert bath_temperature >= 0, "bath temperature must be positive or 0"

        self.trajectory = trajectory
        self.positions = x
        self.velocities = v
        self.accelerations = a
        self.active_atoms = active_atoms
        self.bath_temperature = bath_temperature

    def next(self):
        integrator = self.trajectory.integrator
        new_x, new_v, new_a = integrator.next(self)
        return Frame(self.trajectory, new_x, new_v, new_a, self.active_atoms)

    def prev(self):
        integrator = self.trajectory.integrator
        new_x, new_v, new_a = integrator.next(self, forwards=False)
        return Frame(self.trajectory, new_x, new_v, new_a, self.active_atoms)

    def temperature(self):
        """
        Computes the temperature based on the equipartition theorem, counting only the active atoms.

        T = sum{ m_i * v_i ** 2 / (kB * Nf) }
        """
        v = [np.linalg.norm(x) for x in self.velocities[self.active_atoms]]
        m = self.trajectory.masses[self.active_atoms].reshape(-1,1)
        K = m * np.power(v, 2)
        return np.mean(K) / (3 * presto.constants.BOLTZMANN_CONSTANT)

