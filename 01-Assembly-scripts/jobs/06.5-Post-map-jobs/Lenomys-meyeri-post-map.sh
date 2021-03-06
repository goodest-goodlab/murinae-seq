#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/hiseq4000-paired-1/REC11_CKDL190143344-1a-D709-AK1544_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/hiseq4000-paired-1/REC11_CKDL190143344-1a-D709-AK1544_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lenomys-meyeri-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/hiseq4000-paired-1/REC11_CKDL190143344-1a-D709-AK1544_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lenomys-meyeri-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Lenomys-meyeri/Lenomys-meyeri.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lenomys-meyeri/Lenomys-meyeri.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lenomys-meyeri-mosdepth.log
#

#

