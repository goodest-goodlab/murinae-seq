#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/hiseq4000-paired-1/REC14_CKDL190143344-1a-D702-AK1545_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/hiseq4000-paired-1/REC14_CKDL190143344-1a-D702-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Otomys-denti-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/hiseq4000-paired-1/REC14_CKDL190143344-1a-D702-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Otomys-denti-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Otomys-denti/Otomys-denti.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Otomys-denti/Otomys-denti.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Otomys-denti-mosdepth.log
#

#

