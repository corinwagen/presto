import numpy as np
import os, random, string, re, cctk, ctypes, copy, shutil, time
import subprocess as sp
import multiprocessing as mp

import xtb

from presto import constants, config, constraint

############################
### Directory Parameters ###
############################

# A-Za-z0-9
LETTERS_AND_DIGITS = string.ascii_letters + string.digits

# this is the absolute path to the directory where the run_gaussian.sh script is
GAUSSIAN_SCRIPT_DIRECTORY = config.GAUSSIAN_SCRIPT_DIRECTORY

# this is the absolute path to the directory where the run_xtb.sh script is
XTB_SCRIPT_DIRECTORY = config.XTB_SCRIPT_DIRECTORY

# where the xtb GFNn config files are stored
XTB_PATH = config.XTB_PATH

###########################

class Calculator():
    """
    Generic calculator class.
    """

    def __init__(self):
        pass

    def evaluate(self, atomic_numbers, positions, high_atoms, pipe):
        """
        Return energy, forces
        """
        pass


class NullCalculator(Calculator):
    """
    Does nothing except evaluate constraints. Mostly for testing purposes, but I guess you could also model something insanely boring this way.
    """
    def __init__(self, constraints=list()):
        for c in constraints:
            assert isinstance(c, constraint.Constraint), "{c} is not a valid constraint!"
        self.constraints = constraints

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None):
        energy = 0
        forces = np.zeros_like(positions).view(cctk.OneIndexedArray)

        for c in self.constraints:
            f, e = c.evaluate(positions)
            energy += e
            forces += f

        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces


class XTBCalculator(Calculator):
    """
    Attributes:
        charge (int):
        multiplicity (int):
        gfn (int or str):
        parallel (int):
    """

    def __init__(self, charge=0, multiplicity=1, gfn=2, parallel=1, constraints=list()):
        assert isinstance(charge, int)
        assert isinstance(multiplicity, int)
        assert isinstance(gfn, (int, str))
        assert isinstance(parallel, int)

        self.charge = charge
        self.multiplicity = multiplicity
        self.gfn = gfn
        self.parallel = parallel

        for c in constraints:
            assert isinstance(c, constraint.Constraint), "{c} is not a valid constraint!"
        self.constraints = constraints

        # select a unique 8-letter string that will
        # be used to identify this calculator
        self.UNIQUE_ID = random.choice(string.ascii_letters)
        for i in range(7):
            self.UNIQUE_ID += random.choice(LETTERS_AND_DIGITS)

        self.COUNTER = 0

    def randomize_id(self):
        """
        Re-randomize the id.
        """
        self.UNIQUE_ID = random.choice(string.ascii_letters)
        for i in range(7):
            self.UNIQUE_ID += random.choice(LETTERS_AND_DIGITS)

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, print_timing=False):
        """
        Gets the electronic energy and cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe (): for multiprocessing, the connection through which objects should be returned to the parent process
            print_timing (Bool):

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        # set working directory
        old_working_directory = os.getcwd()
        os.chdir(XTB_SCRIPT_DIRECTORY)

        # generate filenames
        attempts = 0
        while True:
            self.COUNTER += 1
            attempts += 1
            this_unique_id = f"{self.UNIQUE_ID}-{self.COUNTER:09d}"
            input_filename = f"presto-{this_unique_id}.xyz"
            if not os.path.isfile(input_filename):
                break
            if attempts > 10000:
                raise ValueError("could not find a unique filename to write!")
        output_filename = f"presto-{this_unique_id}.out"

        # create molecule
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)
        cctk.XYZFile.write_molecule_to_file(input_filename, molecule, title="presto")

        # run job and wait for completion
        command = [
            "bash", "run_xtb.sh",
            f"presto-{this_unique_id}",
            f"{self.charge}",
            f"{self.multiplicity - 1}",
            f"{self.gfn}",
            f"{self.parallel}",
            XTB_PATH,
            f"{self.UNIQUE_ID}.topo",
        ]

        start = time.time()
        process = sp.run(command, capture_output=True)  # redirect stdout and stderr to pipe
        end = time.time()
        if print_timing:
            print(f"\nxtb call {this_unique_id} took {end-start:.3f} s.")

        # get results
        job_directory = f"{XTB_SCRIPT_DIRECTORY}/presto-{this_unique_id}"
        try:
            process.check_returncode()
            os.chdir(job_directory)
            assert os.path.isfile("energy")
            assert os.path.isfile("gradient")
        except Exception as e:
            xtb_input_filename = f"{XTB_SCRIPT_DIRECTORY}/presto-{this_unique_id}/presto-{this_unique_id}.xyz"
            xtb_output_filename = f"{XTB_SCRIPT_DIRECTORY}/presto-{this_unique_id}/presto-{this_unique_id}.out"
            print("========= xtb error ========")
            print("\n===script command issued===")
            print(f"currently in {os.getcwd()}")
            print(command)
            print("\n===xtb input ===")
            print(f">>>{xtb_input_filename}")
            try:
                with open(xtb_input_filename,"r") as f:
                    print(f.read())
            except Exception as e:
                print(e)
            print("\n=== xtb output ===")
            print(f">>>{xtb_output_filename}")
            try:
                with open(xtb_output_filename, "r") as f:
                    print(f.read())
            except Exception as e:
                print(e)
            print("\n===run_xtb.sh script stdout===")
            print(process.stdout.decode("utf-8"))
            print("\n===run_xtb.sh script stderr===")
            print(process.stderr.decode("utf-8"))
            print()
            print("========= xtb error ========")
            raise ValueError(f"command line xtb job {this_unique_id} died with exit code {exit_code} (found_energy_file={found_energy_file}, found_gradient_file={found_gradient_file})!")

        # parse energy
        with open("energy", "r") as f:
            energy_lines = f.read().splitlines()
        energy = energy_lines[1]
        fields = energy.split()
        energy = float(fields[1])

        # parse forces
        with open("gradient", "r") as f:
            gradient_lines = f.read().splitlines()
        forces = []
        for line in gradient_lines:
            fields = line.split()
            if len(fields) == 3:
                x,y,z = float(fields[0]), float(fields[1]), float(fields[2])
                forces.append([-x,-y,-z])
        forces = cctk.OneIndexedArray(forces)
        forces = forces * constants.AMU_A2_FS2_PER_HARTREE_BOHR
        assert len(forces) == molecule.get_n_atoms(), "unexpected number of atoms"

        # delete job directory
        os.chdir(XTB_SCRIPT_DIRECTORY)
        try:
            shutil.rmtree(job_directory)
            pass
        except Exception as e:
            print(e)
            print(f"warning: could not remove ${job_directory} but continuing")

        # restore working directory
        os.chdir(old_working_directory)

        # apply constraints
        for c in self.constraints:
            f, e = c.evaluate(positions)
            energy += e
            forces += f

        # return result
        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces

class GaussianCalculator(Calculator):

    def __init__(
            self,
            charge=0,
            multiplicity=1,
            link0={"mem":"1GB", "nprocshared":"4"},
            route_card="#p hf/3-21g force",
            footer=None,
            constraints=list(),
        ):
        if not re.search("force", route_card):
            raise ValueError("need a force job to calculate forces")

        self.charge = charge
        self.multiplicity = multiplicity
        self.link0 = link0
        self.route_card = route_card
        self.footer = footer

        for c in constraints:
            assert isinstance(c, constraint.Constraint), "{c} is not a valid constraint!"
        self.constraints = constraints

        # select a unique 8-letter string that will
        # be used to identify this calculator
        self.UNIQUE_ID = random.choice(string.ascii_letters)
        for i in range(7):
            self.UNIQUE_ID += random.choice(LETTERS_AND_DIGITS)

        self.COUNTER = 0

    def randomize_id(self):
        self.UNIQUE_ID = random.choice(string.ascii_letters)
        for i in range(7):
            self.UNIQUE_ID += random.choice(LETTERS_AND_DIGITS)

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, print_timing=False, qc=False):
        """
        Gets the electronic energy and Cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe (): for multiprocessing, the connection through which objects should be returned to the parent process
            print_timing (bool):
            qc (bool): try quadratic convergence for tricky cases, only after default DIIS fails

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        # set working directory
        old_working_directory = os.getcwd()
        os.chdir(GAUSSIAN_SCRIPT_DIRECTORY)

        # generate filenames
        attempts = 0
        while True:
            self.COUNTER += 1
            attempts += 1
            this_unique_id = f"{self.UNIQUE_ID}-{self.COUNTER:09d}"
            input_filename = f"presto-{this_unique_id}.gjf"
            if not os.path.isfile(input_filename):
                break
            if attempts > 10000:
                raise ValueError("could not find a unique filename to write!")
        output_filename = f"presto-{this_unique_id}.out"

        # create molecule
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)

        # write out job
        route_card = self.route_card
        if qc:
            print("warning: initial DIIS convergence failed, trying quadradic convergence")
            route_card = f"{self.route_card} scf=qc"
        cctk.GaussianFile.write_molecule_to_file(input_filename, molecule, route_card, self.link0, self.footer)

        # run job
        start = time.time()
        command = ["bash", "run_gaussian.sh", f"presto-{this_unique_id}"]
        process = sp.Popen(command, stdout=sp.PIPE)
        output, error = process.communicate()
        p_status = process.wait()
        end = time.time()
        output = output.decode("utf-8")
        if p_status != 0:
            raise ValueError(f"gaussian job {this_unique_id} died with exit code {p_status}!")
        if print_timing:
            print(f"\nGaussian call {this_unique_id} took {end-start:.3f} s.")

        energy, forces = None, None
        try:
            # get results
            job_directory = f"{GAUSSIAN_SCRIPT_DIRECTORY}/presto-{this_unique_id}"
            os.chdir(job_directory)
            gaussian_file = cctk.GaussianFile.read_file(output_filename)
            ensemble = gaussian_file.ensemble
            molecule = ensemble.molecules[-1]
            properties_dict = ensemble.get_properties_dict(molecule)
            energy = properties_dict["energy"]
            forces = properties_dict["forces"]
            forces = forces * constants.AMU_A2_FS2_PER_HARTREE_BOHR
        except:
            # worth trying quadratic convergence for those random cases
            try:
                assert qc is False
                self.evaluate(atomic_numbers, positions, high_atoms, pipe, print_timing, qc=True)
            except:
                os.chdir(old_working_directory)
                shutil.copyfile(f"{job_directory}/{output_filename}", output_filename)
                raise ValueError(f"can't parse Gaussian output file - copied to {old_working_directory}/{output_filename} for your perusal")

        # delete job directory
        os.chdir(GAUSSIAN_SCRIPT_DIRECTORY)
        try:
            shutil.rmtree(job_directory)
        except Exception as e:
            print(e)
            print(f"warning: could not remove ${job_directory} but continuing")

        # restore working directory
        os.chdir(old_working_directory)

        # apply constraints
        for c in self.constraints:
            f, e = c.evaluate(positions)
            energy += e
            forces += f

        # return result
        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces

class ONIOMCalculator(Calculator):
    """
    Composes two other calculators, and computes forces according to the ONIOM embedding scheme.
    """
    def __init__(self, high_calculator, low_calculator, constraints=list()):
        assert isinstance(high_calculator, Calculator), "high calculator isn't a proper Calculator!"
        assert isinstance(low_calculator, Calculator), "low calculator isn't a proper Calculator!"
        self.high_calculator = high_calculator
        self.low_calculator = low_calculator

        for c in constraints:
            assert isinstance(c, constraint.Constraint), f"{c} is not a valid constraint!"
        self.high_calculator.constraints = constraints
        self.constraints = constraints

        #### prevent namespace collisions
        self.full_calculator = copy.deepcopy(self.low_calculator)
        self.full_calculator.randomize_id()

        assert self.low_calculator.UNIQUE_ID != self.full_calculator.UNIQUE_ID, "namespace collision!"

    def evaluate(self, atomic_numbers, positions, high_atoms, pipe=None):
        """
        Evaluates the forces according to the ONIOM embedding scheme.
        """
        assert len(high_atoms) > 0, "no point in doing ONIOM without a high layer!"
        assert isinstance(atomic_numbers, cctk.OneIndexedArray), "need to pass one-indexed array for indexing to work properly"
        assert isinstance(positions, cctk.OneIndexedArray), "need to pass one-indexed array for indexing to work properly"

        high_atomic_numbers = atomic_numbers[high_atoms]
        high_positions = positions[high_atoms]

        parent_hh, child_hh = mp.Pipe()
        process_hh = mp.Process(target=self.high_calculator.evaluate, kwargs={
            "atomic_numbers": high_atomic_numbers,
            "positions": high_positions,
            "pipe": child_hh,
        })
        process_hh.start()

        parent_hl, child_hl = mp.Pipe()
        process_hl = mp.Process(target=self.low_calculator.evaluate, kwargs={
            "atomic_numbers": high_atomic_numbers,
            "positions": high_positions,
            "pipe": child_hl,
        })
        process_hl.start()

        parent_ll, child_ll = mp.Pipe()
        process_ll = mp.Process(target=self.full_calculator.evaluate, kwargs={
            "atomic_numbers": atomic_numbers,
            "positions": positions,
            "pipe": child_ll,
        })
        process_ll.start()

        e_hh, f_hh = parent_hh.recv()
        e_hl, f_hl = parent_hl.recv()
        e_ll, f_ll = parent_ll.recv()

        process_hh.join()
        process_hl.join()
        process_ll.join()

        energy = e_hh + e_ll - e_hl
        forces = f_ll
        forces[high_atoms] = f_hh + f_ll[high_atoms] - f_hl

        return energy, forces

class OpenFFCalculator(Calculator):
    def __init__(self, smiles_components, charge=0, multiplicity=1,):
        #### we load these here because it's likely there may be non-OpenMM projects
#        from simtk.unit import unit_definitions as u

        self.charge = charge
        self.multiplicity = multiplicity
        self.smiles_components = smiles_components
        self.simulation = None
        self.mapping = None

#        self.force_units = u.amu * u.angstrom * u.angstrom / u.femtosecond
#        self.energy_units = u.kilocalories_per_mole

    def initialize(self, molecule):
        from simtk import openmm
        import openforcefield as off
        from openforcefield.typing.engines.smirnoff import ForceField
        forcefield = ForceField("openff_unconstrained-1.2.0.offxml")

        #### build OpenForceField topology
        topology = off.topology.Topology()
        self.mapping = list()
        for fragment, smiles in zip(molecule.fragment(), self.smiles_components):
            smiles_mol = cctk.Molecule.new_from_smiles(smiles).assign_connectivity()
            offm = off.topology.Molecule.from_smiles(smiles)
            topology.add_molecule(offm)

            fragment.assign_connectivity()
            iso, mapping = cctk.Molecule.are_isomorphic(fragment, smiles_mol, return_ordering=True)
            assert iso, f"fragment is not isomorphic to smiles {smiles}"
            self.mapping += mapping

        print([[a.topology_atom_index for a in b.atoms] for b in topology.topology_bonds])
        print(mapping)

        #### set up OpenMM system
        forcefield.get_parameter_handler('Electrostatics').method = 'PME'
        system = forcefield.create_openmm_system(topology)
        integrator = openmm.VerletIntegrator(1.0) # we won't use this
        simulation = openmm.app.Simulation(topology.to_openmm(), system, integrator)
        self.simulation = simulation

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, print_timing=False):
        """
        Gets the electronic energy and Cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe (): for multiprocessing, the connection through which objects should be returned to the parent process
            print_timing (Bool):

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """

        if self.simulation is None:
            molecule = cctk.Molecule(atomic_numbers, positions).assign_connectivity()
            self.initialize(molecule)

        positions = positions[self.mapping] * 0.1 # convert to nm
        positions = positions.view(np.ndarray).tolist()

        # run job
        start = time.time()

        s = self.simulation
        s.context.setPositions(positions)
        state = s.context.getState(getEnergy=True, getForces=True)
        energy = state.getPotentialEnergy() #/ self.energy_units * constants.HARTREE_PER_KCAL
        forces = state.getForces(asNumpy=True) #/ self.force_units

        end = time.time()
        if print_timing:
            print(f"\nOpenMM call took {end-start:.3f} s.")

        # apply constraints
        for c in self.constraints:
            f, e = c.evaluate(positions)
            energy += e
            forces += f

        # return result
        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces


