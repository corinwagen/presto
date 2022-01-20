# 🎩 presto

*python-based reactions in explicit solvent with trajectories via ONIOM*

[![PyPI version](https://badge.fury.io/py/presto-md.svg)](https://pypi.python.org/pypi/presto-md/)
[![Downloads](https://img.shields.io/pypi/dm/presto-md.svg)](https://pypi.python.org/pypi/presto-md/)
[![Build Status](https://app.travis-ci.com/corinwagen/presto.svg?branch=master)](https://app.travis-ci.com/corinwagen/presto)
[![Coverage Status](https://coveralls.io/repos/github/corinwagen/presto/badge.svg?branch=master)](https://coveralls.io/github/corinwagen/presto?branch=master)

## Introduction

*presto* is a Python 3-based package that runs QM/QM' molecular dynamics simulations of small organic molecules in spheres of explicit solvent (50-250 solvent molecules). *presto* is loosely based on Singleton’s *PROGDYN*, as described in recent publications on the [nitration of toluene](https://pubs.acs.org/doi/10.1021/jacs.6b07328) and [hydrochlorination of dienes](https://pubs.acs.org/doi/10.1021/jacs.0c06295). 

For more details, see [the website](https://corinwagen.github.io/presto/public/index.html).

**IMPORTANT:**
*presto* is currently in "alpha": testing is ongoing and no guarantees as to correctness or API consistency can be made at this time. 
As of Summer 2021 the package works, but bugs are certainly present in a project of this size.
If you are interesting in using *presto* or contributing as a developer, please let me know!

## Further Reading

[**Details**](DETAILS.md) — further documentation for specific *presto* features, such as automatic solvation

[**Physical Validation**](VALIDATION.md) — tests of *presto*'s performance in the *NVT* or *NVE* ensembles

[**Config Files**](CONFIG.md) — anatomy of ``.yaml`` config files

## License

This project is licensed under the GNU General Public License, Version 3.0. Please see `LICENSE` for full terms and conditions.

*Copyright 2021 by Corin Wagen*
