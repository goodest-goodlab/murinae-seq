#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq-paired/praetorWGA_CAGTAC_L008_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq-paired/praetor-WGA_CAGTAC_L007_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-praetor-hiseq-paired-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor-hiseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-praetor-hiseq-paired-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq2500-paired/lane2_CAGTAC_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq2500-paired/lane2_CAGTAC_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor-hiseq2500-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-praetor-hiseq2500-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/hiseq2500-paired/lane2_CAGTAC_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-praetor-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Rattus-praetor/Rattus-praetor.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-praetor/Rattus-praetor.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-praetor-mosdepth.log
#

#

