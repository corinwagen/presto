import unittest, cctk, logging
import numpy as np
from datetime import datetime

import sys
sys.path.append('../presto')
import presto

from asciichartpy import plot

logging.basicConfig(level=logging.INFO, filename="water.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M', filemode="w")

def boring_scheduler(time):
    return 298

#oniom_calc = presto.calculators.ONIOMCalculator(
#    high_calculator = presto.calculators.GaussianCalculator(route_card="#p b3lyp/genecp force empiricaldispersion=gd3bj", footer=footer, link0={"nprocshared": 16, "mem": "32GB"}),
#    low_calculator = presto.calculators.XTBCalculator(gfn=0),
#)

start = cctk.XYZFile.read_file("test/static/500_water.xyz").molecule
traj = presto.trajectory.EquilibrationTrajectory(
    timestep=0.5,
    atomic_numbers=start.atomic_numbers,
    high_atoms=np.array([]),
    inactive_atoms=np.array([]),
    calculator=presto.calculators.XTBCalculator(gfn=0),
    integrator=presto.integrators.LangevinIntegrator(radius=12,viscosity=0.0005,potential=presto.integrators.spherical_harmonic_potential(radius=15)),
    bath_scheduler=boring_scheduler,
    stop_time = 10000,
    checkpoint_filename="test/static/water.chk",
)

print("loading...")
temps = np.array([f.temperature() for f in traj.frames][:])
energies = np.array([f.energy for f in traj.frames][:-1])
rel_energies = energies - np.min(energies)
rel_energies = energies * 627.509

print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
print(plot(np.mean(temps[:(len(temps)//18)*18].reshape(-1,18), axis=1), {"height": 20}))
print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")
print(plot(np.mean(rel_energies[:(len(rel_energies)//18)*18].reshape(-1,18), axis=1), {"height":20}))

traj.write_movie("water-equil.pdb")

