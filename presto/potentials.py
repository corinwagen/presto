import numpy as np
import cctk
import presto

class Potential():
    """
    Constraining potential to keep things confined.

    Attributes:
        max_radius (float): maximum allowed distance for particles. for a sphere, this is just the radius. for a cube, it might be half the space diagonal.
            for an ellipsoid, it might be the major radius. used for internal automatic checks.
    """
    def evaluate(self, positions, scale_factor=1):
        """
        Returns energy, forces from a given set of atomic coordinates.

        Args:
            positions (cctk.OneIndexedArray):

        Returns:
            energy (float):
            forces (cctk.OneIndexedArray):
        """
        pass

class SphericalHarmonicPotential(Potential):
    """
    Default force constant is 10 kcal/mol per Å**2, akin to that employed by Singleton (JACS, 2016, 138, 15167).
    In *presto* units, this is 0.004184 amu Å**2 fs**-2.

    Attributes:
        radius (float): area outside which this takes effect.
        force_constant (float):
        convert_from_kcal (bool):
    """
    def __init__(self, radius, force_constant=10, convert_from_kcal=True):
        assert isinstance(radius, (int, float)), "radius must be numeric"
        assert radius > 0, "radius must be positive"

        assert isinstance(force_constant, (int, float)), "force_constant must be numeric"
        assert force_constant > 0, "force_constant must be positive"
        if convert_from_kcal:
            force_constant *= 0.0004184

        self.radius = radius
        self.force_constant = force_constant

        self.max_radius = radius

    def __str__(self):
        return f"SphericalHarmonicPotential(radius={self.radius:.2f},force_constant={self.force_constant:.5f})"

    def __repr__(self):
        return f"SphericalHarmonicPotential(radius={self.radius:.2f},force_constant={self.force_constant:.5f})"

    def evaluate(self, positions, scale_factor=1):
        """
        Evaluates forces on a set of positions.

        Args:
            positions (cctk.OneIndexedArray):
            scale_factor (float): amount to scale radius by when volume is flexible.
        """
        radii = np.linalg.norm(positions, axis=1)
        # distance from equilibrium
        excess_radius = positions - positions/radii.reshape(-1,1) * self.radius * scale_factor

        # F = -k * x
        forces = -1 * self.force_constant * excess_radius

        # E = 0.5 * k * x**2
        energies = 0.5 * self.force_constant * np.linalg.norm(excess_radius, axis=1) ** 2

        # it's a one-sided spring.
        inside = radii < (self.radius * scale_factor)
        forces.view(np.ndarray)[inside,:] = 0
        energies.view(np.ndarray)[inside] = 0

        return np.sum(energies), forces.view(cctk.OneIndexedArray)

def build_potential(settings):
    """
    Build potential from settings dict.
    """
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for potential"
    assert isinstance(settings["type"], str), "Potential `type` must be a string"
    args = dict()

    if settings["type"].lower() == "spherical_harmonic":
        assert "radius" in settings, "need a radius for a spherical_harmonic potential"
        assert isinstance(settings["radius"], (int, float)), "`radius` must be numeric!"
        assert settings["radius"] > 0, "`radius` must be positive!"
        args["radius"] = settings["radius"]

        if "force_constant" in settings:
            assert isinstance(settings["force_constant"], (int, float)), "`force_constant` must be numeric!"
            assert settings["force_constant"] > 0, "`force_constant` must be positive!"
            args["force_constant"] = settings["force_constant"]

        return SphericalHarmonicPotential(**args)

    else:
        raise ValueError(f"Unknown potential type {settings['type']}! Allowed options are `spherical_harmonic` (free will is an illusion).")



