#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1/JAE4661_S32_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1/JAE4661_S32_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1/JAE4661_S32_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1/JAE4661_S32_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2/JAE4661_S32_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2/JAE4661_S32_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2/JAE4661_S32_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2/JAE4661_S32_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2/JAE4661_S40_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2/JAE4661_S40_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2/JAE4661_S40_L004_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2/JAE4661_S40_L003_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-1/JAE4661_S9_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-1/JAE4661_S9_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/miseq-paired/JAE4661_S9_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/miseq-paired/JAE4661_S9_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-1/JAE4661_S9_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/miseq-paired/JAE4661_S9_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyorhinomys-stuempkei/Hyorhinomys-stuempkei.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyorhinomys-stuempkei-mosdepth.log
#

#
