#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1/TCD4560_S39_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1/TCD4560_S39_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1/TCD4560_S39_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1/TCD4560_S39_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2/TCD4560_S39_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2/TCD4560_S39_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2/TCD4560_S39_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2/TCD4560_S39_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2/TCD4560_S7_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2/TCD4560_S7_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2/TCD4560_S7_L004_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2/TCD4560_S7_L003_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-1/TCD4560_S15_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-1/TCD4560_S15_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/miseq-paired/TCD4560_S15_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/miseq-paired/TCD4560_S15_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-1/TCD4560_S15_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/miseq-paired/TCD4560_S15_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Grammomys-sp/Grammomys-sp-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-sp/Grammomys-sp.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-sp-mosdepth.log
#

#

