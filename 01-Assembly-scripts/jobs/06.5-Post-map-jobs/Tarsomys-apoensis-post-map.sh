#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/hiseq4000-paired-2/REC21_CKDL190143345-1a-D709-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/hiseq4000-paired-2/REC21_CKDL190143345-1a-D709-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Tarsomys-apoensis-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/hiseq4000-paired-2/REC21_CKDL190143345-1a-D709-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Tarsomys-apoensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Tarsomys-apoensis/Tarsomys-apoensis.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Tarsomys-apoensis/Tarsomys-apoensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Tarsomys-apoensis-mosdepth.log
#

#

