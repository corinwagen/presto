import presto, sys, logging, re, h5py

# usage: python reverse.py chknames

chknames = sys.argv[1:]

for oldchkname in chknames:
    newchkname = re.sub("f", "r", oldchkname)
    newtraj = presto.config.build("traj_rev.yaml", newchkname, oldchk=oldchkname, oldchk_idx=0)

    with h5py.File(newchkname, "r+") as h5:
        h5.attrs['forwards'] = False


