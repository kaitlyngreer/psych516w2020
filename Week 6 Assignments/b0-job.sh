#!/bin/bash

#SBATCH --time=00:15:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

SUBJID=ls ~/compute/psych516/Data/derivative/EDSD/pT1

#LOAD ENVIRONMENTAL VARIABLES
~/research_bin/FSL/bin/

#CREATE DERIVATIVE DIRECTORY
mkdir -p ~/compute/psych516/Data/derivative/EDSD/pDWI/${SUBJID}

#SYMLINK VARIABLES
ln -s ~/compute/psych516/Data/BIDS/EDSD/${SUBJID}/dwi/${SUBJID}_dwi.nii ~/compute/psych516/Data/derivative/EDSD/pDWI/${SUBJID}/dwi.nii.gz

ln -s ~/compute/psych516/Data/BIDS/EDSD/${SUBJID}/dwi/${SUBJID}_dwi.bval ~/compute/psych516/Data/derivative/EDSD/pDWI/${SUBJID}/dwi.bval

ln -s ~/compute/psych516/Data/BIDS/EDSD/${SUBJID}/dwi/${SUBJID}_dwi.bvec ~/compute/psych516/Data/derivative/EDSD/pDWI/${SUBJID}/dwi.bvec

#B0 EXTRACTION AND BRAIN MASK
cd ~/compute/psych516/Data/derivative/EDSD/pDWI/${SUBJID}

fslroi dwi.nii.gz dwi_b0.nii.gz 0 1

bet dwi_b0.nii.gz dwi_b0 -f 0.1 -g 0 -m -n