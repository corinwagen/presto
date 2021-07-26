# presto/scripts/remd_demux.py
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
    parser.add_argument("--frames", "-t", type=int, default=-1,
                        help="length of run the beginning (in fs) to demux and analyze")

    args = vars(parser.parse_args(sys.argv[1:]))
    chkfile = args["checkpoint_filename"]

    remd = presto.replica_exchange.ReplicaExchangeParallel.load(chkfile)
    # assert remd.finished, "REMD run from this checkpoint file is unfinished!"
    if not remd.finished:
        remd.update_trajs()  # load each traj from chkfile and add 1 to current index
        remd.exchange()  # pass self.current_idx * self.swap_interval as current time

    trajs = remd.trajectories
    swap_int = int(remd.swap_interval)
    run_time = int(remd.current_idx * remd.swap_interval) # frames that have been run, in fs

    assert trajs[0].last_time_run() == run_time, "End time recorded in trajectory checkpoint file does not agree with end time recorded in REMD checkpoint file."

    if args['frames'] == -1: # all frames
        end_time = run_time
    else:
        end_time = args['frames']
        assert end_time <= run_time, f"Only {run_time} fs have been run, but {end_time} fs requested"
        assert end_time % swap_int == 0, f"Requested length must be multiple of swap interval ({swap_int} fs)."

    # list of lists of temp history
    traj_hists = np.zeros((len(trajs), int(run_time/swap_int) + 1), dtype=int)
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
    
    #account for any final intervals without swaps
    while curr_time <= run_time:
        traj_hists[:, int(curr_time/swap_int)] = curr_arrangement
        
        if curr_time != run_time:
            curr_time += swap_int
        else:
            break
    
    logger.info(f"{run_time} fs have been run, {end_time} fs will be demuxed, and the swap interval is {swap_int} fs.")
    assert curr_time/swap_int == traj_hists.shape[1] - 1  # last column

    demux_hists = np.zeros((len(trajs), int(run_time/swap_int) + 1), dtype=int) # same shape as traj_hists
    
    # actually demuxing
    for i,j in np.ndindex(traj_hists.shape):
        demux_hists[traj_hists[i,j], j] = i    

    demux_trajs = copy.deepcopy(trajs)
    for traj in demux_trajs:
        traj.frames = []  # empty frames, to be filled in demuxed order

    n_frames = int(end_time / int(trajs[0].timestep * trajs[0].save_interval)) + 1 # make sure traj.timestep is needed
    # include zeroth frame

    print("loading trajectories...")
    for traj in tqdm(trajs):
        traj.load_from_checkpoint(frames=slice(0, n_frames, 1))
        assert len(
            traj.frames) == n_frames, "expected number of frames should be equal to number of frames in trajectory"

    #hist = np.repeat(hist, swap_int / traj.save_interval)


    print("demuxing trajectories...")
    for i, hist in tqdm(enumerate(demux_hists)):  # each trajectory
        for j in np.arange(n_frames, dtype=int): # each timestep
            demux_trajs[i].frames.append(trajs[demux_hists[i, int(j/swap_int)]].frames[j])

    print("writing demuxed trajectories to PDB and .chk files:")
    for i, traj in tqdm(enumerate(demux_trajs)):
        traj.checkpoint_filename = f"replica{i}.chk"
        pdb_filename = f'replica{i}.pdb'
        traj.write_movie(pdb_filename)
        logger.info(f"Wrote movie to {pdb_filename}.")

        traj.save()

    times = np.arange(0, end_time + 1, swap_int)
    
    print("writing temperature evolutions to CSV files...")
    for i, hist in tqdm(enumerate(demux_hists)):
        #time_hist = np.array([times, hist[:n_frames]]).astype(int)
        time_hist = np.stack((times, hist[:len(times)])).astype(int)

        csv_filename = f"replica{i}.csv"
        np.savetxt(csv_filename, time_hist.transpose(), delimiter=',', header='tim  e(fs), temperature index')
        logger.info(f"Wrote temperature evolution to {csv_filename}")

