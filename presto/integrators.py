import numpy as np
import math, copy, cctk
from scipy import constants
from pyhull.convex_hull import ConvexHull

import presto

class Integrator():
    def next(self, frame, forwards=True):
        pass

class VelocityVerletIntegrator(Integrator):
    """
    The standard velocity Verlet algorithm.
    """
    def __init__(self):
        pass

    def next(self, frame, forwards=True):
        calculator = frame.trajectory.calculator

        new_x = self.update_positions(frame, forwards)
        energy, new_a = self.update_accelerations(frame, new_x, forwards)
        new_v = self.update_velocities(frame, new_a, forwards)

        return energy, new_x, new_v, new_a

    def update_positions(self, frame, forwards):
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1
        return frame.positions + frame.velocities * timestep + frame.accelerations * (timestep ** 2) * 0.5

    def update_accelerations(self, frame, new_x, forwards):
        calculator = frame.trajectory.calculator
        energy, forces = calculator.evaluate(frame.trajectory.atomic_numbers, new_x, frame.trajectory.high_atoms)
        forces[frame.inactive_mask()] = 0
        return energy, forces / frame.masses()

    def update_velocities(self, frame, new_a, forwards):
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1
        return frame.velocities + (frame.accelerations + new_a) * 0.5 * timestep

class LangevinIntegrator(VelocityVerletIntegrator):
    """
    Defines a Langevin integrator (NVT ensemble).

    Attributes:
        viscosity (float): solvent viscosity (in amu/(fs*Å))
        radius (float): distance from center where this kicks in!
        potential (float): additional function that maps positions to forces
            needs to return ``cctk.OneIndexedArray``
    """

    def __init__(self, viscosity, convert_from_pascal_seconds=True, radius=0, potential=None):
        assert isinstance(viscosity, (int, float)), "viscosity must be numeric"
        if convert_from_pascal_seconds:
            viscosity = viscosity * presto.constants.AMU_A_FS_PER_PASCAL_SECOND
        self.viscosity = viscosity

        assert isinstance(radius, (int, float)), "radius must be numeric"
        self.radius = radius

        # if you use this, it's your own problem to check that you did it right!
        self.potential = potential

    def update_accelerations(self, frame, new_x, forwards):
        energy, quantum_accels = super().update_accelerations(frame, new_x, forwards)
        quantum_forces = quantum_accels * frame.masses()

        random_forces = self.random_forces(frame, new_x)
        drag_forces = self.drag_forces(frame, forwards, new_x, (quantum_forces + random_forces) / frame.masses())

        if self.potential is not None:
            potential_force = self.potential(new_x)
            return energy, (quantum_forces + drag_forces + random_forces + potential_force) / frame.masses()
        else:
            return energy, (quantum_forces + drag_forces + random_forces) / frame.masses()

    def drag_forces(self, frame, forwards, new_x, new_a, maxiter=50, tolerance=0.00001):
        #### calculate friction coefficient -- should have a factor of 1/mass also
        #### but drag is equal to –1 * xi * mass * velocity so the mass cancels out, so we ignore it.
        xi = 6 * math.pi * self.viscosity * frame.radii()
        old_vel = super().update_velocities(frame, new_a, forwards)

        apply_to = np.linalg.norm(new_x, axis=1) > self.radius

        #### have to do numerical convergence since drag is proportional to instantaneous velocity
        for n in range(maxiter):
            drag = -1 * xi.reshape(-1,1).view(cctk.OneIndexedArray) * old_vel
            pred_vel = super().update_velocities(frame, new_a + drag.view(cctk.OneIndexedArray) / frame.masses(), forwards)

            if np.mean(np.linalg.norm(pred_vel - old_vel, axis=0)/np.linalg.norm(pred_vel, axis=0)) < tolerance:
                return drag[apply_to].view(cctk.OneIndexedArray)
            else:
                old_vel = pred_vel

        raise ValueError(f"drag calculation didn't converge in {maxiter} cycles!")

    def random_forces(self, frame, new_x):
        xi = 6 * math.pi * self.viscosity * frame.radii()
        #### thermal forces linked to drag by fluctuation-dissipation theorem
        variance =  2 * xi * presto.constants.BOLTZMANN_CONSTANT * frame.bath_temperature / frame.trajectory.timestep
        forces = np.random.normal(size=new_x.shape)
        forces = forces / np.linalg.norm(forces, axis=1).reshape(-1,1) * np.random.normal(scale=np.sqrt(variance), size=variance.shape).reshape(-1,1)

        no_apply_to = np.linalg.norm(new_x, axis=1) < self.radius
        forces[no_apply_to,:] = 0

        #### remove center-of-mass motion
        forces += -np.mean(forces, axis=0)
        forces += np.cross(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0), new_x) / np.power(np.linalg.norm(new_x, axis=1).reshape(-1,1), 2)
        assert np.linalg.norm(np.mean(forces, axis=0)) < 0.01, "didn't remove COM translation very well"

        #### sometimes weird numerical precision errors, just remove rotation twice
        if np.linalg.norm(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0)) > 0.01:
            forces += np.cross(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0), new_x) / np.power(np.linalg.norm(new_x, axis=1).reshape(-1,1), 2)
        assert np.linalg.norm(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0)) < 1, "didn't remove COM rotation very well"

        return forces.view(cctk.OneIndexedArray)

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
        forces = -1 * force_constant * (positions - positions/radii.reshape(-1,1) * radius)
        forces = forces * np.linalg.norm(positions - positions/radii.reshape(-1,1) * radius, axis=1).reshape(-1,1)
        inside = radii < radius
        forces[inside,:] = 0
        return forces.view(cctk.OneIndexedArray)

    return force
