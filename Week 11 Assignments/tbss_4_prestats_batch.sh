#!/bin/bash

timeStamp=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/EDSD/${timeStamp}-tbss4
sbatch \
-o ~/logfiles/EDSD/${timeStamp}-tbss4/output.txt \
-e ~/logfiles/EDSD/${timeStamp}-tbss4/error.txt \
~/compute/psych516/scripts/EDSD/tbss_4_prestats.sh