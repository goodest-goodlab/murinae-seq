#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/hiseq4000-paired-1/SM056_CKDL190143343-1a-D711-AK1680_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/hiseq4000-paired-1/SM056_CKDL190143343-1a-D711-AK1680_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Niviventer-rapit-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/hiseq4000-paired-1/SM056_CKDL190143343-1a-D711-AK1680_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Niviventer-rapit-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Niviventer-rapit/Niviventer-rapit-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Niviventer-rapit/Niviventer-rapit.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Niviventer-rapit-mosdepth.log
#

#

