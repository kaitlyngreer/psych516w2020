#!/bin/bash

timeStamp=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${timeStamp}-tbss1
sbatch \
-o ~/logfiles/EDSD/${timeStamp}-tbss1/output.txt \
-e ~/logfiles/EDSD/${timeStamp}-tbss1/error.txt \
~/compute/psych516/scripts/EDSD/tbss_1_preproc.sh