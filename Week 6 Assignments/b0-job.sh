#!/bin/bash

#SBATCH --time=00:15:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

#LOAD ENVIRONMENTAL VARIABLES
~/research_bin/FSL/bin/

#CREATE DERIVATIVE DIRECTORY
mkdir -p ~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/

#SYMLINK VARIABLES
ln -s ~/compute/psych516/Data/BIDS/EDSD/${1}/dwi/${1}_dwi.nii ~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/dwi.nii.gz

ln -s ~/compute/psych516/Data/BIDS/EDSD/${1}/dwi/${1}_dwi.bval ~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/dwi.bval

ln -s ~/compute/psych516/Data/BIDS/EDSD/${1}/dwi/${1}_dwi.bvec ~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/dwi.bvec

#B0 EXTRACTION AND BRAIN MASK
workdir=~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/

fslroi ${workdir}/dwi.nii.gz ${workdir}/dwi_b0.nii.gz 0 1

bet ${workdir}/dwi_b0.nii.gz ${workdir}/dwi_b0 -f 0.1 -g 0 -m -n