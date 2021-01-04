import sys, os
import presto, logging, re

name = sys.argv[1]

try:
    traj = presto.config.build(f"{name}.yaml", f"{name}.chk")
    logging.basicConfig(level=logging.INFO, filename=f"{name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
    traj.run(checkpoint_interval=100)
    sys.exit(0)

except Exception as e:
    print(e)
    sys.exit(1)
