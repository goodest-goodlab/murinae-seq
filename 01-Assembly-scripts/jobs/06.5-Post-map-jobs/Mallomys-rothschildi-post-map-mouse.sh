#!/bin/bash
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/hiseq4000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/hiseq4000-paired-2/SM046_CKDL190143345-1a-D710-AK1680_H7275BBXX_L4_.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/hiseq4000-paired-2/SM046_CKDL190143345-1a-D710-AK1680_H7275BBXX_L4_.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mallomys-rothschildi-hiseq4000-paired-2-merge-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/hiseq4000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/hiseq4000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mallomys-rothschildi-hiseq4000-paired-2-mkdup-mouse.log
#samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/hiseq4000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mallomys-rothschildi-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi.bam
#samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi-depth.tab
#samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi-stats.txt
#samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mallomys-rothschildi-mouse/Mallomys-rothschildi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mallomys-rothschildi-mosdepth-mouse.log
