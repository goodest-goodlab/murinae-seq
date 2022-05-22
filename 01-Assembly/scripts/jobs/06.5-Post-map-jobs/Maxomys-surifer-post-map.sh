#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L004_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L003_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L003_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L004_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-1/JAE3632_S38_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-1/JAE3632_S38_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/miseq-paired/JAE3632_S38_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/miseq-paired/JAE3632_S38_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-1/JAE3632_S38_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/miseq-paired/JAE3632_S38_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Maxomys-surifer/Maxomys-surifer.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Maxomys-surifer/Maxomys-surifer.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Maxomys-surifer-mosdepth.log
#

#
