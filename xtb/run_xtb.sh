#!/bin/bash

# script to run xtb
#
# usage:
# ./run_xtb.sh unique_id charge unpaired gfn parallel_threads xtb_path
#
# charge:              total charge of this molecule
# unpaired:            unpaired electrons (0=singlet, 1=doublet, ...)
# gfn:                 whether to use xtb-GFN0 (0) or xtb-GFN2 (2) or xtb-GFNFF ("ff")
# parallel_threads:    how many processors to use
# xtb_path:            the xtb home directory where the GFN parameters are
# topology:            topology file for GFNFF
# xcontrol:            xcontrol file for xtb
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
top_path=${7}
xcontrol=${8}

# set XTBPATH
if [ ! -d ${xtb_path} ]; then
    echo Error: xtb directory ${xtb_path} not found.
    exit 1
fi
export XTBPATH=${xtb_path}
export XTBHOME=${xtb_path}

# setup parallelism
# assumes openmp is available
if [ ${parallel} -gt 1 ]; then
    export OMP_STACKSIZE=4G
    export OMP_NUM_THREADS=${parallel},1
    export OMP_MAX_ACTIVE_LEVELS=1
    export MKL_NUM_THREADS=${parallel}
fi

ulimit -s unlimited

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

# copy topology file
if [ -f ${top_path} ]; then
    cp ${top_path} ${unique_id}/gfnff_topo
fi

cd ${unique_id}

# run job
echo XTBPATH is $XTBPATH
echo XTBHOME is $XTBHOME
echo
echo xtb refers to:
which xtb
echo
echo Current directory is:
pwd
ls
echo Starting job...
if [ ${parallel} -gt 1 ]; then
    if [ ${gfn} == ff ]; then
        if [ -z "$xcontrol" ]; then
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfnff --parallel ${parallel} --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfnff --parallel ${parallel} --grad ${unique_id}.xyz &> ${unique_id}.out
        else
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfnff --parallel ${parallel} --input ${xcontrol} --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfnff --parallel ${parallel} --input ${xcontrol} --grad ${unique_id}.xyz &> ${unique_id}.out
        fi
    else
        if [ -z "$xcontrol" ]; then
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --parallel ${parallel} --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --parallel ${parallel} --grad ${unique_id}.xyz &> ${unique_id}.out
        else
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --parallel ${parallel} --input ${xcontrol} --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --parallel ${parallel} --input ${xcontrol} --grad ${unique_id}.xyz &> ${unique_id}.out
        fi
    fi
else
    if [ ${gfn} == ff ]; then
        if [ -z "$xcontrol" ]; then
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfnff --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfnff --grad ${unique_id}.xyz &> ${unique_id}.out
        else
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfnff --input ${xcontrol} --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfnff --input ${xcontrol} --grad ${unique_id}.xyz &> ${unique_id}.out
        fi
    else
        if [ -z "$xcontrol" ]; then
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --grad ${unique_id}.xyz &> ${unique_id}.out
        else
            echo xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --input ${xcontrol} --grad ${unique_id}.xyz '&>' ${unique_id}.out
            xtb --chrg ${charge} --uhf ${unpaired} --gfn ${gfn} --input ${xcontrol} --grad ${unique_id}.xyz &> ${unique_id}.out
        fi
    fi
fi
echo Job finished.

# save topology file
if [ -f gfnff_topo ]; then
    cp gfnff_topo ../${top_path}
fi

