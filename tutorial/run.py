import sys
sys.path.append("/n/home03/cwagen/Jacobsen/presto/")
import presto, logging, re

try:
    traj = presto.config.build("preequil.yaml", "preequil.chk", geometry="solvated.xyz")
    logging.basicConfig(level=logging.INFO, filename=f"preequil.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
    traj.run(checkpoint_interval=25)

    traj = presto.config.build("equil.yaml", "equil.chk", oldchk="preequil.chk")
    logging.basicConfig(level=logging.INFO, filename=f"equil.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
    traj.run(checkpoint_interval=25)

    sys.exit(0)

except Exception as e:
    print(e)
    sys.exit(1)
