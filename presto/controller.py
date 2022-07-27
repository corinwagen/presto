import presto, cctk, logging, time
import numpy as np
import pandas as pd
from pandas import DataFrame, Series

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

    def run(self, end_time=None, runtime=None, time_after_finished=10, forwards=True, **kwargs):
        """
        Run a given trajectory.
        The default runtime behavior is mostly good and follows ``trajectory.stop_time.``
        The arguments here are just for fine-tuning in tricky cases.

        Args:
            end_time (int): when the trajectory should be cut off.
            runtime (int): how long the trajectory should run for
            time_after_finished (int): if "termination_function" is satisfied, how much longer is needed?
            forwards (bool): run forwards or backwards in time?
        """
        traj = self.trajectory
        current_time = traj.frames[-1].time
        dt = traj.timestep

        # how many frames do we need to run?
        if end_time is None:
            if runtime is not None:
                assert isinstance(runtime, (int, float)), "runtime must be numeric"
                end_time = min(current_time + runtime, traj.stop_time)
            else:
                end_time = traj.stop_time
        else:
            assert isinstance(end_time, (int, float)), "end_time must be numeric"

        assert end_time >= current_time, f"error: end_time {end_time} must be greater than or equal to current_time {current_time}"

        if end_time == current_time:
            return

        count = 0
        finished_early = False
        if traj.forwards:
            logger.info(f"Trajectory will run {int((end_time-current_time)/traj.timestep)} frames forwards in time (current time = {current_time:.1f} fs, end time = {end_time:.1f} fs)")
        else:
            logger.info(f"Trajectory will run {int((end_time-current_time)/traj.timestep)} frames backwards in time (current time = {current_time:.1f} fs, end time = {end_time:.1f} fs)")

        additional_args = dict()
        if "dipole" in traj.properties:
            additional_args["calc_dipole"] = True

        while current_time < end_time:
            # here's where the main logic of presto happens
            current_time += dt
            current_frame = traj.frames[-1]

            bath_temperature = traj.bath_scheduler(current_time)

            new_frame = None
            try:
                start = time.time()
                energy, new_x, new_v, new_a, properties = traj.integrator.next(current_frame, forwards=forwards, time=current_time, **additional_args)
                end = time.time()
                elapsed = end - start

                # strictly speaking the energy is for this frame, but we'll give the next frame this energy too in case it's the last one (better than leaving it null).
                current_frame.energy = energy
                new_frame = presto.frame.Frame(
                    self.trajectory,
                    new_x,
                    new_v,
                    new_a,
                    bath_temperature=bath_temperature,
                    time=current_time,
                    energy=energy,
                    elapsed=elapsed,
                    scale_factor=current_frame.scale_factor,
                    **properties
                )

            except Exception as e:
                raise ValueError(f"Controller failed: {e}")

            assert new_frame.time == current_time, f"frame time {new_frame.time} does not match loop time {current_time}"
            self.trajectory.frames.append(new_frame)

            for check in self.trajectory.checks:
                if int(current_time % check.interval) == 0:
                    check.check(new_frame)

            for reporter in self.trajectory.reporters:
                if int(current_time % reporter.interval) == 0:
                    reporter.report(self.trajectory)

            # if barostat, do scaling
            if self.trajectory.target_pressure:
                current_pressure = new_frame.pressure()
                # following convention, we use the isothermal compressibility of water for our scaling. it is fine even for non-aqueous solvents.
                scale_factor = 1 - presto.constants.ISOTHERMAL_COMPRESSIBILITY_OF_WATER * dt / self.trajectory.barostat_time_constant * (self.trajectory.target_pressure - current_pressure)
                scale_factor = (scale_factor)**(1/3)

                # we then apply the scaling to the last frame
                self.trajectory.frames[-1].scale(scale_factor)

            # do we initiate early stopping?
            if not finished_early:
                if self.trajectory.termination_function(self.trajectory.frames[-1]):
                    end_time = current_time + time_after_finished
                    finished_early = True
                    logger.info(f"Trajectory finished! {time_after_finished} additional fs will be run.")

            if int(current_time/dt) % int(self.trajectory.checkpoint_interval/dt) == 0:
                self.trajectory.save()

            count += 1
            if count < 10:
                logger.info(f"Run initiated ok - frame {count:05d} completed in {new_frame.elapsed:.2f} s.")

        if current_time == self.trajectory.stop_time:
            self.trajectory.finished = True
        elif finished_early:
            self.trajectory.finished = self.trajectory.termination_function(self.trajectory.frames[-1])
        self.trajectory.save()

        logger.info(f"Trajectory done running with {self.trajectory.num_frames()} frames.")
        return
