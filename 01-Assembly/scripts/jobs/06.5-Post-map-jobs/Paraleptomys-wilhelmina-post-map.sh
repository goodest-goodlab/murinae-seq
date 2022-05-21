#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/hiseq4000-paired-1/SM065_CKDL190143344-1a-D706-AK1682_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/hiseq4000-paired-1/SM065_CKDL190143344-1a-D706-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paraleptomys-wilhelmina-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/hiseq4000-paired-1/SM065_CKDL190143344-1a-D706-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paraleptomys-wilhelmina-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paraleptomys-wilhelmina/Paraleptomys-wilhelmina.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paraleptomys-wilhelmina-mosdepth.log
#

#

