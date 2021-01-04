import sys, presto, logging, re

traj = presto.config.build("preequil.yaml", "preequil.chk")
print(traj.active_atoms)

for idx, frame in enumerate(traj.frames[::100]):
    print(f"{idx}\t{frame.positions[1]}\t{frame.positions[11]}")
