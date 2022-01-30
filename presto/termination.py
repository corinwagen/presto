import numpy as np
import cctk, logging
import presto

logger = logging.getLogger(__name__)

def build_termination_function(termination_string):
    """
    Initializes a trajectory based on a Gaussian output file.

    Arguments:
        termination_string (str):

    Returns:
        function mapping frames to bool
    """

    def is_finished(frame):
        mol = frame.molecule().assign_connectivity()

        # replace B(i,j) - bond order
        for match in re.finditer(r"B\((\d+),(\d+)\)", termination_string):
            termination_string.replace(
                match.group(0),
                mol.get_bond_order(int(match.group(1)), int(match.group(2))),
            )

        # replace D(i,j) - bond distance
        for match in re.finditer(r"D\((\d+),(\d+)\)", termination_string):
            termination_string.replace(
                match.group(0),
                mol.get_distance(int(match.group(1)), int(match.group(2))),
            )

        # replace A(i,j,k) - bond angle
        for match in re.finditer(r"A\((\d+),(\d+), (\d+)\)", termination_string):
            termination_string.replace(
                match.group(0),
                mol.get_angle(int(match.group(1)), int(match.group(2)), int(match.group(3))),
            )

        # replace DH(i,j,k,l) - bond dihedral angle
        for match in re.finditer(r"DH\((\d+),(\d+), (\d+), (\d+)\)", termination_string):
            termination_string.replace(
                match.group(0),
                mol.get_angle(int(match.group(1)), int(match.group(2)), int(match.group(3)), int(match.group(4))),
            )

        # then just eval the resulting expression
        return eval(termination_string)
