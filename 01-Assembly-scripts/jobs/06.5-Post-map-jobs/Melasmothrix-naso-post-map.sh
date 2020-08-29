#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1/Z21808_S48_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1/Z21808_S48_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1/Z21808_S48_L004_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1/Z21808_S48_L003_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2/Z21808_S48_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2/Z21808_S48_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2/Z21808_S48_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2/Z21808_S48_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2/Z21808_S16_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2/Z21808_S16_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2/Z21808_S16_L003_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2/Z21808_S16_L004_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-1/Z21808_S23_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-1/Z21808_S23_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/miseq-paired/Z21808_S23_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/miseq-paired/Z21808_S23_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-1/Z21808_S23_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/miseq-paired/Z21808_S23_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Melasmothrix-naso/Melasmothrix-naso.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melasmothrix-naso/Melasmothrix-naso.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melasmothrix-naso-mosdepth.log
