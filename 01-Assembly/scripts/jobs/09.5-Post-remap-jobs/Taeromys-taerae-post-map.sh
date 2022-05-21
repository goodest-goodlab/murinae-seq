#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/hiseq4000-paired-2/REC20_CKDL190143345-1a-D708-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/hiseq4000-paired-2/REC20_CKDL190143345-1a-D708-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-taerae-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/hiseq4000-paired-2/REC20_CKDL190143345-1a-D708-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-taerae-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Taeromys-taerae/Taeromys-taerae-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-taerae/Taeromys-taerae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-taerae-mosdepth.log
#

#

