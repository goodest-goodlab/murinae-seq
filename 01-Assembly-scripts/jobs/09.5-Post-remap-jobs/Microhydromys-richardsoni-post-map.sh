#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/hiseq4000-paired-1/SM050_CKDL190143344-1a-D705-AK1681_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/hiseq4000-paired-1/SM050_CKDL190143344-1a-D705-AK1681_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Microhydromys-richardsoni-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/hiseq4000-paired-1/SM050_CKDL190143344-1a-D705-AK1681_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Microhydromys-richardsoni-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Microhydromys-richardsoni/Microhydromys-richardsoni-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Microhydromys-richardsoni/Microhydromys-richardsoni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Microhydromys-richardsoni-mosdepth.log
#

#

