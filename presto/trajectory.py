import numpy as np
import math, copy, cctk, os, re, logging, time
import fasteners

import h5py
import presto

logger = logging.getLogger(__name__)

# list of allowed properties to compute for each frame
ALLOWED_PROPERTIES = ["dipole"]

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
        checkpoint_interval (int):
        lock (fasteners.InterProcessLock): lock object
        save_interval (int): how many frames to save
        buffer (int): how many frames to keep in memory
        bath_scheduler (function): maps time to desired temperature, in K.
        termination_function (function): determines if the trajectory is finished or not
        target_pressure (float): desired pressure for NPT simulation, or ``None`` for NVT simulation. in atm.
        barostat_time_constant (float): desired time constant for NPT simulation barostat coupling. in fs.
        properties (list of str): what properties to calculate. for now, only ``dipole`` is allowed.
    """

    def __init__(
        self,
        calculator=None,
        integrator=None,
        reporters=None,
        checks=None,
        timestep=None,
        atomic_numbers=None,
        high_atoms=None,
        forwards=True,
        checkpoint_filename=None,
        checkpoint_interval=10,
        stop_time=None,
        save_interval=1,
        buffer=100,
        load_frames="all", # or ``first`` or ``last`` or a slice
        bath_scheduler=298,
        termination_function=None,
        target_pressure=None,
        barostat_time_constant=100,
        **kwargs
    ):

        # do this first!
        if timestep is not None:
            assert timestep > 0, "can't have timestep ≤ 0!"
            self.timestep = float(timestep)

        # also do this first, so checkpoint file can overrule as needed
        if forwards is not None:
            assert isinstance(forwards, bool), "forwards must be bool"
            self.forwards = forwards
        elif not hasattr(self, "forwards"):
            self.forwards = True

        if checkpoint_filename is not None:
            assert isinstance(checkpoint_filename, str), "need string for file"
        self.checkpoint_filename = checkpoint_filename

        assert isinstance(checkpoint_interval, int) and checkpoint_interval > 0, "checkpoint_interval must be positive integer"
        self.checkpoint_interval = checkpoint_interval

        assert isinstance(save_interval, int), "save_interval needs to be positive"
        assert save_interval > 0, "save_interval needs to be positive"
        self.save_interval = save_interval

        self.lock = None
        self.initialize_lock()
        self.frames = list()

        if self.has_checkpoint():
            self.load_from_checkpoint(load_frames)

        # now we carry on building the "mundane" attributes 
        if calculator is not None:
            assert isinstance(calculator, presto.calculators.Calculator), "need a valid calculator!"
        self.calculator = calculator

        if integrator is not None:
            assert isinstance(integrator, presto.integrators.Integrator), "need a valid integrator!"
        self.integrator = integrator

        self.checks = list()
        if checks is not None:
            assert all([isinstance(c, presto.checks.Check) for c in checks])
            self.checks = checks

        self.reporters = list()
        if reporters is not None:
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

        if not hasattr(self, "stop_time"):
            assert (isinstance(stop_time, float)) or (isinstance(stop_time, int)), "stop_time needs to be numeric!"
            assert stop_time > 0, "stop_time needs to be positive!"
            self.stop_time = int(stop_time)

        assert isinstance(buffer, int), "buffer needs to be positive"
        assert buffer > 0, "buffer needs to be positive"
        self.buffer = buffer

        # build bath scheduler
        if hasattr(bath_scheduler, "__call__"):
            self.bath_scheduler = bath_scheduler
        elif isinstance(bath_scheduler, (int, float)):
            # most of the time it's ok just to keep things constant.
            def sched(time):
                return bath_scheduler
            self.bath_scheduler = sched
        else:
            raise ValueError(f"unknown type {type(bath_scheduler)} for bath_scheduler - want either a function or a number!")

        # build termination function
        if termination_function is not None:
            assert hasattr(termination_function, "__call__"), "termination_function must be a function!"
            self.termination_function = termination_function
        else:
            # if we haven't specified any criteria, we don't want to end before time's up! so we'll just say "end never."
            def term(time):
                return False
            self.termination_function = term

        # build barostat
        self.target_pressure = None
        if target_pressure is not None:
            assert isinstance(target_pressure, (int, float)), "target_pressure must be ``None`` or numeric"
            self.target_pressure = target_pressure
        self.barostat_time_constant = barostat_time_constant

        # properties
        self.properties = list()
        if "properties" in kwargs:
            assert isinstance(kwargs["properties"], list), "properties must be list of str"
            for prop in kwargs["properties"]:
                assert prop in ALLOWED_PROPERTIES, "unknown property!"
            self.properties = kwargs["properties"]

            # autospawn reporter
            # todo - enable interval customization
            for prop in self.properties:
                self.reporters.append(presto.reporters.PropertyReporter(interval=1, prop=prop))


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

    def run(self, keep_all=False, time=None, **kwargs):
        """
        Run the trajectory.

        Args:
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
                controller.run(runtime=time)
            except Exception as e:
                raise ValueError(f"Trajectory run terminated prematurely due to error: {e}")

        if keep_all:
            self.load_from_checkpoint()
            assert self.frames[0].time == 0, "missing first frame despite keep_all being True!"

        return self

    def initialize(self, frame=None, positions=None, velocities=None, accelerations=None, init_atoms=None, remove_idxs=None, **kwargs):
        """
        Adds first frame with randomly-initialized velocities.
        Velocities are taken from the Maxwell–Boltzmann distribution for the given temperature.

        Can pass either a frame (from a different trajectory) or positions/velocities/accelerations.

        Args:
            frame (presto.frame.Frame): frame to modify or copy
            positions (cctk.OneIndexedArray): starting positions
            velocities (cctk.OneIndexedArray): starting velocities, optional.
            accelerations (cctk.OneIndexedArray): starting accelerations, optional.
            init_atoms (list of int): atoms to randomly give starting velocity. can be a list of indices.
                if velocity is ``None`` all active atoms will be given a starting velocity.
            remove_idxs (list of int): atoms to remove. these indices will be deleted!

        Returns:
            frame
        """
        # have we already initialized things?
        if len(self.frames):
            return
        elif self.has_checkpoint():
            self.load_from_checkpoint(slice(-1,None,None))
            assert len(self.frames), "didn't load frames properly!"
            return
        logger.info("Initializing new trajectory...")

        # if we get given a frame, we'll just copy everything from that
        if frame is not None:
            assert isinstance(frame, presto.frame.Frame), "need a valid frame"
            positions = frame.positions
            velocities = frame.velocities
            accelerations = frame.accelerations

        # remove certain atoms, as desired
        if remove_idxs is not None:
            if isinstance(remove_idxs, int):
                remove_idxs = [remove_idxs]
            assert isinstance(remove_idxs, list), "remove_idxs must be list"

            positions = np.delete(positions, [i - 1 for i in remove_idxs], axis=0).view(cctk.OneIndexedArray)
            if velocities is not None:
                velocities = np.delete(velocities, [i - 1 for i in remove_idxs], axis=0).view(cctk.OneIndexedArray)
            if accelerations is not None:
                accelerations = np.delete(accelerations, [i - 1 for i in remove_idxs], axis=0).view(cctk.OneIndexedArray)

        # initialize with zero velocity and acceleration
        assert isinstance(positions, cctk.OneIndexedArray), "positions must be a one-indexed array!"
        zeros = np.zeros_like(positions, dtype="float").view(cctk.OneIndexedArray)
        # horrible bugfix - need to not pass the same object to velocities and accelerations!! (ccw 7.6.22)
        frame = presto.frame.Frame(self, positions, copy.deepcopy(zeros), copy.deepcopy(zeros), bath_temperature=self.bath_scheduler(0), time=0.0)

        # then adjust velocity and acceleration after-the-fact
        if velocities is None:
            frame.add_thermal_energy()
        else:
            assert isinstance(velocities, cctk.OneIndexedArray)
            velocities[frame.inactive_mask()] = 0.0
            frame.velocities += velocities

            # add extra kick to requested atoms
            if init_atoms:
                frame.add_thermal_energy(atoms=init_atoms)

        if accelerations is not None:
            assert isinstance(accelerations, cctk.OneIndexedArray)
            accelerations[frame.inactive_mask()] = 0.0
            frame.accelerations += accelerations

        self.frames = [frame]
        self.save()

    def has_checkpoint(self):
        if self.checkpoint_filename is not None:
            if os.path.exists(self.checkpoint_filename):
                return True

        return False

    def load_from_checkpoint(self, frames="all"):
        """
        Loads frames from ``self.checkpoint_filename``.

        Args:
            frames (Slice object): if not all frames are desired, a Slice object can be passed
                or a string - ``all``, ``first``, ``last``, or ``buffer``

        Returns:
            nothing
        """
        if not self.has_checkpoint():
            return # nothing to load!

        if frames == "all":
            frames = slice(None)
        elif frames == "first":
            frames = slice(1, None, None)
        elif frames == "last":
            frames = slice(-1, None, None)
        elif frames == "buffer":
            frames = slice(-self.buffer, None, None)
        else:
            assert isinstance(frames, slice), "load_frames must be ``all``, ``first``, ``last``, or slice"

        self.initialize_lock()
        self.lock.acquire()

        with h5py.File(self.checkpoint_filename, "r") as h5:
            # load hdf5 attrs
            atomic_numbers = h5.attrs["atomic_numbers"]
            self.atomic_numbers = cctk.OneIndexedArray(atomic_numbers)
            masses = h5.attrs["masses"]
            self.masses = cctk.OneIndexedArray(masses)
            self.finished = h5.attrs['finished']
            self.forwards = h5.attrs['forwards']

            # load frames from hdf5 datasets
            self.frames = []
            if len(h5.get("all_energies")):
                all_energies = h5.get("all_energies")[frames]
                all_positions = h5.get("all_positions")[frames]
                all_velocities= h5.get("all_velocities")[frames]
                all_accels = h5.get("all_accelerations")[frames]
                temperatures = h5.get("bath_temperatures")[frames]
                all_times = h5.get("all_times")[frames]

                # v0.2.6 - adding barostat support, working on backwards compatibility
                all_scales = None
                try:
                    all_scales = h5.get("scale_factors")[frames]
                except Exception as e:
                    all_scales = np.ones_like(all_energies, dtype="float")

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
                        scale_factor=all_scales[i],
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
                h5.attrs['forwards'] = self.forwards

                #### change 3.22.22 - this way masses save automatically, so you can edit isotopologues.
                h5.attrs['masses'] = self.masses.view(np.ndarray)

                all_energies = h5.get("all_energies")
                old_n_frames = len(all_energies)

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

                # v0.2.6 - adding scale factor for barostat
                all_scales = None
                try:
                    all_scales = h5.get("scale_factors")
                    assert all_scales is not None
                except Exception as e:
                    # this is a new column, so old checkpoints may not have it.
                    old_scales = np.ones(shape=old_n_frames, dtype="float")
                    h5.create_dataset("scale_factors", data=old_scales, maxshape=(None,), compression="gzip", compression_opts=9)
                    all_scales = h5.get("scale_factors")

                new_scales = np.stack([frame.scale_factor for frame in frames_to_add])
                all_scales.resize((now_n_frames,))
                all_scales[-new_n_frames:] = new_scales


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

                scales = np.asarray([frame.scale_factor for frame in frames_to_add]).astype("float")
                h5.create_dataset("scale_factors", data=scales, maxshape=(None,), compression="gzip", compression_opts=9)

            logger.info(f"Saving to new checkpoint file {self.checkpoint_filename} ({len(frames_to_add)} frames added; {last_run_time:.1f}/{self.stop_time:.1f} fs run in total)")
        self.lock.release()

        # lower memory usage by not keeping every frame in memory.
        if keep_all:
            pass
        else:
            self.frames = self.frames[-self.buffer:]

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
            # connectivity matters
            ensemble.assign_connectivity()
            cctk.MOL2File.write_ensemble_to_file(filename, ensemble)
        elif re.search("molden$", filename) or re.search("xyz$", filename):
            cctk.XYZFile.write_ensemble_to_file(filename, ensemble)
        else:
            raise ValueError(f"error writing {filename}: this filetype isn't currently supported!")

    def as_ensemble(self, idxs):
        ensemble = cctk.ConformationalEnsemble()
        for frame in self.frames[:-1]:
            ensemble.add_molecule(frame.molecule(idxs), {"bath_temperature": frame.bath_temperature, "energy": frame.energy})
        return ensemble

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

def join(traj1, traj2, check=True):
    """
    Join two trajectories together -- one forward and one reverse!
    Returns a single reaction trajectory.
    Eugene edit: Times for the reverse trajectory will be made negative.
    Args:
        traj1 (presto.Trajectory): forward trajectory
        traj2 (presto.Trajectory): reverse trajectory
        check (bool): check if the joining makes sense (highly recommended)
    Returns:
        combined ``ReactionTrajectory``
    """
    logger.info("Joining forward and reverse reaction trajectories....")
    assert isinstance(traj1, Trajectory), "Need a ReactionTrajectory"
    assert isinstance(traj2, Trajectory), "Need a ReactionTrajectory"

    assert traj1.forwards == True, "First trajectory must be forwards!"
    assert traj2.forwards == False, "Second trajectory must be reverse!"

    # load all frames
    traj1.load_from_checkpoint()
    traj2.load_from_checkpoint()

    if check:
        assert np.array_equal(traj1.frames[0].positions, traj2.frames[0].positions), "Link positions must be same!"
        assert np.array_equal(traj1.frames[0].velocities, traj2.frames[0].velocities), "Link velocities must be same!"
        assert np.array_equal(traj1.frames[0].accelerations, traj2.frames[0].accelerations), "Link accelerations must be same!"

    new_traj = Trajectory(
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

    # make reverse reverse frame times negative
    for frame in r_frames:
        frame.time = -frame.time

    new_traj.frames = r_frames + f_frames[1:] # don't double-count middle frame

    if traj1.finished == 2 and traj2.finished == 1:
        # if the first traj finished with the reverse condition, reverse order and reverse all times
        new_traj.frames = new_traj.frames[::-1]
        for frame in new_traj.frames:
            frame.time = -frame.time

    return new_traj
