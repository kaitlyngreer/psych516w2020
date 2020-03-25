#!/bin/bash

timeStamp=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${timeStamp}-tbss3
sbatch \
-o ~/logfiles/EDSD/${timeStamp}-tbss3/output.txt \
-e ~/logfiles/EDSD/${timeStamp}-tbss3/error.txt \
~/compute/psych516/scripts/EDSD/tbss_3_postreg.sh