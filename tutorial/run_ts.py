import sys, logging
logging.basicConfig(level=logging.INFO, filename=f"pre-ts.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
sys.path.append("/n/jacobsen_lab/cwagen/presto/")
import presto, re

try:
    traj = presto.config.build("pre-ts.yaml", "pre-ts.chk", oldchk="equil.chk")
    traj.run(checkpoint_interval=25)

    sys.exit(0)

except Exception as e:
    print(e)
    sys.exit(1)
