import unittest, cctk, logging
import numpy as np
from datetime import datetime

import sys
sys.path.append('../presto')
import presto

logging.basicConfig(level=logging.INFO, filename="nazarov.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M', filemode="w")

def boring_scheduler(time):
    return 220

start = cctk.XYZFile.read_file("test/static/nazarov-elim-solvated.xyz").molecule
traj = presto.trajectory.EquilibrationTrajectory(
    timestep=0.5,
    atomic_numbers=start.atomic_numbers,
    high_atoms=np.array([]),
    inactive_atoms=np.array(list(range(1,126))),
    calculator=presto.calculators.XTBCalculator(),
    integrator=presto.integrators.VelocityVerletIntegrator(),
    bath_scheduler=boring_scheduler,
    stop_time = 200,
)

print(datetime.now())
traj.run(checkpoint_filename="test/static/naz_equil.chk", checkpoint_interval=10, positions=start.geometry)
print(datetime.now())
print(f"{len(traj.frames)} frames run")

traj.stop_time = 400
traj.set_inactive_atoms([2,48,51])

print(datetime.now())
traj.run(checkpoint_filename="test/static/naz_equil.chk", checkpoint_interval=10, positions=start.geometry)
print(datetime.now())
print(f"{len(traj.frames)} frames run")

temps = [f.temperature() for f in traj.frames][200:]
energies = [f.energy for f in traj.frames][200:-1]

print(f"TEMPERATURE:\t\t{np.mean(temps):.2f} (± {np.std(temps):.2f})")
print(f"ENERGY:\t\t\t{np.mean(energies):.2f} (± {np.std(energies)*627.509:.2f} kcal/mol)")

#traj.write_movie("test/static/tet_equil.pdb")

print("done equil")

def termination(frame):
    mol = frame.molecule().assign_connectivity()
    if mol.get_bond_order(2,48):
        return True
    if mol.get_bond_order(4,48):
        return True
    return False

f_run, r_run = traj.spawn(termination, 250, "test/static/naz_run_f.chk", "test/static/naz_run_r.chk")

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
full.write_movie("test/static/nazarov_movie.pdb")
