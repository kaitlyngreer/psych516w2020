#!/bin/bash

dicomdir=/Users/kaitlyngreer/Desktop/516/EDSD

cd $dicomdir 
 for s in sub-*; do
 	cd $s/DICOM/mprage/
 	dcm2niix \
  -o /Users/kaitlyngreer/Desktop/516/EDSD/dataset/$s/dwi/ \
  -x n \
  -z n \
  -f $s \
  *.dcm
 done