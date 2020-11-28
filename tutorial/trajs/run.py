import sys, os, logging, re
name = sys.argv[1]
logging.basicConfig(level=logging.INFO, filename=f"{name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

sys.path.append("/n/jacobsen_lab/cwagen/presto/")
import presto

try:
    traj = presto.config.build(f"../rxn.yaml", f"{name}.chk")
    traj.run(checkpoint_interval=100)
    sys.exit(0)

except Exception as e:
    print(e)
    sys.exit(1)
