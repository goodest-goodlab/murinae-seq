#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/hiseq4000-paired-1/REC17_CKDL190143344-1a-D705-AK1545_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/hiseq4000-paired-1/REC17_CKDL190143344-1a-D705-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-xanthurus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/hiseq4000-paired-1/REC17_CKDL190143344-1a-D705-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-xanthurus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Rattus-xanthurus/Rattus-xanthurus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-xanthurus/Rattus-xanthurus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-xanthurus-mosdepth.log
#

#

