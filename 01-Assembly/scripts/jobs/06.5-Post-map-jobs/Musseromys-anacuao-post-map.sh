#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/hiseq4000-paired-1/SM063_CKDL190143343-1a-D707-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/hiseq4000-paired-1/SM063_CKDL190143343-1a-D707-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Musseromys-anacuao-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/hiseq4000-paired-1/SM063_CKDL190143343-1a-D707-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Musseromys-anacuao-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Musseromys-anacuao/Musseromys-anacuao.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Musseromys-anacuao/Musseromys-anacuao.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Musseromys-anacuao-mosdepth.log
#

#
