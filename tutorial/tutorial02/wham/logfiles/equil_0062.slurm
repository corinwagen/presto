Erroneous write. Write -1 instead of 54432.
fd = 4
orig len = 55224 left = 54432
g_write: No space left on device
warning: initial DIIS convergence failed, trying quadradic convergence
Process Process-6118:
Traceback (most recent call last):
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/multiprocessing/process.py", line 297, in _bootstrap
    self.run()
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/multiprocessing/process.py", line 99, in run
    self._target(*self._args, **self._kwargs)
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/site-packages/presto/calculators.py", line 378, in evaluate
    energy += e
TypeError: unsupported operand type(s) for +: 'NoneType' and 'float'
