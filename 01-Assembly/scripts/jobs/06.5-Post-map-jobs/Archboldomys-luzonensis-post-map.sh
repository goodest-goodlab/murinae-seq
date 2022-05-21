#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1/EAR1826_S61_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1/EAR1826_S61_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1/EAR1826_S61_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1/EAR1826_S61_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2/EAR1826_S61_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2/EAR1826_S61_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2/EAR1826_S61_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2/EAR1826_S61_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2/EAR1826_S29_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2/EAR1826_S29_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2/EAR1826_S29_L003_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2/EAR1826_S29_L004_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-1/EAR1826_S35_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-1/EAR1826_S35_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/miseq-paired/EAR1826_S35_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/miseq-paired/EAR1826_S35_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-1/EAR1826_S35_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/miseq-paired/EAR1826_S35_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Archboldomys-luzonensis/Archboldomys-luzonensis.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Archboldomys-luzonensis/Archboldomys-luzonensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Archboldomys-luzonensis-mosdepth.log
#

#

