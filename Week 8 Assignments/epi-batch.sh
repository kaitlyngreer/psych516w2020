#!/bin/bash

curTime=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${curTime}-epi

for SUBJID in $(ls ~/compute/psych516/Data/derivative/EDSD/pDWI/); do
  sbatch \
  -o ~/logfiles/EDSD/${curTime}-epi/o-${SUBJID}.txt \
  -e ~/logfiles/EDSD/${curTime}-epi/e-${SUBJID}.txt \
  ~/compute/psych516/scripts/EDSD/epi-job.sh \
  ${SUBJID}
  sleep 1
done