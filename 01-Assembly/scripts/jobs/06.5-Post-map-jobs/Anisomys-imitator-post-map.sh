#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/hiseq4000-paired-1/SM008_CKDL190143343-1a-D701-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/hiseq4000-paired-1/SM008_CKDL190143343-1a-D701-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Anisomys-imitator-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/hiseq4000-paired-1/SM008_CKDL190143343-1a-D701-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Anisomys-imitator-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Anisomys-imitator/Anisomys-imitator.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anisomys-imitator/Anisomys-imitator.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Anisomys-imitator-mosdepth.log
#

#

