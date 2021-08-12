import numpy as np
import math, copy, cctk, logging
from cctk.helper_functions import get_covalent_radius
from scipy import constants

import presto

logger = logging.getLogger(__name__)

class Integrator():
    def next(self, frame, forwards=True):
        pass

class VelocityVerletIntegrator(Integrator):
    """
    Defines a Velocity Verlet integrator (NVE ensemble).

    Attributes:
        potential (presto.potentials.Potential): confining potential
    """

    def __init__(self, potential=None):
        if potential is not None:
            assert isinstance(potential, presto.potentials.Potential), f"needed a presto.Potential, got a {potential} instead"
        self.potential = potential

    def next(self, frame, forwards=True, time=None):
        calculator = frame.trajectory.calculator
        timestep = frame.trajectory.timestep
        if forwards == False:
            timestep = timestep * -1

        atomic_numbers = frame.trajectory.atomic_numbers
        high_atoms = frame.trajectory.high_atoms

        x_full = frame.positions + frame.velocities * timestep + 0.5 * frame.accelerations * (timestep ** 2)

        # no checks are being done here

        energy, forces = calculator.evaluate(atomic_numbers, x_full, high_atoms, time=time)
        if self.potential is not None:
            pe, pf = self.potential.evaluate(x_full)
            forces += pf
            energy += pe
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
        potential (presto.potentials.Potential): confining potential
    """

    def __init__(self, viscosity=0.001, convert_from_pascal_seconds=True, radius=0, potential=None):
        assert isinstance(viscosity, (int, float)), "viscosity must be numeric"
        if convert_from_pascal_seconds:
            viscosity = viscosity * presto.constants.AMU_A_FS_PER_PASCAL_SECOND
        self.viscosity = viscosity

        assert isinstance(radius, (int, float)), "radius must be numeric"
        self.radius = radius

        if potential is not None:
            assert isinstance(potential, presto.potentials.Potential), f"needed a presto.Potential, got a {potential} instead"
        self.potential = potential

    def next(self, frame, forwards=True, time=None):
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

        # check if any atoms are too close in all layers
        first_molecule = cctk.Molecule(frame.trajectory.atomic_numbers, frame.trajectory.frames[0].positions)
        first_molecule.assign_connectivity(cutoff=0.5)
        molecule = cctk.Molecule(frame.trajectory.atomic_numbers, x_full)
        if len(frame.trajectory.frames) == 0:
            molecule.assign_connectivity()
        else:
           molecule.bonds = first_molecule.bonds

        clashes = is_clashing(molecule)
        if clashes:
            logger.info(f"Atoms too close in Langevin integrator at {frame.time:.1f} fs!")
            raise ValueError("atoms too close")

        # check if the molecule in the high layer exploded
        high_atoms = frame.trajectory.high_atoms
        first_molecule = cctk.Molecule(frame.trajectory.atomic_numbers[high_atoms], frame.trajectory.frames[0].positions[high_atoms])
        first_molecule.assign_connectivity(cutoff=0.1)
        molecule = cctk.Molecule(frame.trajectory.atomic_numbers[high_atoms], x_full[high_atoms])

        # ignore the check until we've had some time to enforce the constraints
        exploded = is_exploded(first_molecule, molecule)
        if frame.time > 100.0 and exploded:
            logger.info(f"Atoms too far apart in Langevin integrator at {frame.time:.1f} fs!")
            raise ValueError("atoms too far apart")

        energy, forces = calculator.evaluate(frame.trajectory.atomic_numbers, x_full, frame.trajectory.high_atoms, time=time)
        if self.potential is not None:
            pe, pf = self.potential.evaluate(x_full)
            forces += pf
            energy += pe

        forces[frame.inactive_mask()] = 0
        a_full = forces / frame.masses()

        v_full = frame.velocities + 0.5 * timestep * (a_full + frame.accelerations) - timestep * xi * frame.velocities + sigma * math.sqrt(timestep) * rand1 - xi * C
        v_full[frame.inactive_mask()] = 0

        # check for NaN velocities
        has_bad_velocity = np.isnan(v_full).any()
        if has_bad_velocity:
            logger.info("NaN velocity found")
            logger.info(f"NaN indices: {np.argwhere(np.isnan(v_full))}")
            raise ValueError("NaN velocity found")

        return energy, x_full, v_full, a_full

def build_integrator(settings, potential=None):
    """
    Build integrator from settings dict.
    """
    assert isinstance(settings, dict), "Need to pass a dictionary!!"
    assert "type" in settings, "Need `type` for integrator"
    assert isinstance(settings["type"], str), "Integrator `type` must be a string"

    if settings["type"].lower() == "verlet":
        return VelocityVerletIntegrator(potential=potential)
    elif settings["type"].lower() == "langevin":
        assert "viscosity" in settings, "Need `viscosity` for Langevin integrator!"
        assert isinstance(settings["viscosity"], (int, float)), "Integrator `viscosity` must be numeric."

        radius = 0
        if "radius" in settings:
            assert isinstance(settings["radius"], (int, float)), "Integrator `radius` must be numeric."
            radius = settings["radius"]

        return LangevinIntegrator(settings["viscosity"], radius=radius, potential=potential)
    else:
        raise ValueError(f"Unknown integrator type {settings['type']}! Allowed options are `verlet` or `langevin`.")

# checks if there are clashes in the given molecule, ignoring directly bonded atoms
def is_clashing(molecule, min_buffer=0.5):
    bonds = molecule.bonds
    n_bonds = len(bonds.edges)
    assert n_bonds > 0, "must assign connectivity first"
    n_atoms = len(molecule.geometry)
    for i in range(1,n_atoms+1):
        for j in range(i+1,n_atoms+1):
            are_bonded = bonds.has_edge(i,j)
            if are_bonded:
                continue
            distance = molecule.get_distance(i, j, check=False)
            r_i = get_covalent_radius(molecule.get_atomic_number(i))
            r_j = get_covalent_radius(molecule.get_atomic_number(j))

            if distance < (r_i + r_j - min_buffer):
                logger.info(f"distance between atom {ref_molecule.get_atomic_symbol(i)}{i} and atom {ref_molecule.get_atomic_symbol(j)}{j} is {distance:.3f}, which is too close")
                logger.info(f"high atoms were: {str(high_atoms)}")
                return True
    return False

# if many atoms in the high layer get too far apart, raise the alarm
def is_exploded(ref_molecule, new_molecule, threshold=1.0, n_pairs_threshold=5):
    bonds = ref_molecule.bonds
    n_pairs = 0
    for i,j in bonds.edges:
        ref_dist = ref_molecule.get_distance(i,j, check=False)
        new_dist = new_molecule.get_distance(i,j, check=False)
        delta = new_dist - ref_dist
        if delta > threshold:
            logger.info(f"distance between atom {ref_molecule.get_atomic_symbol(i)}{i} and atom {ref_molecule.get_atomic_symbol(j)}{j} is now {new_dist:.3f} but was previously {ref_dist:.3f}")
            n_pairs += 1
    if n_pairs >= n_pairs_threshold:
        logger.info(">>> {n_pairs} bonds are unusually long, so it's likely this structure exploded")
        return True
    if n_pairs > 0:
        logger.info(f"> {n_pairs} bonds are unusually long")
    return False
