import numpy as np
import math, copy, cctk

import presto

class Constraint():

    def __init__(self):
        pass

    def evaluate(self, positions):
        """
        Returns forces and energy.
        """
        pass

class PairwisePolynomialConstraint(Constraint):
    """
    Represents a pairwise constraint of the form: – energy = ``constant`` / ``power`` * (distance - ``equilibrium``) ** ``power``.

    This will lead to a force of the form ``constant`` * (distance - ``equilibrium``) ** (``power`` - 1).

    Attributes:
        atom1 (int): number of 1st atom
        atom2 (int): number of 2nd atom
        power (float): dependence on distance
        force_constant (float): force constant
        equilibrium (float): desired distance in Å
    """

    def __init__(self, atom1, atom2, equilibrium, power=2, force_constant=10, convert_from_kcal=True):
        assert isinstance(atom1, int), "atom number must be integer"
        assert isinstance(atom2, int), "atom number must be integer"
        assert isinstance(power, (int, float)), "power must be numeric"
        assert isinstance(force_constant, (int, float)), "force_constant must be numeric"
        assert isinstance(equilibrium, (int, float)), "equilibrium must be numeric"

        if convert_from_kcal:
            force_constant *= 0.0004184

        self.atom1 = atom1
        self.atom2 = atom2
        self.power = power
        self.force_constant = force_constant
        self.equilibrium = equilibrium

    def evaluate(self, positions):
        assert isinstance(positions, cctk.OneIndexedArray), "positions must be one-indexed array"
        x1 = positions[self.atom1]
        x2 = positions[self.atom2]

        delta = np.linalg.norm(x1-x2) - self.equilibrium
        direction = (x2 - x1)/np.linalg.norm(x1-x2)

        forces = np.zeros_like(positions.view(np.ndarray)).view(cctk.OneIndexedArray)
        forces[self.atom1] = delta ** (self.power - 1) * self.force_constant * 1 * direction
        forces[self.atom2] = delta ** (self.power - 1) * self.force_constant * -1 * direction

        energy = self.force_constant / self.power * delta ** self.power

        return forces, energy
