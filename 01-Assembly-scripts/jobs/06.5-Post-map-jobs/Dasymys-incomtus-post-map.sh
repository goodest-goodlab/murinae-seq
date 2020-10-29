#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/hiseq4000-paired-2/REC29_CKDL190143345-1a-D707-AK1546_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/hiseq4000-paired-2/REC29_CKDL190143345-1a-D707-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-incomtus-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/hiseq4000-paired-2/REC29_CKDL190143345-1a-D707-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-incomtus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Dasymys-incomtus/Dasymys-incomtus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus/Dasymys-incomtus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-incomtus-mosdepth.log
#

#

