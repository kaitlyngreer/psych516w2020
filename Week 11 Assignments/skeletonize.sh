#!/bin/bash

salloc --mem-per-cpu=16G --nodes=1 --ntasks=1 --time='06:00:00'
cd ~/compute/psych516/Data//derivative/EDSD/tbss

for subjid in $(ls ~/compute/psych516/Data/derivative/EDSD/pDWI/); do
	#COPY NORMALIZED IMAGE FILE TO INDIVIDUAL DIRECTORY
	mkdir -p ./FA-individ/${subjid}/stats/
	mkdir -p ./FA-individ/${subjid}/FA/
	cp -v ./FA/${subjid}_*.nii.gz ./FA-individ/${subjid}/FA/

	#SKULL STRIP/BRAIN EXTRACT
	fslmaths \
	./FA-individ/${subjid}/FA/${subjid}_*FA_to_target.nii.gz \
	-mas ./stats/mean_FA_mask.nii.gz \
	./FA-individ/${subjid}/FA/${subjid}_masked_FA.nii.gz 

	#SKELETONIZE
	tbss_skeleton \
	-i ./FA-individ/${subjid}/FA/${subjid}_masked_FA.nii.gz \
	-p 0.049 \
	./stats/mean_FA_skeleton_mask_dst \
	~/research_bin/FSL/data/standard/LowerCingulum_1mm.nii.gz \
	./FA-individ/${subjid}/FA/${subjid}_masked_FA.nii.gz \
	./FA-individ/${subjid}/stats/${subjid}_masked_FAskel.nii.gz \
	-s ./stats/mean_FA_skeleton_mask.nii.gz
done