import unittest, cctk, logging
import numpy as np
from datetime import datetime

from asciichartpy import plot

import sys
sys.path.append('../presto')
import presto

logging.basicConfig(level=logging.INFO, filename="neon.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M', filemode="w")

def boring_scheduler(time):
    return 20

start = cctk.XYZFile.read_file("test/static/70-Ne.xyz").molecule
traj = presto.trajectory.EquilibrationTrajectory(
    timestep=0.5,
    atomic_numbers=start.atomic_numbers,
    high_atoms=np.array([]),
    inactive_atoms=np.array([]),
    calculator=presto.calculators.XTBCalculator(),
    integrator=presto.integrators.LangevinIntegrator(viscosity=0.0001),
    bath_scheduler=boring_scheduler,
    stop_time = 200,
)

traj.run(checkpoint_filename="test/static/ne_equil.chk", checkpoint_interval=10, positions=start.geometry)
print(f"{len(traj.frames)} frames run")

temps = [f.temperature() for f in traj.frames][200:]
energies = [f.energy for f in traj.frames][200:-1]

print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
print(plot(temps,{"height": 20}))
print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")
print(plot(energies, {"height":20}))

traj.write_movie("test/static/ne_equil.pdb")
print("done equil")
