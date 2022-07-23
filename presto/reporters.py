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
    def __init__(self, prop, interval=10):
        assert isinstance(interval, int), "interval must be integer"
        self.interval = interval

        assert prop in presto.trajectory.ALLOWED_PROPERTIES, "unknown property!"
        self.prop = prop

    def report(self, trajectory):
        reporter_filename = trajectory.checkpoint_filename.replace(".chk", f".{self.prop}")

        with open(reporter_filename, "a+") as f:
            current_dipole = trajectory.frames[-1].dipole
            if self.prop == "dipole":
                f.write(f"{current_dipole[0]}\t{current_dipole[1]}\t{current_dipole[2]}\n")
