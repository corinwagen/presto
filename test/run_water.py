import unittest, cctk, logging
import numpy as np
from datetime import datetime

import sys
sys.path.append('../presto')
import presto

logging.basicConfig(level=logging.INFO, filename="water.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M', filemode="w")

def boring_scheduler(time):
    return 298

#oniom_calc = presto.calculators.ONIOMCalculator(
#    high_calculator = presto.calculators.GaussianCalculator(route_card="#p b3lyp/genecp force empiricaldispersion=gd3bj", footer=footer, link0={"nprocshared": 16, "mem": "32GB"}),
#    low_calculator = presto.calculators.XTBCalculator(gfn=0),
#)

start = cctk.XYZFile.read_file("test/static/solvated-brettphos-pd.xyz").molecule
traj = presto.trajectory.EquilibrationTrajectory(
    timestep=0.5,
    atomic_numbers=start.atomic_numbers,
    high_atoms=np.array([]),
    inactive_atoms=np.array([]),
    calculator=presto.calculators.XTBCalculator(gfn=0),
    integrator=presto.integrators.LangevinIntegrator(radius=12,viscosity=0.0005,potential=presto.integrators.spherical_harmonic_potential(radius=15)),
    bath_scheduler=boring_scheduler,
    stop_time = 10000,
)

print("running...")
traj.run(checkpoint_filename="test/static/water.chk", checkpoint_interval=50, positions=start.geometry)
temps = [f.temperature() for f in traj.frames][500:]
energies = [f.energy for f in traj.frames][500:-1]

print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")

traj.write_movie("pd-gfn0_movie.mol2")

