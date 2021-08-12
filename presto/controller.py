import presto, cctk, logging, time
import numpy as np
import pandas as pd
from pandas import DataFrame, Series
import sys, traceback

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

    # max_attempts: how many times to try rewinding if a frame doesn't work
    # backwards_stride: how many frames to go backwards by every rewind attempt
    def run(self, end_time=None, runtime=None, max_attempts=10, backwards_stride=2, **kwargs):
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
        if self.trajectory.forwards:
            logger.info(f"Trajectory will run {int((end_time-current_time)/self.trajectory.timestep)} frames forwards in time (current time = {current_time:.1f} fs, end time = {end_time:.1f} fs)")
        else:
            logger.info(f"Trajectory will run {int((end_time-current_time)/self.trajectory.timestep)} frames backwards in time (current time = {current_time:.1f} fs, end time = {end_time:.1f} fs)")

        attempt = 0
        bad_time = None
        while current_time < end_time:
            current_time += dt
            #logger.info(f"current time is {current_time} fs")
            current_frame = self.trajectory.frames[-1]
            #logger.info(f"current_frame has a time of {current_frame.time}")

            bath_temperature = current_frame.bath_temperature
            if isinstance(self.trajectory, presto.trajectory.EquilibrationTrajectory):
                bath_temperature = self.trajectory.bath_scheduler(current_time)

            new_frame = None
            try:
                new_frame = current_frame.next(forwards=self.trajectory.forwards, temp=bath_temperature)
                if bad_time is not None and new_frame.time >= bad_time:
                    logger.info(f"*** overcame the previous problem on attempt {attempt} ***")
                    attempt = 0
                    bad_time = None
            except Exception as e:
                traceback.print_exception(*sys.exc_info())
                logger.info(f"exception: {e}")
                if attempt < max_attempts:
                    attempt += 1
                    bad_time = current_time

                    # try to rewind
                    logger.info(f"rewinding: current time is {current_time}")
                    trajectory_length = len(self.trajectory.frames)
                    logger.info(f"there are currently {trajectory_length} frames")
                    new_frame_index = trajectory_length - backwards_stride*attempt
                    logger.info(f"trying to set frame index to {new_frame_index}")
                    if new_frame_index < 0:
                        # if we have very few frames, go to a backwards_stride of 1
                        new_frame_index = trajectory_length - 1*attempt
                        logger.info(f"that's no good, setting frame index to {new_frame_index}")
                    if new_frame_index < 0:
                        logger.info("can't find a reasonable frame index to rewind to")
                        raise ValueError("tried to rewind, but there aren't enough frames to go backwards by")

                    # snip off some frames and try again
                    n_removed_frames = trajectory_length - new_frame_index
                    logger.info(f"we are removing {n_removed_frames} frames")
                    current_time -= dt * (trajectory_length - new_frame_index + 1)
                    logger.info(f"new current_time is {current_time} fs")
                    self.trajectory.frames = self.trajectory.frames[:new_frame_index]
                    logger.info(f"we now have {len(self.trajectory.frames)} frames")
                    logger.info(f"last existing frame has a time of {self.trajectory.frames[-1].time}")
                    logger.info(f"Encountered a problem, so rewound the trajectory by {n_removed_frames} frames (current time is now {current_time:.1f} fs).")
                    logger.info(f"That was attempt {attempt}")
                    continue
                else:
                    raise ValueError(f"max retry attempts exceeded and controller failed: {e}")

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

            if int(current_time/dt) % int(self.trajectory.checkpoint_interval/dt) == 0:
                self.trajectory.save()

            count += 1
            if count < 100:
                logger.info(f"Run initiated ok - frame for {new_frame.time} fs completed in {new_frame.elapsed:.2f} s.")

        if current_time == self.trajectory.stop_time:
            self.trajectory.finished = True
        elif finished_early:
            self.trajectory.finished = self.trajectory.termination_function(self.trajectory.frames[-1])
#            self.trajectory.finished = True # somehow that previous line was not working
        self.trajectory.save()

        logger.info(f"Trajectory done running with {self.trajectory.num_frames()} frames.")
        return
