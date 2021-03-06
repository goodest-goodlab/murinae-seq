#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/hiseq4000-paired-1/SM086_CKDL190143343-1a-D704-AK1543_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/hiseq4000-paired-1/SM086_CKDL190143343-1a-D704-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-montanus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/hiseq4000-paired-1/SM086_CKDL190143343-1a-D704-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-montanus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Dasymys-montanus/Dasymys-montanus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-montanus/Dasymys-montanus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-montanus-mosdepth.log
#

#

