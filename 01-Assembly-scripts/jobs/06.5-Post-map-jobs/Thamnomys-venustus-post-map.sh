#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/hiseq4000-paired-1/REC24_CKDL190143343-1a-D702-AK1546_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/hiseq4000-paired-1/REC24_CKDL190143343-1a-D702-AK1546_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thamnomys-venustus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/hiseq4000-paired-1/REC24_CKDL190143343-1a-D702-AK1546_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thamnomys-venustus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Thamnomys-venustus/Thamnomys-venustus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-venustus/Thamnomys-venustus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thamnomys-venustus-mosdepth.log
#

#
