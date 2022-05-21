#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/hiseq4000-paired-1/SM033_CKDL190143343-1a-D702-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/hiseq4000-paired-1/SM033_CKDL190143343-1a-D702-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Coccymys-ruemmleri-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/hiseq4000-paired-1/SM033_CKDL190143343-1a-D702-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Coccymys-ruemmleri-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Coccymys-ruemmleri/Coccymys-ruemmleri.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri/Coccymys-ruemmleri.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Coccymys-ruemmleri-mosdepth.log
#

#

