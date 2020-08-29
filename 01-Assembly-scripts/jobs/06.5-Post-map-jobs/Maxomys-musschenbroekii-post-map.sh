#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq-paired/musschenbroekiiWGA_CAATTA_L008_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq-paired/musschenbroekii-WGA_CAATTA_L007_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-musschenbroekii-hiseq-paired-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii-hiseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-musschenbroekii-hiseq-paired-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq2500-paired/lane2_CAATTA_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq2500-paired/lane2_CAATTA_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii-hiseq2500-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-musschenbroekii-hiseq2500-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/hiseq2500-paired/lane2_CAATTA_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-musschenbroekii-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Maxomys-musschenbroekii/Maxomys-musschenbroekii.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-musschenbroekii/Maxomys-musschenbroekii.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-musschenbroekii-mosdepth.log
