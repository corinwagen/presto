import presto, logger
import numpy as np

logger = logging.getLogger(__name__)

class Controller():
    def __init__(self, trajectory):
        assert isinstance(trajectory.calculator, presto.calculators.Calculator)
        assert isinstance(trajectory.integrator, presto.integrators.Integrator)
        assert all([isinstance(c, presto.checks.Check) for c in trajectory.checks])
        assert all([isinstance(r, presto.reporters.Reporter) for r in trajectory.reporters])

        self.trajectory = trajectory
