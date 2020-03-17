#!/bin/bash

cd ~/compute/psych516/Data/derivative/EDSD/pDWI

for s in $(ls ~/compute/psych516/Data/derivative/EDSD/pDWI); do
cp ${s}/dti_FA.nii.gz ~/compute/psych516/Data/derivative/EDSD/tbss/${s}_FA.nii.gz
done 