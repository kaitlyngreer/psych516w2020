#!/bin/bash
curTime=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${curTime}-HA
for SUBJID in $(ls ~/compute/psych516/Data/FS_SUBJDIR/EDSD/); do
  sbatch \
  -o ~/logfiles/EDSD/${curTime}-HA/o-${SUBJID}.txt \
  -e ~/logfiles/EDSD/${curTime}-HA/e-${SUBJID}.txt \
  ~/compute/psych516/scripts/EDSD/segmentHA-job.sh \
  ${SUBJID}
  sleep 1
done