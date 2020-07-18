import sys
sys.path.append("/n/home03/cwagen/Jacobsen/presto/")

import presto, argparse, os, logging, copy, subprocess

traj = None
run_name = sys.argv[1]
geometry = sys.argv[2]
solvent = sys.argv[3]
solv_num = int(sys.argv[4])

subprocess.call(['/bin/bash', '-c', f"source deactivate; source activate openmm; python /n/home03/cwagen/Jacobsen/presto/packmol/build_input.py -f ../{geometry} -o start.xyz -s {solvent} -n {solv_num}"])

chkname = f"{run_name}_preequil.chk"
if os.path.exists(chkname):
    traj = presto.config.build("../preequil.yaml", chkname)
else:
    traj = presto.config.build("../preequil.yaml", chkname, geometry="start.xyz")

logging.basicConfig(level=logging.INFO, filename=f"{run_name}.log", format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')
traj.run(checkpoint_interval=25)

chkname2 = f"{run_name}_equil.chk"
traj2 = presto.config.build("../equil.yaml", chkname2, oldchk=chkname)
traj2.run(checkpoint_interval=25)

