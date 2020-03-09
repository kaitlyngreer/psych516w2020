#!/bin/bash

curTime=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${curTime}-tensor

for SUBJID in $(ls ~/compute/psych516/Data/derivative/EDSD/pDWI/); do
  sbatch \
  -o ~/logfiles/EDSD/${curTime}-tensor/o-${SUBJID}.txt \
  -e ~/logfiles/EDSD/${curTime}-tensor/e-${SUBJID}.txt \
  ~/compute/psych516/scripts/EDSD/tensor-job.sh \
  ${SUBJID}
  sleep 1
done