import numpy as np
import math, copy, cctk

import presto

class Trajectory():
    """

    Attributes:
        timestep (float): in fs

        high_atoms (np.ndarray): to calculate at high level of theory, list of 1-indexed atom numbers
        active_atoms (np.ndarray): non-frozen atoms, list of 1-indexed atom numbers

        atomic_numbers (cctk.OneIndexedArray): list of atomic numbers
        masses (cctk.OneIndexedArray): list of masses
        radii (cctk.OneIndexedArray): list of VDW radii

        calculator (presto.Calculator):
        integrator (presto.Integrator):

        finished (bool):
    """

    def __init__(self, timestep, atomic_numbers, high_atoms, active_atoms, calculator, integrator, **kwargs):
        assert isinstance(atomic_numbers, cctk.OneIndexedArray), "atomic numbers must be cctk 1-indexed array!"
        assert isinstance(calculator, presto.calculators.Calculator), "need a valid calculator!"
        assert isinstance(integrator, presto.integrators.Integrator), "need a valid integrator!"

        self.atomic_numbers = atomic_numbers
        self.calculator = calculator
        self.integrator = integrator
        self.finished = False

        assert isinstance(high_atoms, np.ndarray), "high_atoms must be np.ndarray!"
        assert isinstance(active_atoms, np.ndarray), "active_atoms must be np.ndarray!"

        self.active_atoms = active_atoms
        self.high_atoms = high_atoms

        assert timestep > 0, "can't have timestep ≤ 0!"
        self.timestep = float(timestep)

        self.masses = cctk.OneIndexedArray([float(cctk.helper_functions.draw_isotopologue(z)) for z in atomic_numbers])

    def run(self, checkpoint_filename, checkpoint_interval, positions):
        if self.has_checkpoint(checkpoint_filename):
            self.load_from_checkpoint(checkpoint_filename)
        else:
            self.initialize(positions)

        if self.finished:
            return

        self.propagate(checkpoint_filename, checkpoint_interval)

    def initialize(self):
        """
        Adds first frame with randomly-initialized velocities.
        """
        pass

    def propagate(self, checkpoint_interval, checkpoint_filename):
        """
        Runs trajectories, checking for completion and saving as necessary.

        Will call ``self.save()`` every ``checkpoint_interval`` frames.
        """
        pass

    def has_checkpoint(self, filename):
        return False

    def load_from_checkpoint(self):
        pass

    def save(self, filename):
        print(f"saving data in {filename}")
        pass

    def write_movie(self, filename):
        pass

    def spawn(self):
        pass

class ReactionTrajectory(Trajectory):
    """
    Attributes:
        forward_frames (list of presto.Frame):
        reverse_frames (list of presto.Frame):
        termination_function (function): detects if first or last Frame has reached product/SM or should otherwise be halted
        max_time (float): how long to run forward and reverse trajectories
    """

    def initialize(self):
        pass

    def propagate(self):
        pass

class EquilibrationTrajectory(Trajectory):
    """
    Attributes:
        forward_frames (list of presto.Frame):
        bath_scheduler (function): takes current time and returns target temperature
        stop_time (float): when to stop equilibrating
    """

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        stop_time = kwargs.get("stop_time")
        bath_scheduler = kwargs.get("bath_scheduler")

        assert (isinstance(stop_time, float)) or (isinstance(stop_time, int)), "stop_time needs to be numeric!"
        assert stop_time > 0, "stop_time needs to be positive!"

        self.stop_time = stop_time
        self.bath_scheduler = bath_scheduler

    def initialize(self, positions):
        """
        Generates initial frame object for initialization trajectory.

        Velocities are taken from the Maxwell–Boltzmann distribution for the given temperature.

        Args:
            positions (cctk.OneIndexedArray):

        Returns:
            frame
        """
        assert isinstance(positions, cctk.OneIndexedArray), "positions must be a one-indexed array!"

        inactive_mask = np.ones(shape=len(positions)).view(cctk.OneIndexedArray)
        inactive_mask[self.active_atoms] = 0
        inactive_mask  = inactive_mask.astype(bool)

        random_gaussian = np.random.normal(size=positions.shape).view(cctk.OneIndexedArray)
        random_gaussian[inactive_mask] = 0
        velocities = random_gaussian * np.sqrt(self.bath_scheduler(0) * presto.constants.BOLTZMANN_CONSTANT / self.masses.reshape(-1,1))

        #### subtract out center-of-mass translational motion
        com_translation = np.sum(self.masses.reshape(-1,1) * velocities, axis=0)
        correction_tran = np.tile(com_translation / np.sum(self.masses[self.active_atoms]), (len(velocities),1))
        correction_tran[inactive_mask] = 0
        velocities = velocities - correction_tran
        com_translation = np.sum(self.masses.reshape(-1,1) * velocities, axis=0)
        assert np.linalg.norm(np.sum(self.masses.reshape(-1,1) * velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

        velocities = velocities.view(cctk.OneIndexedArray)
        accelerations = np.zeros_like(positions).view(cctk.OneIndexedArray)
        self.forward_frames  = [presto.frame.Frame(self, positions, velocities, accelerations, self.active_atoms, self.bath_scheduler(0))]

    def propagate(self, checkpoint_filename, checkpoint_interval):
        assert isinstance(checkpoint_interval, int) and checkpoint_interval > 0, "interval must be positive integer"
        for t in np.arange(self.timestep, self.stop_time, self.timestep):
            print(t)
            self.forward_frames.append(self.forward_frames[-1].next(temp=self.bath_scheduler(t)))
            if len(self.forward_frames) % checkpoint_interval == 0:
                self.save(checkpoint_filename)

