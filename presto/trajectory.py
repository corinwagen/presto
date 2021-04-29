import numpy as np
import math, copy, cctk, os, re, logging, time
import fasteners

import h5py
import presto

logger = logging.getLogger(__name__)

class Trajectory():
    """

    Attributes:
        timestep (float): in fs
        frames (list of presto.Frame):
        stop_time (float): how long to run for

        high_atoms (np.ndarray): to calculate at high level of theory, list of 1-indexed atom numbers
        active_atoms (np.ndarray): non-frozen atoms, list of 1-indexed atom numbers

        atomic_numbers (cctk.OneIndexedArray): list of atomic numbers
        masses (cctk.OneIndexedArray): list of masses

        calculator (presto.calculators.Calculator):
        integrator (presto.integrators.Integrator):
        reporters (list of presto.reporters.Reporter):
        checks (list of presto.checks.Check):

        finished (bool):
        forwards (bool):

        checkpoint_filename (str):
        lock (fasteners.InterProcessLock): lock object
        save_interval (int): how many frames to save
    """

    def __init__(
        self,
        calculator=None,
        integrator=None,
        reporters=list(),
        checks=list(),
        timestep=None,
        atomic_numbers=None,
        high_atoms=None,
        forwards=True,
        checkpoint_filename=None,
        stop_time=None,
        save_interval=1,
        **kwargs
    ):

        # do this first!
        if timestep is not None:
            assert timestep > 0, "can't have timestep ≤ 0!"
            self.timestep = float(timestep)

        if checkpoint_filename is not None:
            assert isinstance(checkpoint_filename, str), "need string for file"
        self.checkpoint_filename = checkpoint_filename

        self.lock = None
        self.initialize_lock()
        self.frames = list()

        if self.has_checkpoint():
            if "load_frames" in kwargs:
                self.load_from_checkpoint(kwargs["load_frames"])
            else:
                self.load_from_checkpoint(slice(-1,None,None))

        if calculator is not None:
            assert isinstance(calculator, presto.calculators.Calculator), "need a valid calculator!"
        self.calculator = calculator

        if integrator is not None:
            assert isinstance(integrator, presto.integrators.Integrator), "need a valid integrator!"
        self.integrator = integrator

        assert all([isinstance(c, presto.checks.Check) for c in checks])
        self.checks = checks

        assert all([isinstance(r, presto.reporters.Reporter) for r in reporters])
        self.reporters = reporters

        if atomic_numbers is not None:
            assert isinstance(atomic_numbers, cctk.OneIndexedArray), "atomic numbers must be cctk 1-indexed array!"
            self.atomic_numbers = atomic_numbers
        elif not hasattr(self, "atomic_numbers"):
            raise ValueError("no atomic numbers specified")

        if not hasattr(self, "finished"):
            self.finished = False

        if high_atoms is not None:
            assert isinstance(high_atoms, np.ndarray), "high_atoms must be np.ndarray!"
            self.high_atoms = high_atoms
        else:
            self.high_atoms = None

        active_atoms = None
        if "active_atoms" in kwargs:
            active_atoms = kwargs["active_atoms"]
            assert isinstance(active_atoms, np.ndarray), "active_atoms must be np.ndarray!"
            self.active_atoms = active_atoms
        elif "inactive_atoms" in kwargs:
            self.set_inactive_atoms(kwargs["inactive_atoms"])
        else:
            # assume all atoms are active
            self.set_inactive_atoms(np.ndarray([]))

        if not hasattr(self, "masses"):
            self.masses = cctk.OneIndexedArray([float(cctk.helper_functions.draw_isotopologue(z)) for z in atomic_numbers])

        if not hasattr(self, "frames"):
            self.frames = []

        if forwards is not None:
            assert isinstance(forwards, bool), "forwards must be bool"
            self.forwards = forwards
        elif not hasattr(self, "forwards"):
            self.forwards = True

        if not hasattr(self, "stop_time"):
            assert (isinstance(stop_time, float)) or (isinstance(stop_time, int)), "stop_time needs to be numeric!"
            assert stop_time > 0, "stop_time needs to be positive!"
            self.stop_time = stop_time

        assert isinstance(save_interval, int), "save_interval needs to be positive"
        assert save_interval > 0, "save_interval needs to be positive"
        self.save_interval = save_interval

    def __str__(self):
        return f"Trajectory({len(self.frames)} frames)"

    def __repr__(self):
        return f"Trajectory({len(self.frames)} frames)"

    def set_inactive_atoms(self, inactive_atoms):
        """
        Since sometimes it's easier to specify the inactive atoms than the inactive atoms, this method updates ``self.active_atoms`` with the complement of ``inactive_atoms``.
        """
        assert isinstance(inactive_atoms, (list, np.ndarray)), "Need list of atoms!"
        active_atoms = list(range(1, len(self.atomic_numbers)+1))
        if len(inactive_atoms):
            for atom in inactive_atoms:
                active_atoms.remove(atom)
        active_atoms = np.array(active_atoms)
        self.active_atoms = active_atoms

    def run(self, checkpoint_interval=10, keep_all=False, time=None, **kwargs):
        """
        Run the trajectory.

        Args:
            checkpoint_interval (int): interval at which to save (in frames, not fs)
            keep_all (bool): whether or not to keep all frames in memory
            time (float): total time to run for -- default is None, implying trajectory should be run until finished
        """
        if self.checkpoint_filename is None:
            if "checkpoint_filename" in kwargs:
                self.checkpoint_filename = kwargs["checkpoint_filename"]
            else:
                raise ValueError("no checkpoint filename given!")

        self.load_from_checkpoint(slice(-1, None, None))
        assert len(self.frames) == 1, "Wrong number of frames - do you need to call trajectory.initialize()?"

        if self.finished:
            logger.info("Trajectory already finished!")
        else:
            # initialize runtime controller
            controller = presto.controller.Controller(self, **kwargs)
            try:
                controller.run(checkpoint_interval=checkpoint_interval, runtime=time)
            except Exception as e:
                raise ValueError(f"Trajectory run terminated prematurely due to error: {e}")

        if keep_all:
            self.load_from_checkpoint()
            assert self.frames[0].time == 0, "missing first frame despite keep_all being True!"

        return self

    def initialize(self):
        """
        Adds first frame with randomly-initialized velocities. Should call ``self.save()``.
        """
        pass

    def has_checkpoint(self):
        if self.checkpoint_filename is None:
            return False
        if os.path.exists(self.checkpoint_filename):
            return True
        else:
            return False

    def load_from_checkpoint(self, frames=slice(None)):
        """
        Loads frames from ``self.checkpoint_filename``.

        Args:
            frames (Slice object): if not all frames are desired, a Slice object can be passed

        Returns:
            nothing
        """
        if not self.has_checkpoint():
            return # nothing to load!

        self.initialize_lock()
        self.lock.acquire()

        with h5py.File(self.checkpoint_filename, "r") as h5:
            atomic_numbers = h5.attrs["atomic_numbers"]
            self.atomic_numbers = cctk.OneIndexedArray(atomic_numbers)

            masses = h5.attrs["masses"]
            self.masses = cctk.OneIndexedArray(masses)

            self.finished = h5.attrs['finished']
            self.forwards = h5.attrs['forwards']

            self.frames = []
            if len(h5.get("all_energies")):
                all_energies = h5.get("all_energies")[frames]
                all_positions = h5.get("all_positions")[frames]
                all_velocities= h5.get("all_velocities")[frames]
                all_accels = h5.get("all_accelerations")[frames]
                temperatures = h5.get("bath_temperatures")[frames]

                # v0.2.2 - provisionally removing this
#                all_times = None
#                try:
                all_times = h5.get("all_times")[frames]
#                except Exception as e:
#                    all_times = np.arange(0, self.timestep*len(all_energies)*self.save_interval, self.timestep*self.save_interval)
#                    # this was added recently, so may be some backwards compatibility issues.
#                    pass

                if isinstance(all_energies, np.ndarray):
                    assert len(all_positions) == len(all_energies)
                    assert len(all_velocities) == len(all_energies)
                    assert len(all_accels) == len(all_energies)
                    assert len(all_times) == len(all_energies)

                for i, t in enumerate(all_times):
                    self.frames.append(presto.frame.Frame(
                        self,
                        all_positions[i].view(cctk.OneIndexedArray),
                        all_velocities[i].view(cctk.OneIndexedArray),
                        all_accels[i].view(cctk.OneIndexedArray),
                        energy=all_energies[i],
                        bath_temperature=temperatures[i],
                        time=all_times[i],
                    ))

        logger.info(f"Loaded trajectory from checkpoint file {self.checkpoint_filename} -- {len(self.frames)} frames read.")

        self.lock.release()
        return

    def num_frames(self):
        if self.has_checkpoint():
            num = 0
            with h5py.File(self.checkpoint_filename, "r") as h5:
                num = len(h5.get("all_energies"))
            return num
        else:
            return len(self.frames)

    def save(self, keep_all=False):
        if self.checkpoint_filename is None:
            raise ValueError("can't save without checkpoint filename")
        self.initialize_lock()
        self.lock.acquire()

        last_run_time = self.frames[-1].time
        if self.has_checkpoint():
            with h5py.File(self.checkpoint_filename, "r+") as h5:
                n_atoms = len(self.atomic_numbers)
                h5.attrs['finished'] = self.finished

                all_energies = h5.get("all_energies")
                old_n_frames = len(all_energies)
                # v0.2.2 - provisionally removing this
#                if "all_times" not in h5:
#                    # time is a new column, so old checkpoints may not have it.
#                    old_times = np.arange(0, self.timestep, self.timestep*old_n_frames)
#                    h5.create_dataset("all_times", data=old_times, maxshape=(None,), compression="gzip", compression_opts=9)

                all_times = h5.get("all_times")
                last_saved_time = all_times[-1]
                new_n_frames = int((last_run_time - last_saved_time) / (self.timestep*self.save_interval))
                now_n_frames = new_n_frames + old_n_frames

                if new_n_frames == 0:
                    self.lock.release()
                    return
                assert new_n_frames > 0, f"we can't write negative frames ({old_n_frames} previously in {self.checkpoint_filename}, but now only {now_n_frames})"

                frames_to_add = list()
                # there is probably a more elegant way to handle this, but this seems robust at least
                for frame in self.frames[-(new_n_frames*self.save_interval)-1:]:
                    if frame.time <= last_saved_time:
                        continue
                    if frame.time % (self.timestep * self.save_interval) == 0:
                        frames_to_add.append(frame)
                assert new_n_frames == len(frames_to_add), "pernicious math error in frame numbers!"

                new_times = np.asarray([frame.time for frame in frames_to_add])
                all_times.resize((now_n_frames,))
                all_times[-new_n_frames:] = new_times

                all_energies = h5.get("all_energies")
                new_energies = np.asarray([frame.energy for frame in frames_to_add])
                all_energies.resize((now_n_frames,))
                all_energies[-new_n_frames:] = new_energies

                new_positions = np.stack([frame.positions for frame in frames_to_add])
                all_positions = h5.get("all_positions")
                all_positions.resize((now_n_frames,n_atoms,3))
                all_positions[-new_n_frames:] = new_positions

                new_velocities= np.stack([frame.velocities for frame in frames_to_add])
                all_velocities = h5.get("all_velocities")
                all_velocities.resize((now_n_frames,n_atoms,3))
                all_velocities[-new_n_frames:] = new_velocities

                new_accels = np.stack([frame.accelerations for frame in frames_to_add])
                all_accels = h5.get("all_accelerations")
                all_accels.resize((now_n_frames,n_atoms,3))
                all_accels[-new_n_frames:] = new_accels

                new_temps = np.stack([frame.bath_temperature for frame in frames_to_add])
                all_temps = h5.get("bath_temperatures")
                all_temps.resize((now_n_frames,))
                all_temps[-new_n_frames:] = new_temps

            logger.info(f"Saving to existing checkpoint file {self.checkpoint_filename} ({new_n_frames} frames added; {last_run_time:.1f}/{self.stop_time:.1f} fs run in total)")
        else:
            with h5py.File(self.checkpoint_filename, "w") as h5:
                h5.attrs['atomic_numbers'] = self.atomic_numbers.view(np.ndarray)
                h5.attrs['masses'] = self.masses.view(np.ndarray)
                h5.attrs['finished'] = self.finished
                h5.attrs['forwards'] = self.forwards

                n_atoms = len(self.atomic_numbers)

                frames_to_add = list()
                for frame in self.frames:
                    if frame.time % (self.timestep * self.save_interval) == 0:
                        frames_to_add.append(frame)

                energies = np.asarray([frame.energy for frame in frames_to_add])
                h5.create_dataset("all_energies", data=energies, maxshape=(None,), compression="gzip", compression_opts=9)

                times = np.asarray([frame.time for frame in frames_to_add])
                h5.create_dataset("all_times", data=times, maxshape=(None,), compression="gzip", compression_opts=9)

                all_positions = np.stack([frame.positions for frame in frames_to_add])
                h5.create_dataset("all_positions", data=all_positions, maxshape=(None,n_atoms,3), compression="gzip", compression_opts=9)

                all_velocities = np.stack([frame.velocities for frame in frames_to_add])
                h5.create_dataset("all_velocities", data=all_velocities, maxshape=(None,n_atoms,3), compression="gzip", compression_opts=9)

                all_accels= np.stack([frame.accelerations for frame in frames_to_add])
                h5.create_dataset("all_accelerations", data=all_accels, maxshape=(None,n_atoms,3), compression="gzip", compression_opts=9)

                temps = np.asarray([frame.bath_temperature for frame in frames_to_add])
                h5.create_dataset("bath_temperatures", data=temps, maxshape=(None,), compression="gzip", compression_opts=9)

        logger.info(f"Saving to new checkpoint file {self.checkpoint_filename} ({len(frames_to_add)} frames added; {last_run_time:.1f}/{self.stop_time:.1f} fs run in total)")
        self.lock.release()

        # lower memory usage
        if keep_all:
            pass
        else:
            self.frames = [self.frames[-1]]

    def write_movie(self, filename, solvents="all", idxs=None):
        """
        Write a movie to a trajectory file. Detects trajectory type automatically from file extension.

        Supported file formats: ``.pdb``, ``.mol2``, ``.xyz``/``.molden``

        Args:
            filename (str): path where movie will be written
            solvents (int): number of solvent molecules to include (closest included first). can also be ``none`` or ``all``.
            idxs (list of int): indices of atoms to include. will override ``solvents`` if present.
        """

        # what do we make a movie of?
        if idxs is not None:
            assert isinstance(idxs, list), "idxs must be list of indices or ``None``!"
        else:
            if isinstance(solvents, str):
                if solvents == "high":
                    idxs = self.high_atoms
                elif solvents == "all":
                    idxs = None
                else:
                    raise ValueError(f"unknown solvents keyword {solvents} -- must be 'high' or 'all'")
            elif isinstance(solvents, int):
                molecule = self.frames[0].molecule().assign_connectivity()
                idxs = molecule.limit_solvent_shell(num_solvents=solvents, return_idxs=True)
            else:
                raise ValueError("``solvents`` must be int, 'high', or 'all'!")

        ensemble = self.as_ensemble(idxs)
        logger.info("Writing trajectory to {filename}")
        if re.search("pdb$", filename):
            cctk.PDBFile.write_ensemble_to_trajectory(filename, ensemble)
        elif re.search("mol2$", filename):
            #### connectivity matters
            ensemble.assign_connectivity()
            cctk.MOL2File.write_ensemble_to_file(filename, ensemble)
        elif re.search("molden$", filename) or re.search("xyz$", filename):
            cctk.XYZFile.write_ensemble_to_file(filename, ensemble)
        else:
            raise ValueError(f"error writing {filename}: this filetype isn't currently supported!")

    def as_ensemble(self, idxs=None):
        ensemble = cctk.ConformationalEnsemble()
        for frame in self.frames[:-1]:
            ensemble.add_molecule(frame.molecule(idxs), {"bath_temperature": frame.bath_temperature, "energy": frame.energy})
        return ensemble

    @classmethod
    def new_from_checkpoint(cls, checkpoint, frame):
        """
        Creates new trajectory from the given checkpoint file.

        Args:
            checkpoint (str): path to checkpoint file
            frame (int): the index of the desired frame

        Returns:
            new ``Trajectory`` object
        """
        assert isinstance(frame, int), "need an integer frame number"

        new_traj = cls(checkpoint_filename=checkpoint)
        new_traj.load_from_checkpoint(idxs=frame)

        assert len(new_traj.frames) == 1, "got too many frames!"
        return new_traj

    def initialize_lock(self):
        """
        Create hidden lockfile to accompany ``.chk`` file.
        """
        if self.checkpoint_filename is None:
            return

        if self.lock is None:
            lockfile = None
            if "/" in self.checkpoint_filename:
                lockfile = f"{self.checkpoint_filename}.lock"[::-1].replace("/", "./", 1)[::-1]
            else:
                lockfile = f".{self.checkpoint_filename}.lock"
            self.lock = fasteners.InterProcessLock(lockfile)

    def last_time_run(self):
        """ Get last finished time """
        return self.frames[-1].time

class ReactionTrajectory(Trajectory):
    """
    Attributes:
        termination_function (function): detects if first or last Frame has reached product/SM or should otherwise be halted.
            takes ``Frame`` argument as option and returns ``True``/``False``.
            optionally, can return 1 for forward and 2 for reverse (to differentiate recrossing from productive).
        time_after_finished (float/int): how long (in fs) to continue propagation after termination conditions reached
    """

    @classmethod
    def new_from_checkpoint(self):
        pass

    def __init__(self, termination_function=None, time_after_finished=100, **kwargs):
        super().__init__(**kwargs)

        assert isinstance(time_after_finished, (int, float)), "time_after_finished must be numeric"
        self.time_after_finished = time_after_finished
        self.elapsed_since_finished = 0

        assert hasattr(termination_function, "__call__"), "termination_function must be a function!"
        self.termination_function = termination_function

    def __str__(self):
        return f"ReactionTrajectory({len(self.frames)} frames)"

    def __repr__(self):
        return f"ReactionTrajectory({len(self.frames)} frames)"

    def initialize(self, frame=None, positions=None, velocities=None, accelerations=None, bath_temp=None, new_velocities=None, **kwargs):
        """
        Generates initial frame object for reaction trajectory. Initializes any non-zero velocities.
        Velocities are taken from the Maxwell–Boltzmann distribution for the given temperature.

        Can pass either a frame object, or the relevant attributes (frame gets precedence).

        Args:
            frame (presto.frame.Frame): equilibrated frame
            new_velocities (cctk.OneIndexedArray): array of velocities to add to equilibrated frame (for previously-frozen atoms)
            velocities, accelerations, positions (cctk.OneIndexedArray): values from frame (instead of frame object)
            bath_temperature (float):

        Returns:
            frame
        """
        logger.info("Initializing new reaction trajectory...")
        if self.has_checkpoint():
            self.load_from_checkpoint(slice(-1,None,None))
            return

        if frame is not None:
            assert isinstance(frame, presto.frame.Frame), "need a valid frame"

            positions = frame.positions
            velocities = frame.velocities
            accelerations = frame.accelerations
            bath_temp = frame.bath_temperature

        else:
            assert positions is not None, "no Frame supplied, need positions"
            assert velocities is not None, "no Frame supplied, need velocities"
            assert accelerations is not None, "no Frame supplied, need accelerations"
            assert bath_temp is not None, "no Frame supplied, need bath temperature"

            assert isinstance(positions, cctk.OneIndexedArray)
            assert isinstance(velocities, cctk.OneIndexedArray)
            assert isinstance(accelerations, cctk.OneIndexedArray)
            assert isinstance(bath_temp, (float, int, np.integer))

        new_frame = presto.frame.Frame(self, positions, velocities, accelerations, bath_temperature=bath_temp, time=0.0)

        if new_velocities is None:
            random_gaussian = np.random.normal(size=positions.shape).view(cctk.OneIndexedArray)
            random_gaussian[new_frame.active_mask()] = 0
            new_velocities = random_gaussian * np.sqrt(bath_temp * presto.constants.BOLTZMANN_CONSTANT / self.masses.reshape(-1,1))

        new_frame.velocities += new_velocities.view(cctk.OneIndexedArray)

        self.frames = [new_frame]
        self.save()

class EquilibrationTrajectory(Trajectory):
    """
    Attributes:
        bath_scheduler (function): takes current time and returns target temperature
            alternatively, pass a number if you want a constant-temperature bath
    """

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        bath_scheduler = kwargs.get("bath_scheduler")

        if hasattr(bath_scheduler, "__call__"):
            self.bath_scheduler = bath_scheduler
        elif isinstance(bath_scheduler, (int, float)):
            def sched(time):
                return bath_scheduler

            self.bath_scheduler = sched
        else:
            raise ValueError(f"unknown type {type(bath_scheduler)} for bath_scheduler - want either a function or a number!")

    def __str__(self):
        return f"EquilibrationTrajectory({len(self.frames)} frames)"

    def __repr__(self):
        return f"EquilibrationTrajectory({len(self.frames)} frames)"

    def initialize(self, positions, velocities=None, accelerations=None, **kwargs):
        """
        Generates initial frame object for initialization trajectory.
        Velocities are taken from the Maxwell–Boltzmann distribution for the given temperature.

        Args:
            positions (cctk.OneIndexedArray): starting positions
            velocities (cctk.OneIndexedArray): starting velocities, optional.
            accelerations (cctk.OneIndexedArray): starting accelerations, optional.

        Returns:
            frame
        """
        logger.info("Initializing new equilibration trajectory...")
        if self.has_checkpoint():
            self.load_from_checkpoint(slice(-1,None,None))
            assert len(self.frames) == 1, "didn't load frames properly!"
            return

        assert isinstance(positions, cctk.OneIndexedArray), "positions must be a one-indexed array!"

        # determine active atoms
        inactive_mask = np.ones(shape=len(positions)).view(cctk.OneIndexedArray)
        inactive_mask[self.active_atoms] = 0
        inactive_mask = inactive_mask.astype(bool)

        if velocities is None:
            # add random velocity to everything
            sigma = np.sqrt(self.bath_scheduler(0) * presto.constants.BOLTZMANN_CONSTANT / self.masses.reshape(-1,1))
            velocities = np.random.normal(scale=sigma, size=positions.shape).view(cctk.OneIndexedArray)
            velocities[inactive_mask] = 0

            # subtract out center-of-mass translational motion
            com_translation = np.sum(self.masses.reshape(-1,1) * velocities, axis=0)
            correction_tran = np.tile(com_translation / np.sum(self.masses[self.active_atoms]), (len(velocities),1))
            correction_tran[inactive_mask] = 0
            velocities = velocities - correction_tran
            com_translation = np.sum(self.masses.reshape(-1,1) * velocities, axis=0)
            assert np.linalg.norm(np.sum(self.masses.reshape(-1,1) * velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

            velocities = velocities.view(cctk.OneIndexedArray)
        else:
            assert isinstance(velocities, cctk.OneIndexedArray)
            velocities[inactive_mask] = 0

        if accelerations is None:
            accelerations = np.zeros_like(positions).view(cctk.OneIndexedArray)
        else:
            assert isinstance(accelerations, cctk.OneIndexedArray)
            accelerations[inactive_mask] = 0

        self.frames = [presto.frame.Frame(self, positions, velocities, accelerations, bath_temperature=self.bath_scheduler(0), time=0.0)]
        self.save()

def join(traj1, traj2):
    """
    Join two reaction trajectories together -- one forward and one reverse!
    Returns a single reaction trajectory.

    Args:
        traj1 (presto.ReactionTrajectory): forward trajectory
        traj2 (presto.ReactionTrajectory): reverse trajectory

    Returns:
        combined ``ReactionTrajectory``
    """
    logger.info("Joining forward and reverse reaction trajectories....")
    assert isinstance(traj1, ReactionTrajectory), "Need a ReactionTrajectory"
    assert isinstance(traj2, ReactionTrajectory), "Need a ReactionTrajectory"

    assert traj1.forwards == True, "First trajectory must be forwards!"
    assert traj2.forwards == False, "Second trajectory must be reverse!"

    assert traj1.finished, "First trajectory must be finished!"
    assert traj2.finished, "Second trajectory must be finished!"

    assert np.array_equal(traj1.frames[0].positions, traj2.frames[0].positions), "Link positions must be same!"
    assert np.array_equal(traj1.frames[0].velocities, traj2.frames[0].velocities), "Link velocities must be same!"
    assert np.array_equal(traj1.frames[0].accelerations, traj2.frames[0].accelerations), "Link accelerations must be same!"

    new_traj = ReactionTrajectory(
        timestep = traj1.timestep,
        atomic_numbers = traj1.atomic_numbers,
        high_atoms = traj1.high_atoms,
        active_atoms = traj1.active_atoms,
        calculator = traj1.calculator,
        integrator = traj1.integrator,
        termination_function = traj1.termination_function,
        stop_time = traj1.stop_time,
        forwards = True,
    )

    f_frames = copy.deepcopy(traj1.frames)
    r_frames = copy.deepcopy(traj2.frames)
    r_frames.reverse()

    new_traj.frames = r_frames + f_frames[1:] # don't double-count middle frame

    if traj1.finished == 2:
        #### if the first traj finished with the reverse condition, reverse order
        new_traj.frames = new_traj.frames[::-1]

    return new_traj

