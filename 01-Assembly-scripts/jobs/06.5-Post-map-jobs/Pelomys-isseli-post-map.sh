#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/hiseq4000-paired-1/SM068_CKDL190143343-1a-D708-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/hiseq4000-paired-1/SM068_CKDL190143343-1a-D708-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pelomys-isseli-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/hiseq4000-paired-1/SM068_CKDL190143343-1a-D708-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pelomys-isseli-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Pelomys-isseli/Pelomys-isseli.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-isseli/Pelomys-isseli.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pelomys-isseli-mosdepth.log
#

#

