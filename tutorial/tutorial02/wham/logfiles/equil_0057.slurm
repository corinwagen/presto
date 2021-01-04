mkdir: cannot create directory ‘/scratch/cwagen-gaussian’: File exists
mkdir: cannot create directory ‘/scratch/cwagen-xtb’: File exists
fname=/scratch/Gau-51123.rwf fd = -1

open-new-file: Permission denied
warning: initial DIIS convergence failed, trying quadradic convergence
Process Process-2278:
Traceback (most recent call last):
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/multiprocessing/process.py", line 297, in _bootstrap
    self.run()
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/multiprocessing/process.py", line 99, in run
    self._target(*self._args, **self._kwargs)
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/site-packages/presto/calculators.py", line 378, in evaluate
    energy += e
TypeError: unsupported operand type(s) for +: 'NoneType' and 'float'
