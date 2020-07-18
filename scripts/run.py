import sys
sys.path.append("/n/home03/cwagen/Jacobsen/presto/")

import presto, logging

chk_name = sys.argv[1]
traj = presto.config.build("../reaction.yaml", chk_name)

logging.basicConfig(level=logging.INFO, filename=f"{chk_name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
traj.run(checkpoint_interval=25)
