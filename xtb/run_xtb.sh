#!/bin/bash

# script to run xtb
#
# usage:
# ./run_gaussian.sh unique_id charge multiplicity
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
multiplicity=${3}

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
echo Starting job...
xtb --chrg ${charge} --uhf ${multiplicity} --grad ${unique_id}.xyz &> ${unique_id}.out
echo Job finished normally.

