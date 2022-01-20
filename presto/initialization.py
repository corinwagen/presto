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

    if high_atoms is not None:
        assert isinstance(high_atoms, (list, np.ndarray)), "high_atoms must be list!"

    qcf = cctk.GaussianFile.read_file(output_file)
    mol = qcf.get_molecule()

    for idx in range(max_attempts):
        excited, expected_PE, _, text, velocities = cctk.quasiclassical.get_quasiclassical_perturbation(
            mol,
            return_velocities=True,
            which=init_method,
            mode_options=mode_options,
        )

        # check that we're close to expected additional PE, and that our perturbation hasn't done anything wild.
        # if so we just try again.
        logger.info(f"\n=== Initialization Attempt {idx+1} of {max_attempts} ===")
        logger.info(f"Excitation details:\n{text}")
        actual_PE, _ = calc.evaluate(mol.atomic_numbers, excited.geometry, high_atoms)
        extra_PE = (actual_PE - qcf.ensemble[-1, "energy"]) * presto.constants.KCAL_PER_HARTREE
        diff = expected_PE - extra_PE

        logger.info(f"Expected extra potential energy: {expected_PE:.2f} kcal/mol")
        logger.info(f"Actual extra potential energy:   {extra_PE:.2f} kcal/mol")
        logger.info(f"Difference (threshold={tolerance:.2f}):     {diff:.2f} kcal/mol")

        if abs(diff) < tolerance:
            logger.info("> Initialization was successful.")
            return mol.atomic_numbers, excited.geometry, velocities, np.zeros_like(velocities.view(np.ndarray)).view(cctk.OneIndexedArray)
        else:
            logger.error(f"> Initialization failed harmonic check.")

        if idx == max_attempts - 1:
            logger.error("Maximum number of initialization attempts exceeded!")
            return None
