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

    def run(self, end_time=None, runtime=None, **kwargs):
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
                ### DEBUGGING ###
                n_debug_frames = 50
                num_solvents = 12

                # recompute the positions of the bad frame
                debug_timestep = self.trajectory.timestep
                if self.trajectory.forwards == False:
                    debug_timestep = debug_timestep * -1
                debug_x = current_frame.positions + current_frame.velocities * debug_timestep + 0.5 * current_frame.accelerations * (debug_timestep ** 2)

                # select atom indices
                molecule = self.trajectory.frames[0].molecule().assign_connectivity()
                idxs = molecule.limit_solvent_shell(num_solvents=num_solvents, return_idxs=True)

                # create a movie of the last n frames
                ensemble = cctk.ConformationalEnsemble()
                for frame in self.trajectory.frames[-n_debug_frames:]:
                    ensemble.add_molecule(frame.molecule(idxs), {"bath_temperature": frame.bath_temperature, "energy": frame.energy})
                movie_filename = f"{self.trajectory.checkpoint_filename[:-4]}-debug.pdb"
                cctk.PDBFile.write_ensemble_to_trajectory(movie_filename, ensemble)

                # write out the velocities and accelerations of the last n frames
                velocities, accelerations = [], []
                for frame in self.trajectory.frames[-n_debug_frames:]:
                    v, a = frame.velocities, frame.accelerations
                    if len(velocities) == 0:
                        logger.info(f"velocities {v.shape}")
                        logger.info(f"accelerations {a.shape}")
                    velocities.append(v)
                    accelerations.append(a)
                velocities = np.array(velocities)
                accelerations = np.array(accelerations)
                molecule_filename = f"{self.trajectory.checkpoint_filename[:-4]}-debug.gjf"
                cctk.GaussianFile.write_ensemble_to_file(molecule_filename, ensemble, route_card="#")
                atomic_symbols = molecule.get_atomic_symbols()
                n_frames = len(velocities)
                n_atoms = len(atomic_symbols)
                velocities = velocities.reshape(n_frames,n_atoms*3)
                velocities_filename = f"{self.trajectory.checkpoint_filename[:-4]}-debug_velocities.csv"
                np.savetxt(velocities_filename, velocities, delimiter=",")
                accelerations_filename = f"{self.trajectory.checkpoint_filename[:-4]}-debug_accelerations.csv"
                accelerations = velocities.reshape(n_frames,n_atoms*3)
                np.savetxt(accelerations_filename, accelerations, delimiter=",")


                #velocity_names = [ f"v_{atomic_symbols[i]}{i+1}" for i in range(1,len(atomic_symbols)+1) ]
                #velocities_df = DataFrame(velocities, columns=velocity_names)
                #velocities_df.to_csv(velocities_filename)
                #acceleration_names = [ f"a_{atomic_symbols[i]}{i+1}" for i in range(1,len(atomic_symbols)+1) ]
                #accelerations_df = DataFrame(accelerations, columns=acceleration_names)
                #accelerations_df.to_csv(accelerations_filename)

                # send an error message
                logger.info(f"Error at time {current_time} - run terminated and debugging files written")
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

            if int(current_time/dt) % int(self.trajectory.checkpoint_interval/dt) == 0:
                self.trajectory.save()

            count += 1
            if count < 100:
                logger.info(f"Run initiated ok - frame {count:05d} completed in {new_frame.elapsed:.2f} s.")

        if current_time == self.trajectory.stop_time:
            self.trajectory.finished = True
        elif finished_early:
            self.trajectory.finished = self.trajectory.termination_function(self.trajectory.frames[-1])
#            self.trajectory.finished = True # somehow that previous line was not working
        self.trajectory.save()

        logger.info(f"Trajectory done running with {self.trajectory.num_frames()} frames.")
        return
