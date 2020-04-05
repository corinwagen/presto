#class Constants:
"""
Base units for *presto*:
    distance:   Angstroms
    energy:     kcal/mol
    time:       femtoseconds
    force:      kcal/(mol*Å)
    temp:       Kelvin
    mass:       kcal

Forces from most computational chemistry software come in Hartrees/Bohr.

"""
ANGSTROM_PER_BOHR = 0.52917721092
BOHR_PER_ANGSTROM = 1.88972612457

HARTREE_PER_KCAL = 0.001593601
KCAL_PER_HARTREE = 627.5095

KCAL_MOL_ANGSTROMS_PER_HARTREE_BOHR = BOHR_PER_ANGSTROM * KCAL_PER_HARTREE

#    BOLTZMANN_CONSTANT = 0.0019872041 # kcal/(mol*K)
BOLTZMANN_CONSTANT = 0.0019872041 * 0.0004184

J_PER_KCAL = 4.184

"""
Force is the most complicated conversion:

x kcal      4184 J      1 kg m^2 s^-2     10^20 Å^2         1 s^2       1000 g      1 amu
-------  * -------- *  --------------- * ----------- * ------------- * -------- *  --------- = 0.0004184 * x amu Å fs^-2
mol * Å     1 kcal           1 J             m^2        10^30 fs^2      1 kg        1 g/mol
"""
