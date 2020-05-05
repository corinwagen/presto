import unittest, cctk
import numpy as np
from datetime import datetime

import sys
sys.path.append('../presto')

import presto

def boring_scheduler(time):
    return 298

start = cctk.XYZFile.read_file("test/static/solvated_tetrahedral_TS.xyz").molecule
traj = presto.trajectory.EquilibrationTrajectory(
    timestep=0.5,
    atomic_numbers=start.atomic_numbers,
    high_atoms=np.array([]),
    inactive_atoms=np.array([1,7,8]),
    calculator=presto.calculators.XTBCalculator(),
    integrator=presto.integrators.VelocityVerletIntegrator(),
    bath_scheduler=boring_scheduler,
    stop_time = 200,
)

print(datetime.now())
traj.run(checkpoint_filename="test/static/tet_equil.chk", checkpoint_interval=10, positions=start.geometry)
print(datetime.now())
print(f"{len(traj.frames)} frames run")

temps = [f.temperature() for f in traj.frames][10:]
energies = [f.energy for f in traj.frames][10:-1]

print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")

#traj.write_movie("test/static/tet_equil.pdb")

print("done equil")

def termination(frame):
    mol = frame.molecule().assign_connectivity()
    if mol.get_bond_order(1,7):
        return True
    if mol.get_bond_order(1,8):
        return True
    return False

f_run, r_run = traj.spawn(termination, 250, "test/static/tet_run_f.chk", "test/static/tet_run_r.chk")

print("\nrunning forward trajectory")
print(datetime.now())
f_run.run(checkpoint_interval=10)
print(datetime.now())
print(f"{len(f_run.frames)} frames run")

print("\nrunning reverse trajectory")
print(datetime.now())
r_run.run(checkpoint_interval=10)
print(datetime.now())
print(f"{len(r_run.frames)} frames run")

full = presto.trajectory.join(f_run, r_run)

print(f"{len(full.frames)} run in total")
full.write_movie("test/static/tetrahedral_movie.mol2")
