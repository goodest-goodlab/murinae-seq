#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/hiseq4000-paired-1/SM042_CKDL190143344-1a-D708-AK1680_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/hiseq4000-paired-1/SM042_CKDL190143344-1a-D708-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-argentiventer-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/hiseq4000-paired-1/SM042_CKDL190143344-1a-D708-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-argentiventer-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Rattus-argentiventer/Rattus-argentiventer-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-argentiventer/Rattus-argentiventer.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-argentiventer-mosdepth.log
#

#

