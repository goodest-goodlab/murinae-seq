#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/hiseq4000-paired-2/SM076_CKDL190143345-1a-D705-AK1780_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/hiseq4000-paired-2/SM076_CKDL190143345-1a-D705-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Solomys-salebrosus-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/hiseq4000-paired-2/SM076_CKDL190143345-1a-D705-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Solomys-salebrosus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Solomys-salebrosus/Solomys-salebrosus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Solomys-salebrosus/Solomys-salebrosus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Solomys-salebrosus-mosdepth.log
#

#

