#!/bin/bash

for s in $(ls /Users/kaitlyngreer/Desktop/Data/BIDS/EDSD);
do \
acpcdetect \
  -i ~/Desktop/Data/BIDS/EDSD/${s}/anat/${s}_T1w.nii
 done
  