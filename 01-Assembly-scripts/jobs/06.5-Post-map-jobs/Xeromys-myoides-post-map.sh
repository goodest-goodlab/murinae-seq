#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/hiseq4000-paired-1/SM080_CKDL190143343-1a-D709-AK1780_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/hiseq4000-paired-1/SM080_CKDL190143343-1a-D709-AK1780_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Xeromys-myoides-hiseq4000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/hiseq4000-paired-3/SM080_CKDL200159916-1a-D709-AK1780_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/hiseq4000-paired-3/SM080_CKDL200159916-1a-D709-AK1780_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Xeromys-myoides-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/hiseq4000-paired-1/SM080_CKDL190143343-1a-D709-AK1780_H7275BBXX_L2_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/hiseq4000-paired-3/SM080_CKDL200159916-1a-D709-AK1780_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Xeromys-myoides-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Xeromys-myoides/Xeromys-myoides.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xeromys-myoides/Xeromys-myoides.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Xeromys-myoides-mosdepth.log
#

#

