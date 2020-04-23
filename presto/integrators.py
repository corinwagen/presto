import numpy as np
import math, copy, cctk
from scipy import constants
from pyhull.convex_hull import ConvexHull

kB = constants.Boltzmann

class Integrator():
    def next():
        pass

class VelocityVerletIntegrator(Integrator):
    """
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
        print("UPDATING POSITIONS")
        print(f"x = {frame.positions}")
        print(f"v = {frame.velocities} * {timestep}")
        print(f"a = 0.5 * {frame.accelerations} * {timestep ** 2}")
        return frame.positions + frame.velocities * timestep + frame.accelerations * (timestep ** 2) * 0.5

    def update_accelerations(self, frame, new_x, forwards):
        calculator = frame.trajectory.calculator
        energy, forces = calculator.evaluate(frame.trajectory.atomic_numbers, new_x)
        forces[frame.inactive_mask()] = 0
        masses = frame.trajectory.masses
        print("UPDATING ACCEL")
        print(f"f = {forces}")
        print(f"m = {masses}")
        print(f"a = {forces / masses.reshape(-1,1)}")
        return energy, forces / masses.reshape(-1,1)

    def update_velocities(self, frame, new_a, forwards):
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1
        print("UPDATING VELOCITIES")
        print(f"v = {frame.velocities}")
        print(f"a0 = {frame.accelerations}")
        print(f"a1 = {new_a}")
        return frame.velocities + (frame.accelerations + new_a) * 0.5 * timestep

class ThreeLayerIntegrator(VelocityVerletIntegrator):
    """
    Defines an integrator (NVT ensemble). This integrator will confine atoms to a spherical region with radius ``r2``.
    Layer 1 - Newtonian dynamics
    Layer 2 - Langevin dynamics
    Layer 3 - Langevin dynamics plus elastic restoring force

    Attributes:
        r1 (float): radius between Layer 1 and Layer 2
        r2 (float): radius between Layer 2 and Layer 3
        viscosity (float): solvent viscosity
        timestep (float): simulation timestep in fs
    """

    def __init__(self, r1, r2, viscosity, timestep):
        assert r1 < r2, "r1 must be smaller than r2"
        self.r1 = r1
        self.r2 = r2
        self.viscosity = viscosity
        self.timestep = timestep

    def update_positions(self, positions, velocities, masses, radii, forces):
        """
        Args:
            positions (np.ndarray)
            velocities (np.ndarray)
            masses (np.ndarray)
            radii (np.ndarray): VDW radii of atoms
            forces (np.ndarray)
        """
        positions = positions.view(np.ndarray)
        layer = np.ones_like(positions)
        for idx, v in np.ndenumerate(positions):
            rad = np.linalg.norm(v)
            if rad > self.r2:
                layer[idx] = 3
            elif rad > self.r1:
                layer[idx] = 2

        drag_forces = self.drag_forces(velocities, layer)
        random_forces = self.random_forces(positions, layer)
        elastic_forces = self.elastic_forces(positions, layer)

        super().update_positions(positions, velocities, masses, forces + drag_forces + random_forces + elastic_forces)

    def update_velocities(self, old_velocities, masses, old_forces, new_forces, timestep):
        pass

    def drag_forces(self, velocities, radii, layer, maxiter=50):
        xi = 6 * math.pi * self.viscosity * radii
        old_drag = np.zeros_like(radii)
        pred_vel = velocities
        for n in range(1, maxiter):
            drag = -1 * xi * velocities
            drag[layer == 1] = 0

    def random_forces(self, positions, layer):
        xi = 6 * math.pi * self.viscosity * radii
        variance =  2.0 * xi * kb * T_target / dt #### need to work out units here

        forces = np.random.normal(scale=xi, size=(len(positions), 3))
        forces[layer == 1] = 0
        forces += -np.mean(forces, axis=0)
        forces += -np.mean(np.cross(forces, positions), axis=0)
        return(forces)

    def elastic_forces(self, positions, layer):
        pass

