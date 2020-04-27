import unittest, cctk
import numpy as np
from datetime import datetime

import sys
sys.path.append('../presto')

import presto

def solvent_box():
    def boring_scheduler(time):
        return 298

    start = cctk.XYZFile.read_file("test/static/30_dcm.xyz").molecule
    traj = presto.trajectory.EquilibrationTrajectory(
        timestep=0.5,
        atomic_numbers=start.atomic_numbers,
        high_atoms=np.array([]),
        active_atoms=np.arange(1,start.num_atoms()+1),
        calculator=presto.calculators.XTBCalculator(),
        integrator=presto.integrators.VelocityVerletIntegrator(),
        bath_scheduler=boring_scheduler,
        stop_time = 50,
    )

    print(datetime.now())
    traj.run(checkpoint_filename="chk.chk", checkpoint_interval=50, positions=start.geometry)
    print(datetime.now())

    temps = [f.temperature() for f in traj.forward_frames][10:]
    energies = [f.energy for f in traj.forward_frames][10:-1]
    pressures = [f.pressure() for f in traj.forward_frames][10:]

    print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
    print(f"PRESSURE:\t\t{np.mean(pressures):.2f} (± {np.std(pressures):.2f})")
    print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")

    print("done")

solvent_box()

