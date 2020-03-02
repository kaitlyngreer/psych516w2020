#!/bin/bash

#SBATCH --time=06:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core


#LOAD ENVIRONMENTAL VARIABLES
#FSL
FSLDIR=/fslhome/kgreer3/research_bin/FSL
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh

#FreeSurfer
export FREESURFER_HOME=/fslhome/kgreer3/apps/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

#Distortion Correction
workdir=~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/

cd ${workdir}

fslroi ${workdir}/dwi_eddy.nii.gz ${workdir}/dwi_eddy_b0.nii.gz 0 1

bet ${workdir}/dwi_eddy_b0.nii.gz ${workdir}/dwi_eddy_b0_tmp -f 0.5 -g 0 -m 

bet ${workdir}/dwi_eddy_b0_tmp.nii.gz ${workdir}/dwi_eddy_b0_ss -f 0.5 -g 0 -m 

mri_convert ~/compute/psych516/Data/FS_SUBJDIR/EDSD/${1}/mri/brainmask.mgz t1.nii.gz


#Rigidly align
~/research_bin/antsbin/bin/antsRegistrationSyNQuick.sh \
-d 3 \
-f dwi_eddy_b0_ss.nii.gz \
-m t1.nii.gz \
-o T1toEddyB0_ \
-t a 

#Fixing Distortion
~/research_bin/antsbin/bin/antsRegistrationSyN.sh \
-d 3 \
-f T1toEddyB0_Warped.nii.gz \
-m dwi_eddy_b0_ss.nii.gz \
-o dwi_epi_ \
-t so

#Applying the transformation
~/research_bin/antsbin/bin/antsApplyTransforms \
--dimensionality 3 \
--input-image-type 3 \
--input dwi_eddy.nii.gz \
--output dwi_epi.nii.gz \
--reference-image T1toEddyB0_Warped.nii.gz \
--interpolation Bspline \
--transform dwi_epi_1Warp.nii.gz 


