import numpy as np
import math, copy, cctk
from scipy import constants

import presto

class Integrator():
    def next(self, frame, forwards=True, time=None):
        pass

class VelocityVerletIntegrator(Integrator):
    """
    Defines a Velocity Verlet integrator (NVE ensemble).

    Attributes:
    """

    def __init__(self):
        pass

    def next(self, frame, forwards=True, time=None, **args):
        calculator = frame.trajectory.calculator
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1

        try:
            x_full = frame.positions + frame.velocities * timestep + 0.5 * frame.accelerations * (timestep ** 2)

            energy, forces, properties = calculator.evaluate(frame.trajectory.atomic_numbers, x_full, frame.trajectory.high_atoms, time=time, scale_factor=frame.scale_factor, **args)
            forces[frame.inactive_mask()] = 0

            a_full = forces / frame.masses()
            v_full = frame.velocities + (frame.accelerations + a_full) * 0.5 * timestep
            return energy, x_full, v_full, a_full, properties

        except Exception as e:
            raise ValueError(f"Error in integrator: {e}")


class LangevinIntegrator(VelocityVerletIntegrator):
    """
    Defines a Langevin integrator (NVT ensemble).

    Attributes:
        viscosity (float): solvent viscosity (in amu/(fs*Å))
        radius (float): distance from center where this kicks in!
    """

    def __init__(self, viscosity=0.001, convert_from_pascal_seconds=True, radius=0):
        assert isinstance(viscosity, (int, float)), "viscosity must be numeric"
        if convert_from_pascal_seconds:
            viscosity = viscosity * presto.constants.AMU_A_FS_PER_PASCAL_SECOND
        self.viscosity = viscosity

        assert isinstance(radius, (int, float)), "radius must be numeric"
        self.radius = radius

    def next(self, frame, forwards=True, time=None, **args):
        """
        Using the approach from http://itf.fys.kuleuven.be/~enrico/Teaching/molecular_dynamics_2015.pdf
        (Vanden-Eijden–Ciccotti second-order Langevin integrator)
        """
        calculator = frame.trajectory.calculator
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1

        xi = 6 * math.pi * self.viscosity * frame.radii() / frame.trajectory.masses
        sigma = np.sqrt(2 * xi * presto.constants.BOLTZMANN_CONSTANT * frame.bath_temperature / frame.trajectory.masses)

        # exclude those beyond the radius
        no_apply_to = np.linalg.norm(frame.positions, axis=1) < self.radius
        xi[no_apply_to] = 0
        sigma[no_apply_to] = 0
        xi = xi.reshape(-1,1)
        sigma = sigma.reshape(-1,1)

        rand1 = np.random.normal(size=frame.positions.shape).view(cctk.OneIndexedArray)
        rand2 = np.random.normal(size=frame.positions.shape).view(cctk.OneIndexedArray)

        C = 0.5 * (timestep ** 2) * (frame.accelerations - (xi * frame.velocities)) + sigma * (timestep ** 1.5) * ((0.5 * rand1) + (rand2 / (2 * math.sqrt(3))))

        x_full = frame.positions + timestep * frame.velocities + C
        x_full[frame.inactive_mask()] = frame.positions[frame.inactive_mask()] # stay still!

        # compute forces with Calculator
        energy, forces, properties = calculator.evaluate(frame.trajectory.atomic_numbers, x_full, frame.trajectory.high_atoms, time=time, scale_factor=frame.scale_factor, **args)
        forces[frame.inactive_mask()] = 0

        a_full = forces / frame.masses()
        v_full = frame.velocities + 0.5 * timestep * (a_full + frame.accelerations) - timestep * xi * frame.velocities + sigma * math.sqrt(timestep) * rand1 - xi * C
        v_full[frame.inactive_mask()] = 0

        return energy, x_full, v_full, a_full, properties

def build_integrator(settings):
    """
    Build integrator from settings dict.
    """
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for integrator"
    assert isinstance(settings["type"], str), "Integrator `type` must be a string"

    if settings["type"].lower() == "verlet":
        return VelocityVerletIntegrator()
    elif settings["type"].lower() == "langevin":
        assert "viscosity" in settings, "Need `viscosity` for Langevin integrator!"
        assert isinstance(settings["viscosity"], (int, float)), "Integrator `viscosity` must be numeric."

        radius = 0
        if "radius" in settings:
            assert isinstance(settings["radius"], (int, float)), "Integrator `radius` must be numeric."
            radius = settings["radius"]

        return LangevinIntegrator(settings["viscosity"], radius=radius)
    else:
        raise ValueError(f"Unknown integrator type {settings['type']}! Allowed options are `verlet` or `langevin`.")

