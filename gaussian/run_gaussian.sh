#!/bin/bash

# script to run gaussian
#
# usage:
# ./run_gaussian.sh unique_id
#
# {unique_id}.gjf will be run in a folder called unique_id
# presto will delete this folder when 
#
# if there are any errors, the script will terminate with error code 1
#
# to get fancier behaviors, modify this script, ensuring the the
# output file ends up in the unique_id folder

# get command line parameters
unique_id=${1}

# if folder exists, quit with error
if [ -d ${unique_id} ]; then
	echo Error: directory ${unique_id} already exists.
    exit 1
fi

# ensure input file exists
if [ ! -f ${unique_id}.gjf ]; then
    echo Error: input file ${unique_id}.gjf not found.
    exit 1
fi

# create job directory and put input file in it
mkdir ${unique_id}
mv ${unique_id}.gjf ${unique_id}
cd ${unique_id}

# run job
echo Starting job...
g16 ${unique_id}.gjf ${unique_id}.out
echo Job finished normally.
