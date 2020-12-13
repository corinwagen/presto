import presto, logger
import numpy as np

logger = logging.getLogger(__name__)

class Reporter():
    """
    Class for recurring report action.
    """
    def __init__(self, interval=10):
        assert isinstance(interval, (int, float)), "interval must be numeric"
        self.interval = interval

    def write(self, frame):
        """
        Writes report (usually to external file.)

        Args:
            frame (presto.frame.Frame): frame to check

        Returns:
            nothing
        """
        pass

