import numpy as np
import math, copy, cctk

class Trajectory():
    """

    Attributes:
        timestep (float): in fs

        solute_atoms (np.ndarray): list of 1-indexed atom numbers
        solvent_atoms (np.ndarray): list of 1-indexed atom numbers
        active_atoms (np.ndarray): list of 1-indexed atom numbers

        atomic_numbers (cctk.OneIndexedArray): list of atomic numbers
        masses (cctk.OneIndexedArray): list of masses
        radii (cctk.OneIndexedArray): list of VDW radii

        calculator (presto.Calculator):
        integrator (presto.Integrator):

    """

    def __init__(self):
        pass

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
