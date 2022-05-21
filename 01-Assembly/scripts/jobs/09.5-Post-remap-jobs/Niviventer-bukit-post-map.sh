#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/hiseq4000-paired-1/SM054_CKDL190143344-1a-D702-AK1682_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/hiseq4000-paired-1/SM054_CKDL190143344-1a-D702-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Niviventer-bukit-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/hiseq4000-paired-1/SM054_CKDL190143344-1a-D702-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Niviventer-bukit-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Niviventer-bukit/Niviventer-bukit-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-bukit/Niviventer-bukit.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Niviventer-bukit-mosdepth.log
#

#

