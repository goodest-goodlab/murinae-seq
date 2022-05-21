#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/hiseq4000-paired-2/SM039_CKDL190143345-1a-D707-AK1680_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/hiseq4000-paired-2/SM039_CKDL190143345-1a-D707-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hybomys-lunaris-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/hiseq4000-paired-2/SM039_CKDL190143345-1a-D707-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hybomys-lunaris-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Hybomys-lunaris/Hybomys-lunaris-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hybomys-lunaris/Hybomys-lunaris.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hybomys-lunaris-mosdepth.log
#

#

