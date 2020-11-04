import numpy as np
import math, copy, cctk
from scipy import constants

import presto

class Integrator():
    def next(self, frame, forwards=True):
        pass

class VelocityVerletIntegrator(Integrator):
    def next(self, frame, forwards=True):
        calculator = frame.trajectory.calculator
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1

        x_full = frame.positions + frame.velocities * timestep + 0.5 * frame.accelerations * (timestep ** 2)

        energy, forces = calculator.evaluate(frame.trajectory.atomic_numbers, x_full, frame.trajectory.high_atoms)
        forces[frame.inactive_mask()] = 0

        a_full = forces / frame.masses()

        v_full = frame.velocities + (frame.accelerations + a_full) * 0.5 * timestep

        return energy, x_full, v_full, a_full


class LangevinIntegrator(VelocityVerletIntegrator):
    """
    Defines a Langevin integrator (NVT ensemble).

    Attributes:
        viscosity (float): solvent viscosity (in amu/(fs*Å))
        radius (float): distance from center where this kicks in!
        maxiter (int): maximum number of numerical drag iterations
        tolerance (float): convergence cutoff for numerical drag calculation - smaller is tighter
        potential (float): additional function that maps positions to forces
            needs to return ``cctk.OneIndexedArray``
    """

    def __init__(self, viscosity=0.001, convert_from_pascal_seconds=True, radius=0, potential=None):
        assert isinstance(viscosity, (int, float)), "viscosity must be numeric"
        if convert_from_pascal_seconds:
            viscosity = viscosity * presto.constants.AMU_A_FS_PER_PASCAL_SECOND
        self.viscosity = viscosity

        assert isinstance(radius, (int, float)), "radius must be numeric"
        self.radius = radius

        # if you use this, it's your own problem to check that you did it right!
        self.potential = potential

    def old_next(self, frame, forwards=True):
        calculator = frame.trajectory.calculator
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1

        v_half = frame.velocities + 0.5 * frame.accelerations * timestep

        x_full = frame.positions + v_half * timestep

        energy, forces = calculator.evaluate(frame.trajectory.atomic_numbers, x_full, frame.trajectory.high_atoms)

        #### compute random forces
        xi = 6 * math.pi * self.viscosity * frame.radii()
        variance =  2 * xi * presto.constants.BOLTZMANN_CONSTANT * frame.bath_temperature / frame.trajectory.timestep
        no_apply_to = np.linalg.norm(x_full, axis=1) < self.radius

        random_forces = np.random.normal(loc=0, scale=np.sqrt(variance.reshape(-1,1)), size=x_full.shape)
        random_forces[no_apply_to,:] = 0
        forces += random_forces.view(cctk.OneIndexedArray)

        if self.potential is not None:
            forces += self.potential(x_full)

        #### compute drag
        drag = np.zeros_like(random_forces).view(cctk.OneIndexedArray)
        v_full = v_half + 0.5 * (forces / frame.masses()) * timestep

        #### have to do numerical convergence since drag is proportional to instantaneous velocity
        for n in range(self.maxiter):
            prev_v = v_full
            drag = -1 * xi.reshape(-1,1) * v_full
            v_full = v_half + 0.5 * ((forces + drag) / frame.masses()) * timestep

            #### if we've converged, return - otherwise iterate again
            if np.mean(np.linalg.norm(prev_v - v_full, axis=0)/np.linalg.norm(prev_v, axis=0)) < self.tolerance:
                break

        drag.view(np.ndarray)[no_apply_to,:] = 0
        forces += drag

        forces[frame.inactive_mask()] = 0
        a_full = forces / frame.masses()

        return energy, x_full, v_full, a_full

    def next(self, frame, forwards=True):
        """
        Using the approach from http://itf.fys.kuleuven.be/~enrico/Teaching/molecular_dynamics_2015.pdf
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

        energy, forces = calculator.evaluate(frame.trajectory.atomic_numbers, x_full, frame.trajectory.high_atoms)
        forces[frame.inactive_mask()] = 0
        a_full = forces / frame.masses()

        v_full = frame.velocities + 0.5 * timestep * (a_full + frame.accelerations) - timestep * xi * frame.velocities + sigma * math.sqrt(timestep) * rand1 - xi * C

        return energy, x_full, v_full, a_full


def spherical_harmonic_potential(radius, force_constant=0.004184):
    """
    Default force constant is 10 kcal/mol per Å**2, akin to that employed by Singleton (JACS, 2016, 138, 15167).

    In *presto* units, this is 0.004184 amu Å**2 fs**-2.

    Args:
        radius (float): area outside which this takes effect
        force_constant (float):

    Returns:
        function mapping positions to forces with the desired force constant and radius
    """
    assert isinstance(radius, (int, float))
    assert isinstance(force_constant, (int, float))
    assert radius > 0
    assert force_constant > 0

    def force(positions):
        radii = np.linalg.norm(positions, axis=1)
        forces = -0.5 * force_constant * (positions - positions/radii.reshape(-1,1) * radius)
        forces = forces * np.linalg.norm(positions - positions/radii.reshape(-1,1) * radius, axis=1).reshape(-1,1)
        inside = radii < radius
        forces.view(np.ndarray)[inside,:] = 0
        return forces.view(cctk.OneIndexedArray)

    return force
