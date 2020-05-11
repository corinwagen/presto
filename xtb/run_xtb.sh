#!/bin/bash

# script to run xtb
#
# usage:
# ./run_xtb.sh unique_id charge unpaired gfn parallel_threads xtb_path
#
# charge:              total charge of this molecule
# unpaired:            unpaired electrons (0=singlet, 1=doublet, ...)
# gfn:                 whether to use xtb-GFN0 (0) or xtb-GFN2 (2)
# parallel_threads:    how many processors to use
# xtb_path:            the xtb home directory where the GFN parameters are
#
# {unique_id}.xyz will be run in a folder called unique_id
# presto will delete this folder when finished
#
# if there are any errors, the script will terminate with error code 1
#
# to get fancier behaviors, modify this script, ensuring the the
# output file ends up in the unique_id folder

# get command line parameters
unique_id=${1}
charge=${2}
unpaired=${3}
gfn=${4}
parallel=${5}
xtb_path=${6}

# set XTBPATH
if [ ! -d ${xtb_path} ]; then
    echo Error: xtb directory ${xtb_path} not found.
    exit 1
fi
export XTBPATH=${xtb_path}

# if folder exists, quit with error
if [ -d ${unique_id} ]; then
	echo Error: directory ${unique_id} already exists.
    exit 1
fi

# ensure input file exists
if [ ! -f ${unique_id}.xyz ]; then
    echo Error: input file ${unique_id}.xyz not found.
    exit 1
fi

# create job directory and put input file in it
mkdir ${unique_id}
mv ${unique_id}.xyz ${unique_id}
cd ${unique_id}

# run job
echo XTBPATH/XTBHOME is $XTBPATH
echo
echo xtb refers to:
which xtb
echo
echo Current directory is:
pwd
ls
echo Starting job...
echo xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --parallel ${parallel} --grad ${unique_id}.xyz    ${unique_id}.out
xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --parallel ${parallel} --grad ${unique_id}.xyz &> ${unique_id}.out
echo Job finished.

