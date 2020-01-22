#!/bin/bash

subject_dir=/Users/kaitlyngreer/Desktop/516/EDSD/dataset

cd $subject_dir
for s in sub-*;
do \
acpcdetect \
  -i /Users/kaitlyngreer/Desktop/516/EDSD/dataset/$s/anat/*.nii
 done
  