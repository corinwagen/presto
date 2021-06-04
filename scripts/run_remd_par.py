# presto/scripts/run_remd_par.py
# Marcus Sak, Jun 2021
# Manager script to run slurm-parallelized remd

import argparse
import logging
import os
import sys
import numpy as np
import presto
import dill
import subprocess

logging.basicConfig(level=logging.INFO, filename=f"remd_par.log", filemode='a',
                    format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

logger = logging.getLogger(__name__)


def sbatch_self(slurm_script, dependency):
    with open(slurm_script, 'r') as f:
        source = f.read().splitlines()  # no newline in source

    with open(slurm_script, 'w') as f:
        for line in source:
            if "python" in line and "--spawn" not in line:
                line += " --spawn"
            f.write(line+'\n')

    try:
        subprocess.run(
            ['sbatch', f'--dependency=afterok:{dependency}', slurm_script])
        logger.info(f"Self-spawned with dependency on slurm job array {dependency}")
    except subprocess.CalledProcessError as e:
        logger.error("Could not submit slurm script")
        sys.exit(1)


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        prog="run_remd_par.py", description="Runs replica exchange MD for accelerated sampling of conformational space. Outputs chkfiles for all trajectories. Run > python replica_exchange_mpi.py --help for options.")
    parser.add_argument("--checkpoint_filename", type=str, default="remd.chk",
                        help="path to checkpoint file (usually ends in .chk)")
    parser.add_argument("--input", default=None, type=str,
                        help="path of input geometry (.xyz)")
    parser.add_argument("--template", "-t", type=str, default="template.yaml",
                        help="path to template file (usually ends in .yaml)")
    parser.add_argument("--mintemp", "-a", default=100,
                        type=int, help="minimum trajectory temperature (K)")
    parser.add_argument("--maxtemp", "-z", default=800,
                        type=int, help="maximum trajectory temperature (K)")
    parser.add_argument("--trajs", "-n", default=8, type=int,
                        help="number of trajectories (equal to slurm --ntasks)")
    parser.add_argument("--swap", "-s", default=50, type=int,
                        help="time interval between swaps (fs)")
    parser.add_argument('--spawn', action='store_true',
                        help="add this flag when recursively called from run_remd_par.py")

    args = vars(parser.parse_args(sys.argv[1:]))
    chkfile = args["checkpoint_filename"]

    if not args["spawn"]:  # new remd run
        all_trajs = []
        temps = np.geomspace(
            args["mintemp"], args["maxtemp"], num=args["trajs"])
        for temp in temps:
            name = f"{int(temp)}k"
            with open(args["template"], 'r') as file:
                filedata = file.read()
            filedata = filedata.replace("<TEMP>", f"{temp:.2f}")
            with open(f"{name}.yaml", 'w') as file:
                file.write(filedata)
            traj = presto.config.build(
                f"{name}.yaml", f"{name}.chk", geometry=args["input"])
            all_trajs.append(traj)
        remd = presto.replica_exchange_par.ReplicaExchange(trajectories=all_trajs, checkpoint_filename=args["checkpoint_filename"],
                                                            swap_interval=args["swap"])
    else:
        try:
            with (open(chkfile, "rb")) as f:
                remd = dill.load(f)
        except FileNotFoundError:
            print("checkpoint file not found, do not call this script with --spawn on the first instance")
        logger.info(f"Loaded ReplicaExchange from {chkfile}.")
        remd.update_trajs()  # load each traj from chkfile and add 1 to current index
        remd.exchange()  # pass self.current_idx * self.swap_interval as current time
        # exchannge will save trajectories into chkfile
        if remd.finished:
            with (open(args["checkpoint_filename"], "wb")) as f:
                dill.dump(remd, f)
            logger.info(f"Replica exchange completed, saved ReplicaExchange to {chkfile}.")
            print(remd.report())
            sys.exit(0)
        

    with (open(args["checkpoint_filename"], "wb")) as f:
        dill.dump(remd, f, protocol=-1) # HIGHEST_PROTOCOL
    logger.info(f"Saved ReplicaExchange to {chkfile}.")
    trajs_slurm_job_id = remd.run()  # nonblocking, needs to return slurm jobID of submitted array

    slurm_script = f'remd_{os.path.splitext(args["input"])[0]}.sh'
    sbatch_self(slurm_script, trajs_slurm_job_id)
    sys.exit(0)
