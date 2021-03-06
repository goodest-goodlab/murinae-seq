#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/hiseq4000-paired-2/SM046_CKDL190143345-1a-D710-AK1680_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/hiseq4000-paired-2/SM046_CKDL190143345-1a-D710-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mallomys-rothschildi-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/hiseq4000-paired-2/SM046_CKDL190143345-1a-D710-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mallomys-rothschildi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Mallomys-rothschildi/Mallomys-rothschildi.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi/Mallomys-rothschildi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mallomys-rothschildi-mosdepth.log
#

#

