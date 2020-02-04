#!/bin/bash
curTime=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${curTime}-recon 
for SUBJID in $(ls ~/compute/psych516/Data/derivative/EDSD/pT1); do
  sbatch \
  -o ~/logfiles/EDSD/${curTime}-recon/o-${SUBJID}.txt \
  -e ~/logfiles/EDSD/${curTime}-recon/e-${SUBJID}.txt \
  ~/compute/psych516/scripts/EDSD/recon-all-job.sh \
  ${SUBJID}
  sleep 1
done