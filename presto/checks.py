import presto, logger
import numpy as np

logger = logging.getLogger(__name__)

class Check():
    """
    Class for recurring trajectory check.
    """
    def __init__(self, interval=10):
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
