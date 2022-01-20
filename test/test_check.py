import cctk, os, pytest
import numpy as np

import sys
sys.path.append('../presto')
import presto

def gen_test_traj():
    calc = presto.calculators.XTBCalculator(potential=presto.potentials.SphericalHarmonicPotential(radius=10))
    traj = presto.trajectory.Trajectory(
        timestep=0.5,
        atomic_numbers=cctk.OneIndexedArray([1,1]),
        high_atoms=np.array([]),
        active_atoms=np.array([1,2]),
        calculator=presto.calculators.XTBCalculator(potential=presto.potentials.SphericalHarmonicPotential(radius=10)),
        integrator=presto.integrators.VelocityVerletIntegrator(),
        stop_time=10000,
    )

    p1 = cctk.OneIndexedArray([[12,0,0],[11.5,0,0]])
    p2 = cctk.OneIndexedArray([[12,0,0],[10,0,0]])
    v = cctk.OneIndexedArray([[2,0,0],[0,0,0]])
    a = cctk.OneIndexedArray([[0,0,0],[0,0,0]])
    frame1 = presto.frame.Frame(traj, p1, v, a)
    frame2 = presto.frame.Frame(traj, p2, v, a)
    traj.frames = [frame1, frame2]
    assert isinstance(traj, presto.trajectory.Trajectory)
    assert isinstance(frame1, presto.frame.Frame)
    assert isinstance(frame2, presto.frame.Frame)
    return traj

def test_radius_check():
    check = presto.checks.RadiusCheck(radius=10)
    traj = gen_test_traj()
    with pytest.raises(AssertionError):
        check.check(traj.frames[-1])

def test_velocity_check():
    check = presto.checks.VelocityCheck()
    traj = gen_test_traj()
    with pytest.raises(AssertionError):
        check.check(traj.frames[-1])

def test_topology_check():
    check = presto.checks.TopologyCheck(interval=1)
    traj = gen_test_traj()
    with pytest.raises(AssertionError):
        check.check(traj.frames[-1])
