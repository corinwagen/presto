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

    If ``atom1`` or ``atom2`` is a list, then the closest distance will be taken. This corresponds to Singleton's "interlocking sphere biasing potential".

    Attributes:
        atom1 (int): number of 1st atom
        atom2 (int): number of 2nd atom
        power (float): dependence on distance
        force_constant (float): force constant
        equilibrium (float): desired distance in Å
    """

    def __init__(self, atom1, atom2, equilibrium, power=2, force_constant=10, convert_from_kcal=True):
        assert isinstance(atom1, (list, int)), "atom number must be integer"
        assert isinstance(atom2, (list, int)), "atom number must be integer"
        assert isinstance(power, (int, float)), "power must be numeric"
        assert isinstance(force_constant, (int, float)), "force_constant must be numeric"
        assert isinstance(equilibrium, (int, float)), "equilibrium must be numeric"

        if isinstance(atom1, list):
            assert all(isinstance(x, int) for x in atom1)
        if isinstance(atom2, list):
            assert all(isinstance(x, int) for x in atom2)

        if convert_from_kcal:
            force_constant *= 0.0004184

        self.atom1 = atom1
        self.atom2 = atom2
        self.power = power
        self.force_constant = force_constant
        self.equilibrium = equilibrium

    def __str__(self):
        return f"PairwisePolynomialConstraint(atom1={self.atom1}, atom2={self.atom2}, equilibrium={self.equilibrium:.3f}, power={self.power}, force_constant={self.force_constant:.5f})"

    def __repr__(self):
        return f"PairwisePolynomialConstraint(atom1={self.atom1}, atom2={self.atom2}, equilibrium={self.equilibrium:.3f}, power={self.power}, force_constant={self.force_constant:.5f})"

    def evaluate(self, positions):
        assert isinstance(positions, cctk.OneIndexedArray), "positions must be one-indexed array"
        x1, x2 = None, None

        atoms1 = self.atom1
        atoms2 = self.atom2
        if isinstance(atoms1, int):
            atoms1 = [atoms1]
        if isinstance(atoms2, int):
            atoms2 = [atoms2]

        # this is where we find the right pair of atoms
        min_d = 100
        for x in atoms1:
            for y in atoms2:
                d = np.linalg.norm(positions[x] - positions[y])
                if d < min_d:
                    min_d = d
                    x1 = positions[x]
                    x2 = positions[y]

        delta = np.linalg.norm(x1-x2) - self.equilibrium
        direction = (x2 - x1)/np.linalg.norm(x1-x2)

        forces = np.zeros_like(positions.view(np.ndarray)).view(cctk.OneIndexedArray)
        forces[self.atom1] = delta ** (self.power - 1) * self.force_constant * 1 * direction
        forces[self.atom2] = delta ** (self.power - 1) * self.force_constant * -1 * direction

        energy = self.force_constant / self.power * delta ** self.power

        return forces, energy

class Anchor(Constraint):
    """
    Applies a weak potential fixing an atom towards a given coordinate in space.

    Analogous to Singleton's "zeroatom" keyword.

    Attributes:
        atom (int): number of atom
        coordinate (np.ndarray): desired coordinate
        power (float): dependence on distance
        force_constant (float): force constant
    """

    def __init__(self, atom, coordinate=np.zeros(3), power=2, force_constant=5, convert_from_kcal=True):
        assert isinstance(atom, int), "atom number must be integer"
        assert isinstance(coordinate, np.ndarray), "coordinate must be 3d np.ndarray"
        assert isinstance(power, (int, float)), "power must be numeric"
        assert isinstance(force_constant, (int, float)), "force_constant must be numeric"

        if convert_from_kcal:
            force_constant *= 0.0004184

        self.atom = atom
        self.coordinate = coordinate
        self.power = power
        self.force_constant = force_constant

    def evaluate(self, positions):
        assert isinstance(positions, cctk.OneIndexedArray), "positions must be one-indexed array"
        x = positions[self.atom]

        delta = np.linalg.norm(x)
        direction = (-1 * x)/np.linalg.norm(x)

        forces = np.zeros(positions.shape).view(cctk.OneIndexedArray)
        f = delta ** (self.power - 1) * self.force_constant * direction
        forces[self.atom] = f

        energy = self.force_constant / self.power * delta ** self.power

        return forces, energy

def build_constraints(settings):
    """
    Build constraint list from settings dict.
    """
    constraints = list()
    for row in list(settings.values()):
        assert "atom1" in row, "need ``atom1`` defined for constraint!"
        assert isinstance(row["atom1"], (int, list)), "``atom1`` must be integer or list of integers!"
        assert "atom2" in row, "need ``atom2`` defined for constraint!"
        assert isinstance(row["atom2"], (int, list)), "``atom2`` must be integer or list of integers!"
        assert "equilibrium" in row, "need equilibrium distance ``equilibrium`` defined for constraint!"
        assert isinstance(row["equilibrium"], (int, float)), "``equilibrium`` must be numeric!"

        args = {"atom1": row["atom1"], "atom2": row["atom2"], "equilibrium": row["equilibrium"]}

        if "power" in row:
            assert isinstance(row["power"], int), "``power`` must be integer!"
            args["power" ] = row["power"]

        if "force_constant" in row:
            assert isinstance(row["force_constant"], (int, float)), "``force_constant`` must be numeric"
            args["force_constant"] = row["force_constant"]

        constraints.append(PairwisePolynomialConstraint(**args))
    return constraints


