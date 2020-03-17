#!/bin/bash

#SBATCH --time=36:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

#LOAD ENVIRONMENTAL VARIABLES
#FSL
FSLDIR=/fslhome/kgreer3/research_bin/FSL
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh

#CD into Working Directory
cd ~/compute/psych516/Data/derivative/EDSD/tbss
tbss_2_reg -t ~/templates/ENIGMA/ENIGMA_DTI_FA.nii.gz