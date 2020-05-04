import numpy as np
import math, copy, cctk, os

import h5py
import presto

class Trajectory():
    """

    Attributes:
        timestep (float): in fs
        frames (list of presto.Frame):

        high_atoms (np.ndarray): to calculate at high level of theory, list of 1-indexed atom numbers
        active_atoms (np.ndarray): non-frozen atoms, list of 1-indexed atom numbers

        atomic_numbers (cctk.OneIndexedArray): list of atomic numbers
        masses (cctk.OneIndexedArray): list of masses
        radii (cctk.OneIndexedArray): list of VDW radii

        calculator (presto.Calculator):
        integrator (presto.Integrator):

        finished (bool):
        forwards (bool):
    """

    def __init__(self, timestep, atomic_numbers, high_atoms, calculator, integrator, forwards=True, **kwargs):
        assert isinstance(atomic_numbers, cctk.OneIndexedArray), "atomic numbers must be cctk 1-indexed array!"
        assert isinstance(calculator, presto.calculators.Calculator), "need a valid calculator!"
        assert isinstance(integrator, presto.integrators.Integrator), "need a valid integrator!"

        self.atomic_numbers = atomic_numbers
        self.calculator = calculator
        self.integrator = integrator
        self.finished = False

        assert isinstance(high_atoms, np.ndarray), "high_atoms must be np.ndarray!"
        self.high_atoms = high_atoms

        active_atoms = None
        if "active_atoms" in kwargs:
            active_atoms = kwargs["active_atoms"]
        elif "inactive_atoms" in kwargs:
            active_atoms = list(range(1, len(atomic_numbers)+1))
            for atom in kwargs["inactive_atoms"]:
                active_atoms.remove(atom)
            active_atoms = np.array(active_atoms)
        else:
            raise ValueError("neither active atoms nor inactive atoms specificed!")

        assert isinstance(active_atoms, np.ndarray), "active_atoms must be np.ndarray!"
        self.active_atoms = active_atoms

        assert timestep > 0, "can't have timestep ≤ 0!"
        self.timestep = float(timestep)

        self.masses = cctk.OneIndexedArray([float(cctk.helper_functions.draw_isotopologue(z)) for z in atomic_numbers])
        self.frames = []

        assert isinstance(forwards, bool), "forwards must be bool"
        self.forwards = forwards

    def run(self, checkpoint_filename, checkpoint_interval, **kwargs):
        if self.has_checkpoint(checkpoint_filename):
            self.load_from_checkpoint(checkpoint_filename)
        else:
            if len(self.frames) == 0:
                self.initialize(**kwargs)

        if self.finished:
            return self
        else:
            self.propagate(checkpoint_filename, checkpoint_interval)
            self.save(checkpoint_filename)
            return self

    def initialize(self):
        """
        Adds first frame with randomly-initialized velocities.
        """
        pass

    def propagate(self, checkpoint_interval, checkpoint_filename):
        """
        Runs trajectories, checking for completion and saving as necessary.

        Will call ``self.save()`` every ``checkpoint_interval`` frames.
        """
        pass

    def has_checkpoint(self, filename):
        if os.path.exists(filename):
            with h5py.File(filename, "r+") as h5:
                all_energies = h5.get("all_energies")
                if all_energies is None:
                    return False
                if len(all_energies) > 0:
                    return True
                else:
                    return False
        else:
            return False

    def load_from_checkpoint(self, filename):
        assert self.has_checkpoint(filename), "can't load without checkpoint file"
        with h5py.File(filename, "r") as h5:
            assert self.timestep == h5.attrs['timestep']
            assert np.array_equal(self.high_atoms, h5.attrs['high_atoms'])
            assert np.array_equal(self.active_atoms, h5.attrs['active_atoms'])
            assert np.array_equal(self.atomic_numbers, h5.attrs['atomic_numbers'])
            self.finished = h5.attrs['finished']

            all_energies = h5.get("all_energies")
            all_positions = h5.get("all_positions")
            all_velocities= h5.get("all_velocities")
            all_accels = h5.get("all_accelerations")
            temperatures = h5.get("bath_temperatures")

            assert len(all_positions) == len(all_energies)
            assert len(all_velocities) == len(all_energies)
            assert len(all_accels) == len(all_energies)

            self.frames = []
            for i, e in enumerate(all_energies):
                self.frames.append(presto.frame.Frame(
                    self,
                    all_positions[i].view(cctk.OneIndexedArray),
                    all_velocities[i].view(cctk.OneIndexedArray),
                    all_accels[i].view(cctk.OneIndexedArray),
                    energy=e,
                    bath_temperature=temperatures[i]
                ))
        return

    def save(self, filename):
        if self.has_checkpoint(filename):
            with h5py.File(filename, "r+") as h5:
                n_atoms = len(self.atomic_numbers)
                h5.attrs['finished'] = self.finished
                all_energies = h5.get("all_energies")

                old_n_frames = len(all_energies)
                now_n_frames = len(self.frames)
                new_n_frames = now_n_frames - old_n_frames

                if new_n_frames == 0:
                    return
                assert new_n_frames > 0, "we can't write negative frames"

                new_energies = np.asarray([frame.energy for frame in self.frames[-new_n_frames-1:]])
                all_energies.resize((now_n_frames,))
                all_energies[-new_n_frames-1:] = new_energies

                new_positions = np.stack([frame.positions for frame in self.frames[-new_n_frames:]])
                all_positions = h5.get("all_positions")
                all_positions.resize((now_n_frames,n_atoms,3))
                all_positions[-new_n_frames:] = new_positions

                new_velocities= np.stack([frame.velocities for frame in self.frames[-new_n_frames:]])
                all_velocities = h5.get("all_velocities")
                all_velocities.resize((now_n_frames,n_atoms,3))
                all_velocities[-new_n_frames:] = new_velocities

                new_accels = np.stack([frame.accelerations for frame in self.frames[-new_n_frames:]])
                all_accels = h5.get("all_accelerations")
                all_accels.resize((now_n_frames,n_atoms,3))
                all_accels[-new_n_frames:] = new_accels

                new_temps = np.stack([frame.bath_temperature for frame in self.frames[-new_n_frames:]])
                all_temps = h5.get("bath_temperatures")
                all_temps.resize((now_n_frames,))
                all_temps[-new_n_frames:] = new_temps
        else:
            with h5py.File(filename, "w") as h5:
                # store general data about the trajectory
                h5.attrs['timestep'] = self.timestep
                h5.attrs['high_atoms'] = self.high_atoms
                h5.attrs['active_atoms'] = self.active_atoms
                h5.attrs['atomic_numbers'] = self.atomic_numbers
                h5.attrs['finished'] = self.finished
                h5.attrs['forwards'] = self.forwards
                n_atoms = len(self.atomic_numbers)

                energies = np.asarray([frame.energy for frame in self.frames])
                h5.create_dataset("all_energies", data=energies, maxshape=(None,),
                            compression="gzip", compression_opts=9)

                all_positions = np.stack([frame.positions for frame in self.frames])
                h5.create_dataset("all_positions", data=all_positions, maxshape=(None,n_atoms,3),
                                compression="gzip", compression_opts=9)

                all_velocities = np.stack([frame.velocities for frame in self.frames])
                h5.create_dataset("all_velocities", data=all_velocities, maxshape=(None,n_atoms,3),
                                compression="gzip", compression_opts=9)

                all_accels= np.stack([frame.accelerations for frame in self.frames])
                h5.create_dataset("all_accelerations", data=all_accels, maxshape=(None,n_atoms,3),
                                compression="gzip", compression_opts=9)

                temps = np.asarray([frame.bath_temperature for frame in self.frames])
                h5.create_dataset("bath_temperatures", data=temps, maxshape=(None,),
                            compression="gzip", compression_opts=9)

    def write_movie(self, filename):
        ensemble = self.as_ensemble()
        cctk.PDBFile.write_ensemble_to_trajectory(filename, ensemble)

    def as_ensemble(self):
        ensemble = cctk.ConformationalEnsemble()
        for frame in self.frames[:-1]:
            ensemble.add_molecule(frame.molecule(), {"bath_temperature": frame.bath_temperature, "energy": frame.energy})
        return ensemble

    def spawn(self, termination_function, max_time):
        """
        Returns:
            forward ReactionTrajectory
            reverse ReactionTrajectory
        """
        # add random velocity to previously inactive atoms
        frame = self.frames[-1]

        random_gaussian = np.random.normal(size=frame.positions.shape).view(cctk.OneIndexedArray)
        random_gaussian[frame.active_mask()] = 0
        new_velocities = random_gaussian * np.sqrt(frame.bath_temperature * presto.constants.BOLTZMANN_CONSTANT / self.masses.reshape(-1,1))

        f_traj = ReactionTrajectory(
            timestep = self.timestep,
            atomic_numbers = self.atomic_numbers,
            high_atoms = self.high_atoms,
            active_atoms = np.array(list(range(1, len(self.atomic_numbers)+1))), # all atoms are active now
            calculator = self.calculator,
            integrator = self.integrator,
        )

        f_traj.termination_function = termination_function
        f_traj.max_time = max_time
        f_traj.initialize(frame=frame, new_velocities=new_velocities)

        r_traj = copy.deepcopy(f_traj)
        r_traj.forwards = False

        return f_traj, r_traj

    @classmethod
    def join(cls, traj1, traj2):
        pass


class ReactionTrajectory(Trajectory):
    """
    Attributes:
        termination_function (function): detects if first or last Frame has reached product/SM or should otherwise be halted.
            takes ``Frame`` argument as option and returns ``True``/``False``.
        max_time (float): how long to run forward and reverse trajectories
        forwards (Bool): whether or not to propagate in reverse or forward
    """

    def initialize(self, frame, new_velocities):
        """
        Generates initial frame object for reaction trajectory. Initializes any non-zero velocities.
        Velocities are taken from the Maxwell–Boltzmann distribution for the given temperature.

        Args:
            frame (presto.frame.Frame): equilibrated frame
            new_velocities (cctk.OneIndexedArray): array of velocities to add to equilibrated frame (for previously-frozen atoms)

        Returns:
            frame
        """
        assert isinstance(frame, presto.frame.Frame), "need a valid frame"

        positions = frame.positions
        velocities = frame.velocities + new_velocities.view(cctk.OneIndexedArray)
        accelerations = frame.accelerations

        self.frames = [presto.frame.Frame(self, positions, velocities, accelerations, frame.bath_temperature)]

    def propagate(self, checkpoint_filename, checkpoint_interval, time_after_finished=50):
        assert isinstance(checkpoint_interval, int) and checkpoint_interval > 0, "interval must be positive integer"
        time_since_finished = 0

        for t in np.arange(self.timestep * len(self.frames), self.max_time, self.timestep):
            if time_since_finished >= time_after_finished:
                self.finished = True
                return

            if self.termination_function(self.frames[-1]) or time_since_finished > 0:
                time_since_finished += self.timestep

            self.frames.append(self.frames[-1].next(temp=self.frames[-1].bath_temperature, forwards=self.forwards))
            if len(self.frames) % checkpoint_interval == 0:
                self.save(checkpoint_filename)

        self.finished = True
        return

class EquilibrationTrajectory(Trajectory):
    """
    Attributes:
        bath_scheduler (function): takes current time and returns target temperature
        stop_time (float): when to stop equilibrating
    """

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        stop_time = kwargs.get("stop_time")
        bath_scheduler = kwargs.get("bath_scheduler")

        assert (isinstance(stop_time, float)) or (isinstance(stop_time, int)), "stop_time needs to be numeric!"
        assert stop_time > 0, "stop_time needs to be positive!"

        self.stop_time = stop_time
        self.bath_scheduler = bath_scheduler

    def initialize(self, positions):
        """
        Generates initial frame object for initialization trajectory.
        Velocities are taken from the Maxwell–Boltzmann distribution for the given temperature.

        Args:
            positions (cctk.OneIndexedArray):

        Returns:
            frame
        """
        assert isinstance(positions, cctk.OneIndexedArray), "positions must be a one-indexed array!"

        # move centroid to origin
        centroid = np.mean(positions, axis=0)
        positions = positions - centroid

        # determine active atoms
        inactive_mask = np.ones(shape=len(positions)).view(cctk.OneIndexedArray)
        inactive_mask[self.active_atoms] = 0
        inactive_mask  = inactive_mask.astype(bool)

        # add random velocity to everything
        random_gaussian = np.random.normal(size=positions.shape).view(cctk.OneIndexedArray)
        random_gaussian[inactive_mask] = 0
        velocities = random_gaussian * np.sqrt(self.bath_scheduler(0) * presto.constants.BOLTZMANN_CONSTANT / self.masses.reshape(-1,1))

        # subtract out center-of-mass translational motion
        com_translation = np.sum(self.masses.reshape(-1,1) * velocities, axis=0)
        correction_tran = np.tile(com_translation / np.sum(self.masses[self.active_atoms]), (len(velocities),1))
        correction_tran[inactive_mask] = 0
        velocities = velocities - correction_tran
        com_translation = np.sum(self.masses.reshape(-1,1) * velocities, axis=0)
        assert np.linalg.norm(np.sum(self.masses.reshape(-1,1) * velocities, axis=0)) < 0.0001, "didn't remove COM translation well enough!"

        velocities = velocities.view(cctk.OneIndexedArray)
        accelerations = np.zeros_like(positions).view(cctk.OneIndexedArray)
        self.frames = [presto.frame.Frame(self, positions, velocities, accelerations, self.bath_scheduler(0))]

    def propagate(self, checkpoint_filename, checkpoint_interval):
        assert isinstance(checkpoint_interval, int) and checkpoint_interval > 0, "interval must be positive integer"
        for t in np.arange(self.timestep * len(self.frames), self.stop_time, self.timestep):
            self.frames.append(self.frames[-1].next(temp=self.bath_scheduler(t)))
            if len(self.frames) % checkpoint_interval == 0:
                self.save(checkpoint_filename)
        self.finished = True
        return
