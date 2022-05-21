#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired/exulans_GCATTG_L008_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired/exulans_GCATTG_L007_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired/exulansWGA_TGACGT_L008_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired/exulans-WGA_TGACGT_L007_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-exulans-hiseq-paired-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq2500-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq2500-paired/lane2_GCATTG_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq2500-paired/lane2_TGACGT_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-exulans-hiseq2500-paired-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans-hiseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-exulans-hiseq-paired-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq2500-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq2500-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans-hiseq2500-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-exulans-hiseq2500-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/hiseq2500-paired.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-exulans-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Rattus-exulans/Rattus-exulans-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rattus-exulans/Rattus-exulans.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rattus-exulans-mosdepth.log
#

#

