#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/hiseq4000-paired-1/SM051_CKDL190143344-1a-D706-AK1681_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/hiseq4000-paired-1/SM051_CKDL190143344-1a-D706-AK1681_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mirzamys-louiseae-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/hiseq4000-paired-1/SM051_CKDL190143344-1a-D706-AK1681_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mirzamys-louiseae-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mirzamys-louiseae/Mirzamys-louiseae-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mirzamys-louiseae/Mirzamys-louiseae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mirzamys-louiseae-mosdepth.log
#

#

