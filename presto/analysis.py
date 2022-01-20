import numpy as np
import cctk, math
import matplotlib.pyplot as plt

import presto

def autocorrelation_time(values, timestep):
    """
    Computes autocorrelation time of a list of values, per instructions from https://sites.engineering.ucsb.edu/~shell/che210d/Computing_properties.pdf.

    Args:
        values (list-like): list of the values under study
        timestep (float): ∆t between adjacent times
    """
    # we cannot determine variance of <10 samples
    max_block_length = int(len(values)/10)

    lengths = list(range(1, max_block_length))
    variances = [0 for l in lengths]

    for i, N in enumerate(lengths):
        current_idx = 0
        block_averages = []
        while current_idx < len(values):
            block_averages.append(np.average(values[current_idx:current_idx+N]))
            current_idx += N
        variances[i] = np.var(block_averages)

    X = np.array([variances[0]/t for t in lengths])
    Y = np.array(variances)

    slope, intercept = np.polyfit(X, Y, 1)
    return slope/2 * timestep

def radial_distribution(frames, indices, cutoff=10, center_cutoff=5, resolution=0.025):
    """
    Args:
        frames (list of presto.Frame):
        indices (list): list of indices to analyze from each frame
        cutoff (float): max distance to examine
        center_cutoff (float): max distance from center for starting atoms)
        resolution (float): bin size

    Returns:
        list of counts at each point divided by volume
        list of shell radii
    """

    assert (100 * cutoff) % (100 * resolution) == 0, "cutoff must be a multiple of resolution!"
    #### floating point accuracy issues

    count = 0
    frame_count = 0
    total_hist = np.zeros(shape=int(cutoff/resolution))

    radii = np.arange(0, cutoff, resolution)

    for frame in frames:
        if frame_count % 100 == 0:
            print(f"new frame! (#{frame_count}) {count} counts")
        frame_count += 1

        positions = frame.positions[indices].view(np.ndarray)
        for x1 in positions:
            if np.linalg.norm(x1 > 5):
                continue
            for x2 in positions:
                if np.array_equal(x1, x2):
                    continue
                distance = np.linalg.norm(x1 - x2)
                print(f"observed distance {distance}")

                count += 1
                index = int(distance/resolution)
                if index < len(total_hist):
                    print(f"assigning index {index} and radius {radii[index]}")
                    total_hist[index] += 1

    volumes_per_shell = 4/3 * math.pi * (np.power(radii + resolution, 3) - np.power(radii, 3))

    vol_correction = frame.volume() / volumes_per_shell

    g = total_hist * vol_correction / (frame_count * 0.5 * len(indices) * (len(indices) - 1))
    return g, radii
