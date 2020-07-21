import sys
sys.path.append("/n/home03/cwagen/Jacobsen/presto/")

import presto, logging

yaml_name = sys.argv[1]
chk_name = sys.argv[2]
#traj = presto.config.build("../reaction.yaml", chk_name)
traj = presto.config.build(yaml_name, chk_name)

logging.basicConfig(level=logging.INFO, filename=f"{chk_name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
traj.run(checkpoint_interval=25)

sys.exit(0)
