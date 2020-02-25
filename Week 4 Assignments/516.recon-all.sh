#!/bin/bash

for s in $(ls ~/compute/psych516/Data/FS_SUBJDIR/EDSD); do
 	~/apps/freesurfer/bin/mri_convert \
~/compute/psych516/Data/FS_SUBJDIR/EDSD/${s}/mri/aseg.mgz \
~/compute/psych516/Data/FS_SUBJDIR/EDSD/${s}/mri/aseg.nii.gz
 done


for s in $(ls ~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD); do
 	~/apps/freesurfer/bin/mri_convert \
~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD/${s}/mri/aseg.mgz \
~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD/${s}/mri/aseg.nii.gz
 done

for s in $(ls ~/compute/psych516/Data/FS_SUBJDIR/EDSD); do
 	~/research_bin/c3d/bin/c3d \
~/compute/psych516/Data/FS_SUBJDIR/EDSD/${s}/mri/aseg.nii.gz -thresh 4 4 1 0 \
~/compute/psych516/Data/FS_SUBJDIR/EDSD/${s}/mri/aseg.nii.gz -thresh 43 43 1 0 \
-add \
-o ~/compute/psych516/Data/FS_SUBJDIR/EDSD/${s}/mri/lateralventricles.nii.gz
 done

for s in $(ls ~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD); do
 	~/research_bin/c3d/bin/c3d \
~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD/${s}/mri/aseg.nii.gz -thresh 4 4 1 0 \
~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD/${s}/mri/aseg.nii.gz -thresh 43 43 1 0 \
-add \
-o ~/compute/psych516/Data/FS_SUBJDIR_BIGVEN/EDSD/${s}/mri/lateralventricles.nii.gz
 done



