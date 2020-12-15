import presto, logging
import numpy as np

logger = logging.getLogger(__name__)

class Reporter():
    """
    Class for recurring report action.
    """
    def __init__(self, interval=10):
        assert isinstance(interval, (int, float)), "interval must be numeric"
        self.interval = interval

    def write(self, trajectory):
        """
        Writes report (usually to external file.)

        Args:
            frame (presto.frame.Frame): frame to check

        Returns:
            nothing
        """
        pass

class TimingReporter(Reporter):
    def report(self, trajectory):
        times = [f.elapsed for f in trajectory.frames[-self.interval:]]
        print("AVERAGE TIME PER FRAME:")
        print(np.average(times))
