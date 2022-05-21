#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1/Z21914_S49_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1/Z21914_S49_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1/Z21914_S49_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1/Z21914_S49_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2/Z21914_S49_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2/Z21914_S49_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2/Z21914_S49_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2/Z21914_S49_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2/Z21914_S17_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2/Z21914_S17_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2/Z21914_S17_L004_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2/Z21914_S17_L003_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-1/Z21914_S24_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-1/Z21914_S24_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/miseq-paired/Z21914_S24_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/miseq-paired/Z21914_S24_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-1/Z21914_S24_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/miseq-paired/Z21914_S24_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Paucidentomys-vermidax/Paucidentomys-vermidax.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paucidentomys-vermidax/Paucidentomys-vermidax.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paucidentomys-vermidax-mosdepth.log
#

#

