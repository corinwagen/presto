import numpy as np
import math, copy, cctk

import presto

class Trajectory():
    """

    Attributes:
        timestep (float): in fs

        high_atoms (np.ndarray): list of 1-indexed atom numbers
        active_atoms (np.ndarray): list of 1-indexed atom numbers

        atomic_numbers (cctk.OneIndexedArray): list of atomic numbers
        masses (cctk.OneIndexedArray): list of masses
        radii (cctk.OneIndexedArray): list of VDW radii

        calculator (presto.Calculator):
        integrator (presto.Integrator):

    """

    def __init__(self, timestep, atomic_numbers, high_atoms, active_atoms, calculator, integrator):
        assert isinstance(atomic_numbers, cctk.OneIndexedArray), "atomic numbers must be cctk 1-indexed array!"
        assert isinstance(calculator, presto.calculators.Calculator)
        assert isinstance(integrator, presto.integrators.Integrator)

        self.atomic_numbers = atomic_numbers
        self.calculator = calculator
        self.integrator = integrator

        assert timestep > 0, "can't have timestep ≤ 0!"
        self.timestep = float(timestep)

        self.masses = cctk.OneIndexedArray([float(cctk.helper_functions.draw_isotopologue(z)) for z in atomic_numbers])

    def run(self, checkpoint_filename, checkpoint_interval):
        ####
        # some code here that writes/reads?
        ####
        pass

    def save(self):
        pass

    def write_movie(self, filename):
        pass

    def spawn(self):
        pass

class ReactionTrajectory():
    """
    Attributes:
        forward_frames (list of presto.Frame):
        reverse_frames (list of presto.Frame):
        termination_function (function): detects if first or last Frame has reached product/SM or should otherwise be halted
    """

    def run(self, **kwargs):
        super().run(self, **kwargs)

class EquilibrationTrajectory():
    """
    Attributes:
        forward_frames (list of presto.Frame):
        bath_scheduler (function): takes current time and returns target temperature
        stop_time (float): when to stop equilibrating
    """

    def run(self, **kwargs):
        super().run(self, **kwargs)
