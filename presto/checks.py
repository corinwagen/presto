import presto, logging
import numpy as np

logger = logging.getLogger(__name__)

class Check():
    """
    Class for recurring trajectory check.
    """
    def __init__(self, interval=20):
        assert isinstance(interval, (int, float)), "interval must be numeric"
        self.interval = interval

    def check_frame(self, frame):
        """
        Checks a frame. Will raise an exception if anything is wrong.

        Args:
            frame (presto.frame.Frame): frame to check

        Returns:
            nothing
        """
        pass

class VelocityCheck(Check):
    def check_frame(self, frame):
        pass

class RadiusCheck(Check):
    def check_frame(self, frame):
        positions = frame.positions.view(np.ndarray)
        radii = ...
#        assert np.max(radii) < frame.trajectory.potential

class TopologyCheck(Check):
    def __init__(self, interval=100):
        super().__init__(self, interval)
