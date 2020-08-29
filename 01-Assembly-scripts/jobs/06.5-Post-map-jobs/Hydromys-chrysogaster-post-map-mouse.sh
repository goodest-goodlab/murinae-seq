#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1/Z5248_S59_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1/Z5248_S59_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1/Z5248_S59_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1/Z5248_S59_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-nextseq-single-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2/Z5248_S59_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2/Z5248_S59_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2/Z5248_S59_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2/Z5248_S59_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-nextseq-single-2-merge-mouse.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2/Z5248_S27_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2/Z5248_S27_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2/Z5248_S27_L004_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2/Z5248_S27_L003_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-nextseq-paired-2-merge-mouse.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-nextseq-single-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-nextseq-single-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-1/Z5248_S33_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-1/Z5248_S33_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-nextseq-paired-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-nextseq-paired-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/miseq-paired/Z5248_S33_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/miseq-paired/Z5248_S33_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-miseq-paired-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-1/Z5248_S33_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/miseq-paired/Z5248_S33_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-chrysogaster-mouse/Hydromys-chrysogaster.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-chrysogaster-mosdepth-mouse.log
