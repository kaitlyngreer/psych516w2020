#!/bin/bash
curTime=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${curTime}-t1
for SUBJID in $(ls ~/compute/psych516/Data/derivative/EDSD/pT1); do
  sbatch \
  -o ~/logfiles/EDSD/${curTime}-t1/o-${SUBJID}.txt \
  -e ~/logfiles/EDSD/${curTime}-t1/e-${SUBJID}.txt \
  ~/compute/psych516/scripts/EDSD/preprocess-job.sh \
  ${SUBJID}
  sleep 1
done