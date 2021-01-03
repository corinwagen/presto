import presto, logging
import numpy as np

logger = logging.getLogger(__name__)

class Reporter():
    """
    Class for recurring report action.
    """
    def __init__(self, interval=10):
        assert isinstance(interval, int), "interval must be integer"
        self.interval = interval

    def report(self, trajectory):
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

class PropertyReporter(Reporter):
    def __init__(self, interval=10, properties=list()):
        assert isinstance(interval, int), "interval must be integer"
        self.interval = interval

    def report(self, trajectory):
        pass
