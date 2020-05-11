import numpy as np
import os, random, string, re, cctk, ctypes
import subprocess as sp
import shutil
import multiprocessing as mp
import time

import xtb

from presto import constants
from presto import config

############################
### Directory Parameters ###
############################

# A-Za-z0-9
LETTERS_AND_DIGITS = string.ascii_letters + string.digits

# select a unique 8-letter string that will
# be used to identify this particular Python process
UNIQUE_ID = random.choice(string.ascii_letters)
for i in range(7):
    UNIQUE_ID += random.choice(LETTERS_AND_DIGITS)

# will be incremented by one every time a calculation is run
GAUSSIAN_COUNTER = 0
XTB_COUNTER = 0

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
        pass

class XTBCalculator(Calculator):

    def __init__(self, charge=0, multiplicity=1, gfn=2, parallel=1):
        assert isinstance(charge, int)
        assert isinstance(multiplicity, int)
        assert isinstance(gfn, int)
        assert isinstance(parallel, int) #### for some reason this doesn't work :/

        self.charge = charge
        self.multiplicity = multiplicity
        self.gfn = gfn
        self.parallel = parallel

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, increment=1):
        """
        Gets the electronic energy and cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe ():
            increment (int): extra increment for counter

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        # set working directory
        old_working_directory = os.getcwd()
        os.chdir(XTB_SCRIPT_DIRECTORY)

        # generate filenames
        global XTB_COUNTER
        attempts = 0
        while True:
            XTB_COUNTER += increment
            attempts += 1
            this_unique_id = f"{UNIQUE_ID}-{XTB_COUNTER:09d}"
            input_filename = f"presto-{this_unique_id}.xyz"
            if not os.path.isfile(input_filename):
                break
            if attempts > 10000:
                raise ValueError("could not find a unique filename to write!")
        output_filename = f"presto-{this_unique_id}.out"

        # create molecule
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)

        # write out job
        cctk.XYZFile.write_molecule_to_file(input_filename, molecule, title="presto")

        # run job and wait for completion
        command = ["bash", "run_xtb.sh",
                   f"presto-{this_unique_id}",
                   f"{self.charge}",
                   f"{self.multiplicity - 1}",
                   f"{self.gfn}",
                   f"{self.parallel}",
                   XTB_PATH]
        process = sp.run(command, capture_output=True)  # redirect stdout and stderr to pipe
        exit_code = process.returncode

        if exit_code != 0:
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
            raise ValueError(f"command line xtb job {this_unique_id} died with exit code {exit_code}!")

        # get results
        job_directory = f"{XTB_SCRIPT_DIRECTORY}/presto-{this_unique_id}"
        os.chdir(job_directory)

        # parse energy
        if not os.path.isfile("energy"):
            raise ValueError(f"xtb energy file not found for job {this_unique_id}")
        with open("energy", "r") as f:
            energy_lines = f.read().splitlines()
        energy = energy_lines[1]
        fields = energy.split()
        energy = float(fields[1])

        # parse forces
        if not os.path.isfile("gradient"):
            raise ValueError(f"xtb gradient file not found for job {this_unique_id}")
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
        except Exception as e:
            print(e)
            print(f"warning: could not remove ${job_directory} but continuing")

        # restore working directory
        os.chdir(old_working_directory)

        # return result
        if pipe is not None:
            assert isinstance(pipe, mp.connection.Connection), "not a valid Connection instance!"
            pipe.send([energy, forces])
            pipe.close()
        else:
            return energy, forces

class GaussianCalculator(Calculator):

    def __init__(self, charge=0, multiplicity=1,
                 link0={"mem":"1GB", "nprocshared":"4"},
                 route_card="#p hf 3-21g force",
                 footer=None):
        if not re.search("force", route_card):
            raise ValueError("need a force job to calculate forces")

        self.charge = charge
        self.multiplicity = multiplicity
        self.link0 = link0
        self.route_card = route_card
        self.footer = footer

    def evaluate(self, atomic_numbers, positions, high_atoms=None, pipe=None, increment=1):
        """
        Gets the electronic energy and Cartesian forces for the specified geometry.

        Args:
            atomic_numbers (cctk.OneIndexedArray): the atomic numbers (int)
            positions (cctk.OneIndexedArray): the atomic positions in angstroms
            high_atoms (np.ndarray): do nothing with this
            pipe ():
            increment (int): extra increment for counter

        Returns:
            energy (float): in Hartree
            forces (cctk.OneIndexedArray): in amu Å per fs**2
        """
        # set working directory
        old_working_directory = os.getcwd()
        os.chdir(GAUSSIAN_SCRIPT_DIRECTORY)

        # generate filenames
        global GAUSSIAN_COUNTER
        attempts = 0
        while True:
            GAUSSIAN_COUNTER += increment
            attempts += 1
            this_unique_id = f"{UNIQUE_ID}-{GAUSSIAN_COUNTER:09d}"
            input_filename = f"presto-{this_unique_id}.gjf"
            if not os.path.isfile(input_filename):
                break
            if attempts > 10000:
                raise ValueError("could not find a unique filename to write!")
        output_filename = f"presto-{this_unique_id}.out"

        # create molecule
        molecule = cctk.Molecule(atomic_numbers, positions, charge=self.charge, multiplicity=self.multiplicity)

        # write out job
        cctk.GaussianFile.write_molecule_to_file(input_filename, molecule, self.route_card, self.link0, self.footer)

        # run job
        command = ["bash", "run_gaussian.sh", f"presto-{this_unique_id}"]
        process = sp.Popen(command, stdout=sp.PIPE)
        output, error = process.communicate()
        p_status = process.wait()
        output = output.decode("utf-8")
        if p_status != 0:
            raise ValueError(f"gaussian job {this_unique_id} died with exit code {p_status}!")

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

        # delete job directory
        os.chdir(GAUSSIAN_SCRIPT_DIRECTORY)
        try:
            shutil.rmtree(job_directory)
        except Exception as e:
            print(e)
            print(f"warning: could not remove ${job_directory} but continuing")

        # restore working directory
        os.chdir(old_working_directory)

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
    def __init__(self, high_calculator, low_calculator):
        assert isinstance(high_calculator, Calculator), "high calculator isn't a proper Calculator!"
        assert isinstance(low_calculator, Calculator), "low calculator isn't a proper Calculator!"
        self.high_calculator = high_calculator
        self.low_calculator = low_calculator

    def evaluate(self, atomic_numbers, positions, high_atoms, pipe=None):
        """
        Evaluates the forces according to the ONIOM embedding scheme.
        """
        high_atomic_numbers = atomic_numbers[high_atoms]
        high_positions = positions[high_atoms]

        parent_hh, child_hh = mp.Pipe()
        process_hh = mp.Process(target=self.high_calculator.evaluate, kwargs={
            "atomic_numbers": high_atomic_numbers,
            "positions": high_positions,
            "pipe": child_hh,
        })
        process_hh.start()

        #### prevent collisions in the time between when one calculation has checked for namespace availability and actually written the file
        time.sleep(0.1)

        parent_hl, child_hl = mp.Pipe()
        process_hl = mp.Process(target=self.low_calculator.evaluate, kwargs={
            "atomic_numbers": high_atomic_numbers,
            "positions": high_positions,
            "pipe": child_hl,
            "increment": 2
        })
        process_hl.start()

        time.sleep(0.1)

        parent_ll, child_ll = mp.Pipe()
        process_ll = mp.Process(target=self.low_calculator.evaluate, kwargs={
            "atomic_numbers": atomic_numbers,
            "positions": positions,
            "pipe": child_ll,
            "increment": 3,
        })
        process_ll.start()

        e_hh, f_hh = parent_hh.recv()
        e_hl, f_hl = parent_hl.recv()
        e_ll, f_ll = parent_ll.recv()

        process_hh.join()
        process_hl.join()
        process_ll.join()

        # this is the non-multiprocessing way. lame!
#        e_hh, f_hh = self.high_calculator.evaluate(high_atomic_numbers, high_positions)
#        e_hl, f_hl = self.low_calculator.evaluate(high_atomic_numbers, high_positions)
#        e_ll, f_ll = self.low_calculator.evaluate(atomic_numbers, positions)

        energy = e_hh + e_ll - e_hl
        forces = f_ll
        forces[high_atoms] = f_hh + f_ll[high_atoms] - f_hl

        return energy, forces
