#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/hiseq4000-paired-1/SM073_CKDL190143343-1a-D708-AK1682_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/hiseq4000-paired-1/SM073_CKDL190143343-1a-D708-AK1682_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudohydromys-pumehanae-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/hiseq4000-paired-1/SM073_CKDL190143343-1a-D708-AK1682_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudohydromys-pumehanae-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudohydromys-pumehanae/Pseudohydromys-pumehanae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudohydromys-pumehanae-mosdepth.log
#

#

