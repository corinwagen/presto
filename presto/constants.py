import numpy as np

"""
Base units for *presto*:
    distance:   Angstroms
    energy:     kcal/mol
    time:       femtoseconds
    temp:       Kelvin
    mass:       amu

Forces from most computational chemistry software come in Hartrees/Bohr.

1 kcal      4184 J      1 kg m^2 s^-2     10^20 Å^2         1 s^2       1000 g      1 amu
-------  * -------- *  --------------- * ----------- * ------------- * -------- *  --------- = 0.0004184 * x amu Å fs^-2
mol * Å     1 kcal           1 J             m^2        10^30 fs^2      1 kg        1 g/mol

Viscosity comes in Pa * s (kg * m^-1 * s^-1):

1 kg       1 s       6.022*10^26 amu      1 m
----- * ---------- * --------------- * --------- = 60.22 amu Å^-1 fs^-1
m * s    10^15 fs         1 kg          10^10 Å

To convert to Pascals:

  1 kg     6.022 * 10^26 amu     1 m          1 s^2
------- * ------------------ * -------- * ------------ = 6.022 * 10^-14 amu Å^-1 fs^-2
m * s**2         1 kg           10^10 Å    10^30 fs^2

But since one atmosphere is 101325 Pa, the net conversion becomes 6.102 * 10^-9 amu Å^-1 fs^-2 = 1 atm.
"""

ANGSTROM_PER_BOHR = 0.52917721092
BOHR_PER_ANGSTROM = 1.88972612457

HARTREE_PER_KCAL = 0.001593601
KCAL_PER_HARTREE = 627.5095

KCAL_MOL_ANGSTROMS_PER_HARTREE_BOHR = BOHR_PER_ANGSTROM * KCAL_PER_HARTREE
AMU_A_FS2_PER_KCAL_MOL_ANGSTROM = 0.0004184
AMU_A2_FS2_PER_KCAL_MOL = 0.0004184
AMU_A2_FS2_PER_HARTREE_BOHR = 0.4961455 # AMU_A_FS2_PER_KCAL_MOL_ANGSTROM * KCAL_MOL_ANGSTROMS_PER_HARTREE_BOHR

BOLTZMANN_CONSTANT = 0.0019872041 * 0.0004184 # convert from kcal/mol to amu Å^2/fs^2 - checked with Wolfram Alpha

AMU_A_FS_PER_PASCAL_SECOND = 60.22 # checked with Wolfram Alpha

AMU_A_FS2_PER_ATM = 6.1019 * 10 ** -9 # checked with Wolfram Alpha)

ISOTHERMAL_COMPRESSIBILITY_OF_WATER = 4.6e-10 / 9.869e-6 # convert from inverse Pa to inverse atm

"""
Radii taken from Inorg. Mater. 2001, 37, 871 and J. Phys. Chem. A. 2009, 113, 5806.
"""
VDW_RADII = {
    1: 1.1,
    2: 1.4,
    3: 1.81,
    4: 1.53,
    5: 1.92,
    6: 1.70,
    7: 1.55,
    8: 1.52,
    9: 1.47,
    10: 1.54,
    11: 2.27,
    12: 1.73,
    13: 1.84,
    14: 2.10,
    15: 1.80,
    16: 1.80,
    17: 1.75,
    18: 1.88,
    19: 2.75,
    20: 2.31,
    21: 2.30,
    22: 2.15,
    23: 2.05,
    24: 2.05,
    25: 2.05,
    26: 2.05,
    27: 2.00,
    28: 2.00,
    29: 2.00,
    30: 2.10,
    31: 1.87,
    32: 2.11,
    33: 1.85,
    34: 1.90,
    35: 1.83,
    36: 2.02,
    37: 3.03,
    38: 2.49,
    39: 2.40,
    40: 2.30,
    41: 2.15,
    42: 2.10,
    43: 2.05,
    44: 2.05,
    45: 2.00,
    46: 2.05,
    47: 2.10,
    48: 2.20,
    49: 1.93,
    50: 2.17,
    51: 2.06,
    52: 2.06,
    53: 1.98,
    54: 2.18,
    55: 3.43,
    56: 2.68,
    57: 2.50,
    72: 2.25,
    73: 2.20,
    74: 2.10,
    75: 2.05,
    76: 2.00,
    77: 2.00,
    78: 2.05,
    79: 2.10,
    80: 2.05,
    81: 1.96,
    82: 2.02,
    83: 2.07,
    84: 1.97,
    85: 2.02,
    86: 2.20,
    87: 3.48,
    88: 2.83,
    89: 2.40,
    90: 2.30,
}

def vdw_radius(z):
    assert isinstance(z, (int, np.integer)), "can't have a non-integer atomic number"
    if z in VDW_RADII:
        return VDW_RADII[z]
    else:
        raise ValueError(f"no van der Waals radius defined for element {z}!")
