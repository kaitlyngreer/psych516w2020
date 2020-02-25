#!/bin/bash
curTime=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${curTime}-reconbv
for SUBJID in $(ls ~/compute/psych516/Data/derivative/EDSD/pT1); do
  sbatch \
  -o ~/logfiles/EDSD/${curTime}-reconbv/o-${SUBJID}.txt \
  -e ~/logfiles/EDSD/${curTime}-reconbv/e-${SUBJID}.txt \
  ~/compute/psych516/scripts/EDSD/recon-all-bvjob.sh \
  ${SUBJID}
  sleep 1
done