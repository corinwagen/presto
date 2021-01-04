PGFIO/stdio: Invalid argument
PGFIO-F-/formatted write/unit=11/error code returned by host stdio - 22.
 File name = /scratch/Gau-25532.inp    formatted, sequential access   record = 0
 In source file ml0.f, at line number 213
warning: initial DIIS convergence failed, trying quadradic convergence
Process Process-11773:
Traceback (most recent call last):
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/multiprocessing/process.py", line 297, in _bootstrap
    self.run()
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/multiprocessing/process.py", line 99, in run
    self._target(*self._args, **self._kwargs)
  File "/n/home03/cwagen/.conda/envs/openmm/lib/python3.7/site-packages/presto/calculators.py", line 378, in evaluate
    energy += e
TypeError: unsupported operand type(s) for +: 'NoneType' and 'float'
