#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/hiseq4000-paired-1/SM085_CKDL190143343-1a-DY0088-AK1543_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/hiseq4000-paired-1/SM085_CKDL190143343-1a-DY0088-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-hiseq4000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/hiseq4000-paired-3/SM085_CKDL200159916-1a-DY0088-AK1543_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/hiseq4000-paired-3/SM085_CKDL200159916-1a-DY0088-AK1543_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/hiseq4000-paired-1/SM085_CKDL190143343-1a-DY0088-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/hiseq4000-paired-3/SM085_CKDL200159916-1a-DY0088-AK1543_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Carpomys-melanurus/Carpomys-melanurus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus/Carpomys-melanurus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-mosdepth.log
#

#

