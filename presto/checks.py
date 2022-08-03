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

    def check(self, frame):
        """
        Checks a trajectory. Will raise an exception if anything is wrong.

        Args:
            frame (presto.frame.Frame): frame to check

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

    def check(self, frame):
        assert np.max(frame.velocities) < self.max_velocity, f"VelocityCheck failed! max allowed: {self.max_velocity:.2f}, max obtained; {np.max(frame.velocities):.2f}"

class RadiusCheck(Check):
    """
    Checks that particles do not go past a set radius. By default, there is a 10% buffer past the applied potential.

    Attributes:
        interval (int): interval to check at
        buffer (float): multiplied by ``potential.max_radius`` to give max allowable radius
    """
    def __init__(self, radius=None, interval=20, **kwargs):
        assert isinstance(interval, int), "interval must be integer"
        self.interval = interval

        assert isinstance(radius, (int, float)), "radius must be numeric"
        self.radius = radius

    def check(self, frame):
        positions = frame.positions.view(np.ndarray)
        radii = np.linalg.norm(frame.positions, axis=1)
        assert np.max(radii) < self.radius, f"RadiusCheck failed! max allowed: {self.radius:.2f}, max obtained; {np.max(radii):.2f}"

class TopologyCheck(Check):
    """
    Checks that the frame has the same topology as it did in the oldest frame saved (``interval`` frames ago).

    Attributes:
        interval (int): interval to check at
    """
    def __init__(self, interval=100, **kwargs):
        super().__init__(interval)
        self.initial_mol = None

    def check(self, frame):
        current_mol = frame.molecule().assign_connectivity()

        if self.initial_mol is None:
            initial_frame = frame.trajectory.frames[0]
            self.initial_mol = initial_frame.molecule().assign_connectivity()

        assert cctk.topology.are_isomorphic(current_mol, self.initial_mol), "TopologyCheck failed! different topologies found."

def build_checks(settings):
    checks = list()

    for row in list(settings.values()):
        if row["type"] == "velocity":
            checks.append(VelocityCheck(**row))
        elif row["type"] == "radius":
            checks.append(RadiusCheck(**row))
        elif row["type"] == "topology":
            checks.append(TopologyCheck(**row))
        else:
            raise ValueError(f"unknown presto.check.Check type {row['type']}!")

    return checks
