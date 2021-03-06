#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/hiseq4000-paired-1/SM040_CKDL190143343-1a-DY0088-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/hiseq4000-paired-1/SM040_CKDL190143343-1a-DY0088-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-planifrons-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/hiseq4000-paired-1/SM040_CKDL190143343-1a-DY0088-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-planifrons-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Hybomys-planifrons/Hybomys-planifrons.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons/Hybomys-planifrons.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-planifrons-mosdepth.log
#

#

