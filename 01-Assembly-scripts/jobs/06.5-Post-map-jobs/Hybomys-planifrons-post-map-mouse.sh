#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/hiseq4000-paired-1/SM040_CKDL190143343-1a-DY0088-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/hiseq4000-paired-1/SM040_CKDL190143343-1a-DY0088-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-planifrons-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/hiseq4000-paired-1/SM040_CKDL190143343-1a-DY0088-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-planifrons-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-planifrons-mouse/Hybomys-planifrons.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-planifrons-mosdepth-mouse.log
