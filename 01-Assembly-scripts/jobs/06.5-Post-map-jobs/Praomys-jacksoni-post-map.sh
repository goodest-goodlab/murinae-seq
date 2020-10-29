#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/hiseq4000-paired-1/REC31_CKDL190143344-1a-D710-AK1546_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/hiseq4000-paired-1/REC31_CKDL190143344-1a-D710-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Praomys-jacksoni-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/hiseq4000-paired-1/REC31_CKDL190143344-1a-D710-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Praomys-jacksoni-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Praomys-jacksoni/Praomys-jacksoni.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Praomys-jacksoni/Praomys-jacksoni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Praomys-jacksoni-mosdepth.log
#

#

