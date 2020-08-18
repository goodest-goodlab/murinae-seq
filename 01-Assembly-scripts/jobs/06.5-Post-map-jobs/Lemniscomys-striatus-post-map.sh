#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1/TCD4711_S40_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1/TCD4711_S40_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1/TCD4711_S40_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1/TCD4711_S40_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2/TCD4711_S40_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2/TCD4711_S40_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2/TCD4711_S40_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2/TCD4711_S40_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-single-2-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-1/TCD4711_S16_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-1/TCD4711_S16_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-paired-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L001_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L002_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L002_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L003_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L003_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L004_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2/TCD4711_S8_L004_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-paired-2-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/miseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/miseq-paired/TCD4711_S16_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/miseq-paired/TCD4711_S16_L001_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-miseq-paired-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/miseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/miseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/miseq-paired.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Lemniscomys-striatus/Lemniscomys-striatus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Lemniscomys-striatus/Lemniscomys-striatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Lemniscomys-striatus-mosdepth.log