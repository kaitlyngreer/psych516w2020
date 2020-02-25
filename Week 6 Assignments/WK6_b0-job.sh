#!/bin/bash

#SBATCH --time=26:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

SUBJ_DIR=~/compute/psych516/Data/BIDS/EDSD/

# INSERT CODE, AND RUN YOUR PROGRAMS HERE
cd ${SUBJ_DIR}/

#DERIVATIVE
mkdir -p ${SUBJ_DIR}/${1}/derivative 

cd ${SUBJ_DIR}/${1}/dwi
#SYMLINK
ln -s ${1}_dwi.nii dwi.nii.gz

ln -s ${1}_dwi.bval dwi.bval

ln -s ${1}_dwi.bvec dwi.bvec

#B0 EXTRACTION AND BRAIN MASK
fslroi dwi.nii.gz dwi_b0.nii.gz 0 1 

bet dwi_b0.nii.gz dwi_b0 -f 0.1 -g 0 -m -n 


