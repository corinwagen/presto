import sys
sys.path.append("/n/home03/cwagen/Jacobsen/presto/")

import presto, logging

yaml_name = sys.argv[1]
chk_name = sys.argv[2]

try:
    traj = None
    if len(sys.argv) == 4:
        traj = presto.config.build(yaml_name, chk_name, oldchk=sys.argv[3])
    else:    
        traj = presto.config.build(yaml_name, chk_name)

    logging.basicConfig(level=logging.INFO, filename=f"{chk_name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
    traj.run(checkpoint_interval=25)

    sys.exit(0)

except Exception as e:
    print(e)
    sys.exit(1)
