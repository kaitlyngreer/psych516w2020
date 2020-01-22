#!/bin/bash

 for s in $(ls ~/Desktop/Data/raw/EDSD); do
 	mkdir -p ~/Desktop/Data/BIDS/EDSD/${s}/dwi
 	dcm2niix \
  -o ~/Desktop/Data/BIDS/EDSD/$s/dwi/ \
  -x n \
  -z n \
  -f ${s}_dwi \
  ~/Desktop/Data/raw/EDSD/${s}/DICOM/diff
 done