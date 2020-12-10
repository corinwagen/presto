import numpy as np
import cctk, math
import matplotlib.pyplot as plt

import presto

def autocorrelation(values):

    block_length = 1
    variance = 0

    return block_length, variance

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
