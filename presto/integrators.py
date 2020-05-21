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

        assert isinstance(quantum_forces, cctk.OneIndexedArray)
        assert isinstance(random_forces, cctk.OneIndexedArray)

        if self.potential is not None:
            potential_forces = self.potential(new_x)
            assert isinstance(potential_forces, cctk.OneIndexedArray)

#            drag_forces = self.drag_forces(frame, forwards, new_x, quantum_forces / frame.masses())
            drag_forces = self.drag_forces(frame, forwards, new_x, (quantum_forces + random_forces) / frame.masses())
            assert isinstance(drag_forces, cctk.OneIndexedArray)

            forces = (quantum_forces  + drag_forces + random_forces + potential_forces) / frame.masses()
            forces[frame.inactive_mask()] = 0
            assert isinstance(forces, cctk.OneIndexedArray)

            return energy, forces
        else:
            drag_forces = self.drag_forces(frame, forwards, new_x, quantum_forces / frame.masses())
#            drag_forces = self.drag_forces(frame, forwards, new_x, (quantum_forces + random_forces) / frame.masses())
            assert isinstance(drag_forces, cctk.OneIndexedArray)

            forces = (quantum_forces  + drag_forces + random_forces) / frame.masses
            forces[frame.inactive_mask()] = 0
            assert isinstance(forces, cctk.OneIndexedArray)

            return energy, forces

    def drag_forces(self, frame, forwards, new_x, new_a, maxiter=50, tolerance=0.00001):
        #### calculate friction coefficient -- should have a factor of 1/mass also
        #### but drag is equal to –1 * xi * mass * velocity so the mass cancels out, so we ignore it.
        xi = 6 * math.pi * self.viscosity * frame.radii()

        prev_vel = super().update_velocities(frame, new_a, forwards)
        assert isinstance(prev_vel, cctk.OneIndexedArray)

        #### define exclusion radius
        no_apply_to = np.linalg.norm(new_x, axis=1) < self.radius

        #### have to do numerical convergence since drag is proportional to instantaneous velocity
        for n in range(maxiter):
            #### calculate drag on current velocity
            #### xi has units of amu fs**-1 and velocity has units of Å fs**-1 so the product has units of amu Å fs**-2 = force
            drag = -1 * xi.reshape(-1,1).view(np.ndarray) * prev_vel.view(np.ndarray)

            #### generate new acceleration and velocity estimates
            accel = new_a.view(np.ndarray) + (drag / frame.masses().view(np.ndarray))
            vel = super().update_velocities(frame, accel.view(cctk.OneIndexedArray), forwards)

            #### if we've converged, return - otherwise iterate again
            if np.mean(np.linalg.norm(prev_vel - vel, axis=0)/np.linalg.norm(prev_vel, axis=0)) < tolerance:
                drag.view(np.ndarray)[no_apply_to,:] = 0
                return drag.view(cctk.OneIndexedArray)
            else:
                prev_vel = vel

        raise ValueError(f"drag calculation didn't converge in {maxiter} cycles!")

    def random_forces(self, frame, new_x):
        #### thermal forces linked to drag by fluctuation-dissipation theorem
        xi = 6 * math.pi * self.viscosity * frame.radii()

        #### implicit 1/mass from xi cancels the mass in the variance expression - overall units are amu**2 Å**2 fs**-4 = (force)**2
        variance =  2 * xi.view(np.ndarray) * presto.constants.BOLTZMANN_CONSTANT * frame.bath_temperature / frame.trajectory.timestep

        no_apply_to = np.linalg.norm(new_x, axis=1) < self.radius
        forces = np.random.normal(loc=0, scale=np.sqrt(variance.reshape(-1,1)), size=new_x.shape)
        forces[no_apply_to,:] = 0
        
        return forces.view(cctk.OneIndexedArray)
        
        #### remove center-of-mass motion
        forces += -np.mean(forces, axis=0)
        forces += np.cross(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0), new_x) / np.power(np.linalg.norm(new_x, axis=1).reshape(-1,1), 2)
        assert np.linalg.norm(np.mean(forces, axis=0)) < 0.01, "didn't remove COM translation very well"

        #### sometimes weird numerical precision errors, just remove rotation twice
        if np.linalg.norm(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0)) > 0.01:
            forces += np.cross(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0), new_x) / np.power(np.linalg.norm(new_x, axis=1).reshape(-1,1), 2)
        assert np.linalg.norm(np.mean(np.cross(forces.view(cctk.OneIndexedArray), new_x), axis=0)) < 1, "didn't remove COM rotation very well"


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
        forces.view(np.ndarray)[inside,:] = 0
        return forces.view(cctk.OneIndexedArray)

    return force
