import presto, logging, cctk
import numpy as np

logger = logging.getLogger(__name__)

class Check():
    """
    Class for recurring trajectory check.
    """
    def __init__(self, interval=20):
        assert isinstance(interval, int), "interval must be integer"
        self.interval = interval

    def check(self, trajectory):
        """
        Checks a trajectory. Will raise an exception if anything is wrong.

        Args:
            trajectory (presto.trajectory.Trajectory): trajectory to check

        Returns:
            nothing
        """
        pass

class VelocityCheck(Check):
    """
    Checks that velocities stay sane.

    Attributes:
        interval (int): interval to check at
        max_velocity (float): velocity not to exceed (per component).
    """
    def __init__(self, interval=20, max_velocity=1, **kwargs):
        assert isinstance(interval, int), "interval must be integer"
        self.interval = interval

        assert isinstance(max_velocity, (int, float)), "max_velocity must be numeric"
        self.max_velocity = max_velocity

    def check(self, trajectory):
        frame = trajectory.frames[-1]
        assert np.max(frame.velocities) < self.max_velocity, f"VelocityCheck failed! max allowed: {self.max_velocity:.2f}, max obtained; {np.max(frame.velocities):.2f}"

class RadiusCheck(Check):
    """
    Checks that particles do not go past a set radius. By default, there is a 10% buffer past the applied potential.

    Attributes:
        interval (int): interval to check at
        buffer (float): multiplied by ``potential.max_radius`` to give max allowable radius
    """
    def __init__(self, interval=20, buffer=1.1, **kwargs):
        assert isinstance(interval, int), "interval must be integer"
        self.interval = interval

        assert isinstance(buffer, (int, float)), "buffer must be numeric"
        self.buffer = buffer

    def check(self, trajectory):
        frame = trajectory.frames[-1]
        positions = frame.positions.view(np.ndarray)
        radii = np.linalg.norm(frame.positions, axis=1)
        max_r = trajectory.integrator.potential.max_radius * self.buffer
        assert np.max(radii) < max_r, f"RadiusCheck failed! max allowed: {max_r:.2f}, max obtained; {np.max(radii):.2f}"

class TopologyCheck(Check):
    """
    Checks that the frame has the same topology as it did ``interval`` frames ago.

    Attributes:
        interval (int): interval to check at
    """
    def __init__(self, interval=100, **kwargs):
        super().__init__(interval)

    def check(self, trajectory):
        new_frame = trajectory.frames[-1]
        old_frame = trajectory.frames[-1*(self.interval+1)]
        new_mol = new_frame.molecule().assign_connectivity()
        old_mol = old_frame.molecule().assign_connectivity()
        assert cctk.topology.are_isomorphic(new_mol, old_mol), "TopologyCheck failed! different topologies found."

def build_check(settings):
    if settings["type"] == "velocity":
        return VelocityCheck(**settings)
    elif settings["type"] == "radius":
        return RadiusCheck(**settings)
    elif settings["type"] == "topology":
        return TopologyCheck(**settings)
    else:
        raise ValueError(f"unknown presto.check.Check type {settings['type']}!")
