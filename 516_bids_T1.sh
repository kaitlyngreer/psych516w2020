#!/bin/bash

 for s in $(ls ~/Desktop/Data/raw/EDSD); do
 	mkdir -p ~/Desktop/Data/BIDS/EDSD/${s}/anat
 	dcm2niix \
  -o ~/Desktop/Data/BIDS/EDSD/$s/anat/ \
  -x n \
  -z n \
  -f ${s}_T1w \
  ~/Desktop/Data/raw/EDSD/${s}/DICOM/mprage
 done