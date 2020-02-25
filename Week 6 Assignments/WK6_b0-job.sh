#!/bin/bash

#SBATCH --time=26:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

#CREATING DERIVATIVE FOLDER
for s in $(ls ~/compute/psych516/Data/BIDS/EDSD/); do
mkdir -p ~/compute/psych516/Data/BIDS/EDSD/${s}/dwi/derivative 
done

#GRABBING SUBJECT DIRECTORIES 
SUBJ_DIR=~/compute/psych516/Data/BIDS/EDSD/
for SUB in *; do
mkdir derivative
cd ${SUB}/dwi

#CREATING SYMLINK FOR IMAGES
ln -s ${SUBJ_DIR}${SUB}/dwi/${SUB}_dwi.nii dwi.nii.gz

ln -s ${SUBJ_DIR}${SUB}/dwi/${SUB}_dwi.bval dwi.bval

ln -s ${SUBJ_DIR}${SUB}/dwi/${SUB}_dwi.bvec dwi.bvec

#B0 EXTRACTION AND BRAIN MASK
fslroi dwi.nii.gz dwi_b0.nii.gz 0 1
bet dwi_b0.nii.gz dwi_b0 -f 0.1 -g 0 -m -n
done
