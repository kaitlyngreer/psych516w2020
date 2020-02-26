#!/bin/bash

#SBATCH --time=20:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16G  # memory per CPU core

#LOAD ENVIRONMENTAL VARIABLES
FSLDIR=/fslhome/kgreer3/research_bin/FSL
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh

#CREATE acqparams.txt
workdir=~/compute/psych516/Data/derivative/EDSD/pDWI/${1}/

cd ${workdir}

printf "0 1 0 0.095" > acqparams.txt

#CREATE index.txt
myVar=($(wc -w dwi.bval))
index=""
for ((i=1; i<=$myVar; i+=1)); do
	indx="$indx 1"
done
echo $indx > index.txt

#EDDY CURRENT CORRECTION
eddy_openmp \
--imain=dwi.nii.gz \
--acqp=acqparams.txt \
--index=index.txt \
--mask=dwi_b0_mask.nii.gz \
--bvecs=dwi.bvec \
--bvals=dwi.bval \
--out=dwi_eddy \
--verbose

