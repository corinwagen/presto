import unittest, cctk, logging
import numpy as np
from datetime import datetime

import sys
sys.path.append('../presto')
import presto

from asciichartpy import plot

def boring_scheduler(time):
    return 298

footer = """ -C -H -N -O -F -P 0
6-31G(d)
****
-Pd
SDD
****

-Pd
SDD
"""

oniom_calc = presto.calculators.ONIOMCalculator(
    high_calculator = presto.calculators.GaussianCalculator(route_card="#p b3lyp/genecp force empiricaldispersion=gd3bj", footer=footer, link0={"nprocshared": 16, "mem": "32GB"}),
    low_calculator = presto.calculators.XTBCalculator(gfn=0),
)

start = cctk.XYZFile.read_file("test/static/solvated-brettphos-pd.xyz").molecule
traj = presto.trajectory.EquilibrationTrajectory(
    timestep=0.5,
    atomic_numbers=start.atomic_numbers,
    high_atoms=np.array(list(range(1,93))),
    inactive_atoms=np.array([]),
#    calculator=oniom_calc,
    calculator=presto.calculators.XTBCalculator(gfn=0),
    integrator=presto.integrators.LangevinIntegrator(radius=12,viscosity=0.0005,potential=presto.integrators.spherical_harmonic_potential(radius=15)),
    bath_scheduler=boring_scheduler,
    stop_time = 1000,
    checkpoint_filename = "test/static/pd-gfn0_equil.chk",
)

print("loading...")
traj.load_from_checkpoint()
temps = [f.temperature() for f in traj.frames][:]
energies = [f.energy for f in traj.frames][:-1]

print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
print(plot(temps, {"height": 20}))
print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")
print(plot(energies, {"height": 20}))

traj.write_movie("pd-gfn0_movie.pdb")

