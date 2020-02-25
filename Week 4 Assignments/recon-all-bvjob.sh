#!/bin/bash

#SBATCH --time=26:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

# LOAD ENVIRONMENTAL VARIABLES
export FREESURFER_HOME=/fslhome/kgreer3/apps/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# INSERT CODE, AND RUN YOUR PROGRAMS HERE
cd ~/compute/psych516/Data/derivative/EDSD/pT1/${1}/

~/apps/freesurfer/bin/recon-all \
-subjid ${1} \
-i ~/compute/pscyh516/Data/derivative/EDSD/pT1/${1}/${1}_T1w.nii.gz \
-wsatlas \
-all \
-bigventricles \
-sd ~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD/