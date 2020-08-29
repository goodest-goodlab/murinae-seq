#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1/JAE169_S24_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1/JAE169_S24_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1/JAE169_S24_L004_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1/JAE169_S24_L001_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-nextseq-single-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2/JAE169_S24_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2/JAE169_S24_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2/JAE169_S24_L004_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2/JAE169_S24_L003_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-nextseq-single-2-merge-mouse.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2/JAE169_S1_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2/JAE169_S1_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2/JAE169_S1_L003_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2/JAE169_S1_L004_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-nextseq-paired-2-merge-mouse.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-nextseq-single-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-nextseq-single-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-1/JAE169_S1_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-1/JAE169_S1_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-nextseq-paired-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-nextseq-paired-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/miseq-paired/JAE169_S1_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/miseq-paired/JAE169_S1_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-miseq-paired-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-1/JAE169_S1_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/miseq-paired/JAE169_S1_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Apomys-lubangensis-mouse/Apomys-lubangensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Apomys-lubangensis-mosdepth-mouse.log
