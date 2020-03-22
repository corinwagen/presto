import numpy as np
import math, copy, cctk
from scipy import constants
from pyhull.convex_hull import ConvexHull

kB = constants.Boltzmann

class Integrator():
    def update_positions():
        pass

    def update_velocities():
        pass

class VelocityVerletIntegrator(Integrator):
    def __init__(self):
        pass

    @classmethod
    def update_positions(cls, positions, velocities, masses, forces, timestep):
        accel = forces / masses.reshape(-1,1)
        return positions + velocities * timestep + accelerations * (timestep ** 2) * 0.5

    @classmethod
    def update_velocities(cls, old_velocities, masses, old_forces, new_forces, timestep):
        old_accel = old_forces / masses.reshape(-1,1)
        new_accel = new_forces / masses.reshape(-1,1)
        return old_velocities + (old_accel + new_accel) * 0.5 * timestep

class LangevinHullIntegrator(Integrator):
    def __init__(self):
        pass

    @classmethod
    def update_positions(cls, positions, velocities, masses, timestep, pressure, temp, viscosity):
        simplices = cls.compute_hull(positions)

        s_forces = cls.pressure_forces(simplices, pressure) + cls.drag_forces(simplices, velocity, viscosity) + cls.random_forces(simplices, viscosity, timestep, temp)

        p_forces = cls.map_forces_to_points(positions, simplices, forces)

        return VelocityVerletIntegrator().update_positions(positions, velocities, masses, p_forces)

    @classmethod
    def compute_hull(cls, positions):
        hull = ConvexHull(positions)
        simplex_vertices = np.array(hull.vertices)
        simplices = [Simplex(idxs, positions[idxs]) for idxs in simplex_vertices]
        return simplices

    @classmethod
    def pressure_forces(cls, simplices, pressure):
        areas = np.array([s.area() for s in simplices])
        normals = np.array([s.normal() for s in simplices])
        return np.multiply(normals, (pressure * areas).reshape(-1,1))

    @classmethod
    def drag_forces(cls, simplices, velocities, viscosity):
        return np.array([s.resistance_tensor(viscosity) @ s.velocity(velocities) for s in simplices])

    @classmethod
    def random_forces(cls, simplices, viscosity, timestep, temp):
        variance = 2 * kB * temp / timestep
        S = (np.linalg.cholesky(s.resistance_tensor(viscosity)) for s in simplices)
        Z = np.random.normal(scale=variance, size=(len(simplices), 3))
        return np.array([s @ z for (s,z) in zip(S,Z)])

    @classmethod
    def map_forces_to_points(cls, positions, simplices, forces):
        p_forces = np.zeros_like(positions)
        for f, s in zip(forces, simplices):
            num = len(s.indices)
            p_forces[s.indices] += f / num
        return p_forces

class Simplex():
    def __init__(self, indices, vertices):
        self.indices = indices
        self.vertices = vertices.astype('d')

    def __str__(self):
        return f"Simplex object with coordinates:\n {str(self.vertices)}"

    def centroid(self):
        return np.mean(self.vertices, axis=0)

    def normal(self):
        n = np.cross(self.vertices[2]-self.vertices[1], self.vertices[2]-self.vertices[0])
        return n/np.linalg.norm(n)

    def area(self):
        return np.linalg.norm(np.cross(self.vertices[2]-self.vertices[1], self.vertices[2]-self.vertices[0]))/2

    def velocity(self, velocities):
        return np.sum(velocities[self.indices], axis=0)/len(self.indices)

    def resistance_tensor(self, viscosity):
        X = np.zeros(shape=(3,3))
        for i in range(0,2):
            new_v = copy.deepcopy(self.vertices)
            new_v[i] = self.centroid()

            new_s = Simplex(None, new_v)
            r_lf = self.centroid() - new_s.centroid()

            k = new_s.area() / (math.pi * 8 * np.linalg.norm(r_lf) * viscosity)
            T_lf = k * (np.eye(3) + r_lf @ r_lf.T / (np.linalg.norm(r_lf) ** 2))
            X += T_lf

        return np.linalg.inv(X)
