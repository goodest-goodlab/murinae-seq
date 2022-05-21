#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/hiseq4000-paired-1/SM009_CKDL190143344-1a-D705-AK1680_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/hiseq4000-paired-1/SM009_CKDL190143344-1a-D705-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Bandicota-indica-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/hiseq4000-paired-1/SM009_CKDL190143344-1a-D705-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Bandicota-indica-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Bandicota-indica/Bandicota-indica.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bandicota-indica/Bandicota-indica.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Bandicota-indica-mosdepth.log
#

#

