#!/bin/bash

#SBATCH --time=00:20:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core


#LOAD ENVIRONMENTAL VARIABLES
#FSL
FSLDIR=/fslhome/kgreer3/research_bin/FSL
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh

#Creating EPI B0 mask
workdir=~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/

fslroi ${workdir}/dwi_epi.nii.gz ${workdir}/dwi_epi_b0.nii.gz 0 1

bet ${workdir}/dwi_epi_b0.nii.gz ${workdir}/dwi_epi_b0 -f 0.5 -g 0 -m -n

#Calculating Tensors
dtifit \
--data=${workdir}/dwi_epi.nii.gz \
--out=${workdir}/dti \
--mask=${workdir}/dwi_epi_b0_mask.nii.gz \
--bvecs=${workdir}/dwi_eddy.eddy_rotated_bvecs \
--bvals=${workdir}/dwi.bval \
--save_tensor 