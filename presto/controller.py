import presto, logging, time
import numpy as np

logger = logging.getLogger(__name__)

class Controller():
    """
    Controls actual running of frames. Dispatches to other objects.
    """
    def __init__(self, trajectory):
        assert isinstance(trajectory.calculator, presto.calculators.Calculator)
        assert isinstance(trajectory.integrator, presto.integrators.Integrator)
        assert all([isinstance(c, presto.checks.Check) for c in trajectory.checks])
        assert all([isinstance(r, presto.reporters.Reporter) for r in trajectory.reporters])

        self.trajectory = trajectory

    def run(self, checkpoint_interval=25, end_time=None, runtime=None, **kwargs):
        current_time = self.trajectory.frames[-1].time
        dt = self.trajectory.timestep
        interval = self.trajectory.save_interval

        if end_time is None:
            if runtime is not None:
                assert isinstance(runtime, (int, float)), "runtime must be numeric"
                end_time = min(current_time + runtime, self.trajectory.stop_time)
            else:
                end_time = self.trajectory.stop_time
        else:
            assert isinstance(end_time, (int, float)), "end_time must be numeric"

        assert end_time >= current_time, f"error: end_time {end_time} must be greater than or equal to current_time {current_time}"

        if end_time == current_time:
            return

        count = 0
        finished_early = False
        logger.info(f"Trajectory will run {int((end_time-current_time)/self.trajectory.timestep)} frames (current time = {current_time:.1f} fs, end time = {end_time:.1f} fs)") 
        while current_time < end_time:
            current_time += dt
            current_frame = self.trajectory.frames[-1]

            bath_temperature = current_frame.bath_temperature
            if isinstance(self.trajectory, presto.trajectory.EquilibrationTrajectory):
                bath_temperature = self.trajectory.bath_scheduler(current_time)

            new_frame = None
            try:
                new_frame = current_frame.next(forwards=self.trajectory.forwards, temp=bath_temperature)
            except Exception as e:
                logger.info(f"Error at time {current_time} - terminating run")
                raise ValueError(f"Controller failed: {e}")
            assert new_frame.time == current_time, f"frame time {new_frame.time} does not match loop time {current_time}"
            self.trajectory.frames.append(new_frame)

            for check in self.trajectory.checks:
                if int(current_time % check.interval) == 0:
                    check.check_frame(new_frame)

            for reporter in self.trajectory.reporters:
                if int(current_time % reporter.interval) == 0:
                    reporter.report(self.trajectory)

            # do we initiate early stopping?
            if not finished_early:
                if isinstance(self.trajectory, presto.trajectory.ReactionTrajectory):
                    if self.trajectory.termination_function(self.trajectory.frames[-1]):
                        end_time = current_time + self.trajectory.time_after_finished
                        finished_early = True
                        logger.info(f"Reaction trajectory finished! {self.trajectory.time_after_finished} additional fs will be run.")

            if int(current_time/dt) % int(checkpoint_interval/dt) == 0:
                self.trajectory.save()

            count += 1
            if count < 10:
                logger.info(f"Run initiated ok - frame {count:05d} completed in {new_frame.elapsed:.2f} s.")

        self.trajectory.save()
        if current_time == self.trajectory.stop_time:
            self.trajectory.finished = True
        elif finished_early:
#            self.trajectory.finished = self.trajectory.termination_function(self.trajectory.frames[-1])
            self.trajectory.finished = True # somehow that previous line was not working

        logger.info(f"Trajectory done running with {self.trajectory.num_frames()} frames.")
        return
