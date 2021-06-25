# presto/scripts/remd_par_manager.py
# Marcus Sak, Jun 2021
# Script to demux remd replicas

import argparse
import sys
import numpy as np
import presto
import logging
import copy
from tqdm import tqdm

logging.basicConfig(level=logging.INFO, filename=f"demux.log", filemode='a',
                    format='%(asctime)s %(name)-12s  %(message)s', datefmt='%m-%d %H:%M')

logger = logging.getLogger(__name__)


def exchange(array, i, j):
    array[[i, j]] = array[[j, i]]


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        prog="remd_demux.py", description="Given a REMD run, reconstructs the continuous trajectories of each replica and outputs trajectory checkfiles and the temperature evolution for each replica. Run $ python remd_demux.py --help for options.")
    parser.add_argument("--checkpoint_filename", "-c", type=str, default="remd.chk",
                        help="path to checkpoint file (usually ends in .chk)")

    args = vars(parser.parse_args(sys.argv[1:]))
    chkfile = args["checkpoint_filename"]

    remd = presto.replica_exchange_par.ReplicaExchange.load(chkfile)
    # assert remd.finished, "REMD run from this checkpoint file is unfinished!"
    if not remd.finished:
        remd.update_trajs()  # load each traj from chkfile and add 1 to current index
        remd.exchange()  # pass self.current_idx * self.swap_interval as current time

    trajs = remd.trajectories
    swap_int = int(remd.swap_interval)
    end_time = int(remd.current_idx * remd.swap_interval)
    assert trajs[0].last_time_run() == end_time, "End time recorded in trajectory checkpoint file does not agree with end time recorded in REMD checkpoint file."

    # list of lists of temp history
    traj_hists = np.zeros(
        (len(trajs), int(end_time/swap_int) + 1), dtype=int)
    # add 1 to shape[1] if we don't want to ignore the last swap

    for i, hist in enumerate(traj_hists):
        hist[0] = i  # starting arrangement

    curr_time = 0
    curr_arrangement = np.arange(len(trajs)) # one col of traj_hists

    for i, swap in enumerate(remd.swaps):
        while int(swap["time"]) != curr_time:
            # finished swapping or no swaps for this time, write final arrangement for curr_time
            traj_hists[:, int(curr_time/swap_int)] = curr_arrangement
            curr_time += swap_int
        exchange(curr_arrangement, swap["i"], swap["j"])

    # we ignore the final swap
    print(f"{curr_time} fs have been run, and the swap interval is {swap_int} fs.")
    assert curr_time/swap_int == traj_hists.shape[1] - 1  # last column
    traj_hists[:, int(curr_time/swap_int)] = curr_arrangement  # do the final one
    
    demux_trajs = copy.deepcopy(trajs)
    for traj in demux_trajs:
        traj.frames = []  # empty frames, to be filled in demuxed order

    n_frames = (traj_hists.shape[1] - 1) * swap_int / int(traj.save_interval) + 1 
    # include zeroth frame

    print("loading trajectories...")
    for traj in tqdm(trajs):
        traj.load_from_checkpoint()  # loads every frame
        assert len(
            traj.frames) == n_frames, "expected number of frames should be equal to number of frames in trajectory"

    #hist = np.repeat(hist, swap_int / traj.save_interval)

    print("demuxing trajectories...")
    for i, hist in tqdm(enumerate(traj_hists)):  # each replica
        for j in np.arange(n_frames, dtype=int): # each timestep
            demux_trajs[i].frames.append(trajs[traj_hists[i, int(j/swap_int)]].frames[j])

    print("writing demuxed trajectories to pdb files...")
    for i, traj in tqdm(enumerate(demux_trajs)):
        traj.checkpoint_filename = traj.checkpoint_filename.replace('.chk', '_demux.chk')
        pdb_filename = f'traj{i}.pdb'
        traj.write_movie(pdb_filename)
        logger.info(f"Wrote movie to {pdb_filename}.")

        traj.save()

    times = np.arange(0, end_time + 1, swap_int)
    assert traj_hists.shape[1] == times.size, "length of time array should be the same as number of swaps"

    print("writing temperature evolutions to csv files...")
    for i, hist in tqdm(enumerate(traj_hists)):
        time_hist = np.array([times, hist]).astype(int)
        csv_filename = f"traj{i}.csv"
        np.savetxt(csv_filename, time_hist.transpose(), delimiter=',', header='time(fs), temperature index')
        logger.info(f"Wrote temperature evolution to {csv_filename}")

