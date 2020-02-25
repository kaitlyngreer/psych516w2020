#!/bin/bash
curTime=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${curTime}-b0
for SUBJID in $(ls ~/compute/psych516/Data/BIDS/EDSD/sub-*); do
  sbatch \
  -o ~/logfiles/EDSD/${curTime}-b0/o-${SUBJID}.txt \
  -e ~/logfiles/EDSD/${curTime}-b0/e-${SUBJID}.txt \
  ~/compute/psych516/scripts/EDSD/b0-job.sh \
  sleep 1
done