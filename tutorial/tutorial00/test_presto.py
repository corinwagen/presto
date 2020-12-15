import sys
sys.path.insert(0, "../../")

import logging, presto
logging.basicConfig(level=logging.INFO, filename=f"test.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')


traj = presto.config.build("test.yaml", "test.chk", geometry="benzene.xyz")
traj.reporters = [presto.reporters.TimingReporter()]
print("Built trajectory...")
traj.run(checkpoint_interval=25)
print("Trajectory finished!")
