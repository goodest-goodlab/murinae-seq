#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/hiseq4000-paired-2/SM053_CKDL190143345-1a-D701-AK1682_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/hiseq4000-paired-2/SM053_CKDL190143345-1a-D701-AK1682_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Nesokia-indica-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/hiseq4000-paired-2/SM053_CKDL190143345-1a-D701-AK1682_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Nesokia-indica-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Nesokia-indica/Nesokia-indica.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Nesokia-indica/Nesokia-indica.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Nesokia-indica-mosdepth.log
#

#

