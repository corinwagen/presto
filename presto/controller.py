import presto, logger
import numpy as np

logger = logging.getLogger(__name__)

class Controller():
    def __init__(self, trajectory):
        assert isinstance(self.calculator, presto.calculators.Calculator)
        self.calculator = trajectory.calculator

        assert isinstance(self.integrator, presto.integrators.Integrator)
        self.integrator = trajectory.integrator

        assert all([isinstance(c, presto.checks.Check) for c in trajectory.checks])
        self.checks = trajectory.checks

        assert all([isinstance(r, presto.reporters.Reporter) for r in trajectory.reporters])
        self.reporters = trajectory.reporters
