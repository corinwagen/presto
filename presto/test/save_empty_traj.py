import presto

traj = presto.config.build("300k.yaml", checkpoint="300k.chk", geometry="dce.xyz")
traj.save()

traj2 = presto.trajectory.Trajectory.new_from_checkpoint("300k.chk", -1)
