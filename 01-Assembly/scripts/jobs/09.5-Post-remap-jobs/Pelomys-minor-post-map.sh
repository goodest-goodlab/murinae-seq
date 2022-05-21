#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/hiseq4000-paired-2/REC16_CKDL190143345-1a-D704-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/hiseq4000-paired-2/REC16_CKDL190143345-1a-D704-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pelomys-minor-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/hiseq4000-paired-2/REC16_CKDL190143345-1a-D704-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pelomys-minor-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Pelomys-minor/Pelomys-minor-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pelomys-minor/Pelomys-minor.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pelomys-minor-mosdepth.log
#

#

