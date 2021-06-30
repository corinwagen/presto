import numpy as np
import cctk, logging, os
import presto

logger = logging.getLogger(__name__)

def initialize(calc, output_file, tolerance=1, max_attempts=50, init_method="quasiclassical", temperature=298, mode_options=None, high_atoms=None):
    """
    Initializes a trajectory based on a Gaussian output file.

    Arguments:

    Returns:
        atomic_numbers (cctk.OneIndexedArray)
        positions (cctk.OneIndexedArray)
        velocities (cctk.OneIndexedArray)
        accelerations (cctk.OneIndexedArray)
    """
    assert os.path.exists(output_file), f"Need Gaussian output file for quasiclassical initialization!"

    assert isinstance(tolerance, (int, float)), "tolerance must be numeric!"
    assert isinstance(max_attempts, int), "max_attempts must be integer"
    assert isinstance(temperature, (int, float)), "temperature must be numeric!"
    assert isinstance(high_atoms, (list, np.ndarray)), "high_atoms must be list!"

    for idx in range(max_attempts):
        qcf = cctk.GaussianFile.read_file(output_file)
        mol = qcf.get_molecule()

        excited, expected_PE, _, text, velocities = cctk.quasiclassical.get_quasiclassical_perturbation(
            mol,
            return_velocities=True,
            which=init_method,
            mode_options=mode_options,
        )

        # check that we're close to expected additional PE, and that our perturbation hasn't done anything wild.
        # if so we just try again.
        actual_PE, _ = calc.evaluate(mol.atomic_numbers, excited.geometry, high_atoms)
        extra_PE = (actual_PE - qcf.ensemble[-1, "energy"]) * presto.constants.KCAL_PER_HARTREE
        diff = abs(expected_PE - extra_PE)
        if diff < tolerance:
            logger.info(f"Successful initialization! ({expected_PE:.2f} expected, {extra_PE:.2f} obtained, ∆ {diff:.2f}, max ∆ {tolerance:.2f}) -- attempt {idx}/{max_attempts}")
            logger.info(f"\n{text}")
            return mol.atomic_numbers, excited.geometry, velocities, np.zeros_like(velocities.view(np.ndarray)).view(cctk.OneIndexedArray)
        else:
            logger.error(f"Error initializing trajectory ({expected_PE:.2f} expected, {extra_PE:.2f} obtained, ∆ {diff:.2f}, max ∆ {tolerance:.2f}) -- attempt {idx}/{max_attempts}")

        if idx == max_attempts - 1:
            logger.error("Could not initialize!")
            return None
