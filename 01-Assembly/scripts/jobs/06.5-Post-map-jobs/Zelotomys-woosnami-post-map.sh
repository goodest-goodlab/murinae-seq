#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/hiseq4000-paired-2/SM081_CKDL190143345-1a-D710-AK1780_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/hiseq4000-paired-2/SM081_CKDL190143345-1a-D710-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zelotomys-woosnami-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/hiseq4000-paired-2/SM081_CKDL190143345-1a-D710-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zelotomys-woosnami-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Zelotomys-woosnami/Zelotomys-woosnami.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zelotomys-woosnami/Zelotomys-woosnami.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zelotomys-woosnami-mosdepth.log
#

#

