"""
Methods for interfacing *presto* with external programs.

This is code that, by necessity, is a bit "ugly."
"""

import sys, os
import numpy as np
import os, random, string, re, cctk, ctypes, copy, shutil, tempfile, logging, time, math
import subprocess as sp

try:
    import importlib.resources as pkg_resources
except ImportError:
    import importlib_resources as pkg_resources

import presto

logger = logging.getLogger(__name__)

class ExternalProgramManager():
    """
    Class for running an external program and sending the output back to *presto*.

    Attributes:
        homedir (str): directory presto is running in
        workdir (str): directory to call the external program from
        _delete_when_done (bool): False unless the workdir is temporary
    """

    def __init__(self, workdir=None):
        self.homedir = os.getcwd()

        if workdir is not None:
            assert os.path.isdir(workdir)
            self.workdir = workdir
            self._delete_when_done = False
        else:
            self.workdir = tempfile.mkdtemp()
            self._delete_when_done = True

    def cleanup(self):
        if self._delete_when_done:
           shutil.rmtree(self.workdir)

    def copy_to_work(self, from_filename, to_filename):
        if from_filename[0] == '/':
            shutil.copyfile(f"{from_filename}", f"{self.workdir}/{to_filename}")
        else:
            shutil.copyfile(f"{self.homedir}/{from_filename}", f"{self.workdir}/{to_filename}")

    def copy_to_home(self, from_filename, to_filename):
        if to_filename[0] == '/':
            shutil.copyfile(f"{self.workdir}/{from_filename}", f"{to_filename}")
        else:
            shutil.copyfile(f"{self.workdir}/{from_filename}", f"{self.homedir}/{to_filename}")

def run_gaussian(gaussian_file, chk_file=None, directory=None):
    """
    Run a Gaussian job.

    Args:
        gaussian_file (cctk.GaussianFile): file to run
        chk_file (str): path to starting checkpoint file.
            if present, the checkpoint file will be written here at the end of the job.
            if there is already a checkpoint file at the location, then it will be used for the current job.
        directory (str): desired working directory, or None for temporary directory

    Returns:
        energy
        forces
        elapsed time
        properties_dict
    """
    properties = dict()

    # check that g16 is even on this system
    assert presto.config.HAS_G16, f"G16 not present; can't run job!"

    manager = ExternalProgramManager(directory)

    # copy oldchk
    if chk_file:
        gaussian_file.link0["chk"] = "chk.chk"

        # if there's already a chk file, then we want to use that for SCF guess
        if os.path.exists(chk_file):
            gaussian_file.link0["oldchk"] = "oldchk.chk"
            manager.copy_to_work(chk_file, "oldchk.chk")
            gaussian_file.route_card += " guess=read"

    # write gaussian input file
    gaussian_file.write_file(f"{manager.workdir}/g16-in.gjf")

    # build command
    command = f"{presto.config.G16_EXEC} g16-in.gjf g16-out.out"

    # run gaussian
    start = time.time()
    result = sp.run(command, cwd=manager.workdir, shell=True, capture_output=True)
    end = time.time()
    elapsed = end - start

    # make sure things ran ok
    result.check_returncode()
    assert os.path.isfile(f"{manager.workdir}/g16-out.out"), "no energy file!"
    gaussian_file = cctk.GaussianFile.read_file(f"{manager.workdir}/g16-out.out")
    assert gaussian_file is not None, f"g16 failure"

    # extract energy and forces
    ensemble = gaussian_file.ensemble
    molecule = ensemble.molecules[-1]
    properties_dict = ensemble.get_properties_dict(molecule)
    energy = properties_dict["energy"]
    forces = properties_dict["forces"]
    forces = forces * presto.constants.AMU_A2_FS2_PER_HARTREE_BOHR

    # save new checkpoint file
    if chk_file and os.path.exists(f"{manager.workdir}/chk.chk"):
        manager.copy_to_home("chk.chk", chk_file)

    # clean up and return data
    manager.cleanup()
    del manager
    return energy, forces, elapsed, properties

def run_xtb(molecule, gfn=2, parallel=8, xcontrol_path=None, topo_path=None, directory=None, calc_dipole=False):
    """
    Run an xtb job.

    Args:
        molecule (cctk.Molecule):
        gfn (int or "ff"): which gfn method to use
        parallel (int):
        xcontrol_path (str):
        topo_path (str):
        directory (str):
        calc_dipole (bool):

    Returns:
        energy
        forces
        elapsed time
        properties dict
    """

    properties = dict()

    # check that xtb is even on this system
    assert presto.config.HAS_XTB, f"xtb not present; can't run job!"

    forces, energy = None, None
    manager = ExternalProgramManager(directory)

    # build command
    command = presto.config.XTB_EXEC
    if gfn == "ff":
        command += " --gfnff"
    else:
        command += f" --gfn {gfn}"
    command += f" --chrg {molecule.charge} --uhf {molecule.multiplicity - 1}"
    if parallel > 1:
        command += f" --parallel {parallel}"
    if xcontrol_path:
        command += f" --input {xcontrol_path}"
    if calc_dipole:
        command += " --dipole"
    command += " --grad xtb-in.xyz &> xtb-out.out"

    # set system params
    os.environ["OMP_NUM_THREADS"] = str(parallel)
    os.environ["MKL_NUM_THREADS"] = str(parallel)
    os.environ["OMP_STACKSIZE"] = "4G"
    os.environ["OMP_MAX_ACTIVE_LEVELS"] = "1"
    os.environ["XTBPATH"] = presto.config.XTB_PATH
    os.environ["XTBHOME"] = presto.config.XTB_PATH

    # write input .xyz file
    cctk.XYZFile.write_molecule_to_file(f"{manager.workdir}/xtb-in.xyz", molecule)
    if topo_path and os.path.exists(topo_path):
        manager.copy_to_work(topo_path, "gfnff_topo")

    # run xtb
    start = time.time()
    result = sp.run(command, cwd=manager.workdir, shell=True, capture_output=True)
    end = time.time()
    elapsed = end - start

    # make sure things ran ok
    result.check_returncode()
    assert os.path.isfile(f"{manager.workdir}/energy"), "no energy file!"
    assert os.path.isfile(f"{manager.workdir}/gradient"), "no gradient file!"

    # parse energy
    with open(f"{manager.workdir}/energy", "r") as f:
        energy_lines = f.read().splitlines()
    energy = float(energy_lines[1].split()[1])

    # parse forces
    with open(f"{manager.workdir}/gradient", "r") as f:
        gradient_lines = f.read().splitlines()
    forces = []
    for line in gradient_lines:
        fields = line.split()
        if len(fields) == 3:
            x,y,z = float(fields[0]), float(fields[1]), float(fields[2])
            forces.append([-x,-y,-z])
    forces = cctk.OneIndexedArray(forces)
    forces = forces * presto.constants.AMU_A2_FS2_PER_HARTREE_BOHR
    assert len(forces) == molecule.get_n_atoms(), "unexpected number of atoms"

    if calc_dipole:
        with open(f"{manager.workdir}/xtb-out.out", "r") as f:
            output_lines = f.read().splitlines()
            for linenum in range(len(output_lines)):
                if gfn == 2:
                    if "molecular dipole:" in output_lines[linenum]:
                        dipole_pieces = output_lines[linenum+3].split()
                        properties["dipole"] = np.array([float(d) for d in dipole_pieces[1:4]])
                        break
                elif gfn == 0:
                    if "dipole moment from electron density (au)" in output_lines[linenum]:
                        dipole_pieces = output_lines[linenum+2].split()
                        properties["dipole"] = np.array([float(d) for d in dipole_pieces[:3]])
                        break
                else:
                    raise ValueError(f"can't predict IR from this level of theory!\ngfn = {gfn}")

    # save topology
    if gfn == "ff" and not os.path.exists(topo_path):
        assert os.path.exists(f"{manager.workdir}/gfnff_topo"), "xtb didn't generate topology file!"
        manager.copy_to_home("gfnff_topo", topo_path)

    # clean up and return data
    manager.cleanup()
    del manager
    if calc_dipole:
        assert "dipole" in properties, "we failed to calculate dipole!"
    return energy, forces, elapsed, properties

def run_packmol(input_xyz, output_xyz="solvated.xyz", solvent=["dcm"], num=[100], directory=None):
    """
    Solvate ``input_xyz`` with ``num`` molecules of ``solvent`` using PACKMOL.
    Generates ``output_xyz``.

    Args:
        input_file (str): path to input xyz file
        output_file (str): path to output xyz file
        solvent (list of str): solvent names
        num (list of int): how many of each solvent
        directory (str): directory to work in. if None, tmpdir will be used.
    """
    # check that packmol is even on this system
    assert presto.config.HAS_PACKMOL, f"PACKMOL not present; can't run job!"

    manager = ExternalProgramManager(directory)
    assert len(solvent) == len(num), "num solvents must match num numbers"

    # write packmol control file   
    text = "#\n# input file built automatically\n# presto\n\n"
    text += "tolerance 2.0\nfiletype xyz\n\n"
    text += f"structure input.xyz\n  number 1\n  fixed 0. 0. 0. 0. 0. 0.\n  centerofmass\nend structure\n\n"
    manager.copy_to_work(input_xyz, "input.xyz")

    # compute solute volume
    volume = cctk.XYZFile.read_file(input_xyz).get_molecule().volume()

    # compute solvent volume
    import presto.solvents as solvents
    for s, n in zip(solvent, num):
        with pkg_resources.path(solvents, f"{s}.xyz") as file:
            f = cctk.XYZFile.read_file(file)
            title = f.titles[0]
            title_dict = {x.split("=")[0]: x.split("=")[1] for x in title.split(" ")}

            assert "mw" in title_dict.keys(), f"need mw=__ in title of {s}.xyz!"
            assert "density" in title_dict.keys(), f"need density=__ in title of {s}.xyz!"

            volume += n * float(title_dict["mw"]) / float(title_dict["density"]) * 1.6606 # 10^24 (Å**3 per mL) divided by Avogadro's number

    # compute bounding radius
    radius = np.cbrt(0.75 * volume / math.pi)

    # finish packmol control file, now that we have the bounding radius
    for s, n in zip(solvent, num):
        with pkg_resources.path(solvents, f"{s}.xyz") as file:
            text += f"structure {file}\n  number {n}\n  inside sphere 0. 0. 0. {radius:.2f}\nend structure\n\n"
    text += f"output output.xyz"

    # write temporary packmol input file
    with open(f"{manager.workdir}/packmol.inp", "w+") as file:
        file.write(text)

    # call packmol!
    # todo - specify packmol executable in presto.config
    result = sp.run(f"{presto.config.PACKMOL_EXEC} < packmol.inp", cwd=manager.workdir, shell=True, capture_output=True)
    result.check_returncode()

    # copy output home
    manager.copy_to_home("output.xyz", output_xyz)

    # clean it up
    manager.cleanup()
    del manager

    return radius
