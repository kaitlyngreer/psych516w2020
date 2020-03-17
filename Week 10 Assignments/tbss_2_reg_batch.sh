#!/bin/bash

timeStamp=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${timeStamp}-tbss2
sbatch \
-o ~/logfiles/EDSD/${timeStamp}-tbss2/output.txt \
-e ~/logfiles/EDSD/${timeStamp}-tbss2/error.txt \
~/compute/psych516/scripts/EDSD/tbss_2_reg.sh