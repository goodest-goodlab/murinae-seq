#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1/TCD4382_S37_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1/TCD4382_S37_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1/TCD4382_S37_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1/TCD4382_S37_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-nextseq-single-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2/TCD4382_S37_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2/TCD4382_S37_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2/TCD4382_S37_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2/TCD4382_S37_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-nextseq-single-2-merge-mouse.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2/TCD4382_S5_L003_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2/TCD4382_S5_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2/TCD4382_S5_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2/TCD4382_S5_L004_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-nextseq-paired-2-merge-mouse.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-nextseq-single-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-nextseq-single-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-1/TCD4382_S13_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-1/TCD4382_S13_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-nextseq-paired-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-nextseq-paired-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/miseq-paired/TCD4382_S13_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/miseq-paired/TCD4382_S13_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-miseq-paired-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-1/TCD4382_S13_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/miseq-paired/TCD4382_S13_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-vulcanorum-mouse/Hylomyscus-vulcanorum.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-vulcanorum-mosdepth-mouse.log
