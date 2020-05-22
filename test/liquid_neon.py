import unittest, cctk, logging
import numpy as np
from datetime import datetime

from asciichartpy import plot

import sys
sys.path.append('../presto')
import presto

logging.basicConfig(level=logging.INFO, filename="neon.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M', filemode="w")

start = cctk.XYZFile.read_file("test/static/30-Ne.xyz").molecule
traj = presto.trajectory.EquilibrationTrajectory(
    timestep=0.25,
    atomic_numbers=start.atomic_numbers,
    high_atoms=np.array([]),
    inactive_atoms=np.array([]),
    calculator=presto.calculators.XTBCalculator(gfn=0),
#    integrator=presto.integrators.VelocityVerletIntegrator(),
    integrator=presto.integrators.LangevinIntegrator(viscosity=0.001, potential=presto.integrators.spherical_harmonic_potential(radius=10)),
    bath_scheduler=50,
    stop_time=1000,
)

traj.run(checkpoint_filename="neon.chk", checkpoint_interval=10, positions=start.geometry)
