import logging, re, sys, os
logging.basicConfig(level=logging.INFO, filename=f"remd.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
import numpy as np
import presto

logger = logging.getLogger(__name__)

for n_trajs in [2]:

    try:
        logger.info(f"\n{n_trajs} trajectories:\n----------------------------\n")
        trajs = []
        for temp in np.geomspace(300, 400, num=n_trajs):
            name = f"{int(temp)}k"

            with open("template.yaml", 'r') as file :
                filedata = file.read()
            filedata = filedata.replace("<TEMP>", f"{temp:.2f}")
            with open(f"{name}.yaml", 'w') as file:
                file.write(filedata)
            traj = presto.config.build(f"{name}.yaml", f"{name}.chk", geometry="dce.xyz")
            trajs.append(traj)

        remd = presto.replica_exchange.ReplicaExchange(trajectories=trajs, swap_interval=50, checkpoint_filename="remd.chk")
        remd.run()
        print(remd.report())

        for temp in np.geomspace(300, 400, num=n_trajs):
            name = f"{int(temp)}k"
            os.remove(f"{name}.yaml")
            os.remove(f"{name}.chk")
            
        os.rename("./remd.chk", f"./remd_{n_trajs}.chk")
            
    except Exception as e:
        print(e)
        sys.exit(1)
