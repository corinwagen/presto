import sys, os
sys.path.append("/n/jacobsen_lab/cwagen/presto/")
import presto, logging, re

name = sys.argv[1]

traj = presto.config.build(f"../rxn.yaml", f"{name}.chk")
#logging.basicConfig(level=logging.INFO, filename=f"{name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
#traj.run(checkpoint_interval=100)
print(traj.termination_function(traj.frames[0]))
sys.exit(0)

