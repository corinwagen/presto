import presto, sys, logging, re

name = sys.argv[1]
logging.basicConfig(level=logging.INFO, filename=f"{name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

traj = presto.config.build("traj.yaml", f"{name}.chk")
traj.time_after_finished = 25

if not traj.finished:
    traj.run(checkpoint_interval=5)

