#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/hiseq4000-paired-1/SM075_CKDL190143344-1a-D710-AK1682_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/hiseq4000-paired-1/SM075_CKDL190143344-1a-D710-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Saxatilomys-paulinae-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/hiseq4000-paired-1/SM075_CKDL190143344-1a-D710-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Saxatilomys-paulinae-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Saxatilomys-paulinae/Saxatilomys-paulinae.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Saxatilomys-paulinae/Saxatilomys-paulinae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Saxatilomys-paulinae-mosdepth.log
#

#

