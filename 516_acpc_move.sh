#!/bin/bash

for s in $(find ~/Desktop/Data/BIDS/EDSD -mindepth 3 -not -name "*T1w.nii" -not -name "*T1w.json" -not -name "*dwi*"); do
	SUBJID=`echo $s | cut -d "/" -f 8`
	cd ~/Desktop/Data/ 
	mkdir -p ~/Desktop/Data/derivative/EDSD/pT1/${SUBJID}/
	mv -v ${s} ~/Desktop/Data/derivative/EDSD/pT1/${SUBJID}/
done