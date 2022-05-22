#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired/hoffmaniWGA_CCGATT_L008_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired/hoffmani_GATCTC_L008_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired/hoffmani_GATCTC_L007_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired/hoffmani-WGA_CCGATT_L007_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq-paired-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq2500-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq2500-paired/lane2_CCGATT_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq2500-paired/lane2_GATCTC_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq2500-paired-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq4000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq4000-paired-2/SM074_CKDL190143345-1a-D709-AK1682_H7275BBXX_L4_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq4000-paired-2/SM074_CKDL190143345-1a-D709-AK1682_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq4000-paired-2-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-hiseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq-paired-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq2500-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq2500-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-hiseq2500-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq2500-paired-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq4000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq4000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-hiseq4000-paired-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq2500-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/hiseq4000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-hoffmanni-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-hoffmanni-mouse/Rattus-hoffmanni-targets-flagstats.txt