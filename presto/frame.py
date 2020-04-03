import numpy as np
import math, copy, cctk

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

    def __init__(self, x, v, a, active_atoms):
        assert len(x) == len(v), "length of positions not same as length of velocities!"
        assert len(x) == len(a), "length of positions not same as length of accelerations!"

        assert isinstance(x, cctk.OneIndexedArray), "positions is not a one-indexed array!"
        assert isinstance(v, cctk.OneIndexedArray), "velocities is not a one-indexed array!"
        assert isinstance(a, cctk.OneIndexedArray), "accelerations is not a one-indexed array!"

        self.positions = x
        self.velocities = v
        self.accelerations = a
        self.active_atoms = active_atoms

    def next(self):
        integrator = self.trajectory.integrator
        new_x, new_v, new_a = integrator.next(self)
        return Frame(new_x, new_v, new_a)

    def prev(self):
        integrator = self.trajectory.integrator
        new_x, new_v, new_a = integrator.next(self, forwards=False)
        return Frame(new_x, new_v, new_a)

    def temperature(self):
        """
        Computes the temperature based on the equipartition theorem, counting only the active atoms.

        T = sum{ m_i * v_i ** 2 / (kB * Nf) }
        """
        v = [np.linalg.norm(x) for x in velocities[active_atoms]]
        m = trajectory.masses[active_atoms].reshape(-1,1)
        K = m * np.power(v, 2)
        return np.mean(K) / (3 * presto.constants.BOLTZMANN_CONSTANT)

