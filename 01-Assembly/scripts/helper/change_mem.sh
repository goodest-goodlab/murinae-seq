#!/bin/bash

jobfile="/scratch/gregg_thomas/Murinae-seq/scripts/jobs/merge-cmds.sh"
logdir="/scratch/gregg_thomas/Murinae-seq/scripts/logs/03A-Merge-logs/"

logfiles=( $(logcheck | cut -d ":" -f1 ) )

for item in $(logcheck | cut -d ":" -f1 )
do
    sed -i "/$item/ s/Xmx20g/Xmx30g/g" $jobfile
done
