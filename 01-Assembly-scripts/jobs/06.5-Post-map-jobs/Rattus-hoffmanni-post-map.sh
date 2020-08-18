#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmani_GATCTC_L007_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmani_GATCTC_L007_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmani_GATCTC_L008_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmani_GATCTC_L008_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmani-WGA_CCGATT_L007_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmani-WGA_CCGATT_L007_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmaniWGA_CCGATT_L008_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired/hoffmaniWGA_CCGATT_L008_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq-paired-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired/lane2_GATCTC_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired/lane2_GATCTC_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired/lane2_CCGATT_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired/lane2_CCGATT_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq2500-paired-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq4000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq4000-paired-2/SM074_CKDL190143345-1a-D709-AK1682_H7275BBXX_L4_.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq4000-paired-2/SM074_CKDL190143345-1a-D709-AK1682_H7275BBXX_L4_.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq4000-paired-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni-hiseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq-paired-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni-hiseq2500-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq2500-paired-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq4000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq4000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq2500-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/hiseq4000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Rattus-hoffmanni/Rattus-hoffmanni.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni/Rattus-hoffmanni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-mosdepth.log
