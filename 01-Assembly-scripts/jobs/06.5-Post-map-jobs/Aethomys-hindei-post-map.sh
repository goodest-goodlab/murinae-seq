#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/hiseq4000-paired-1/REC1_CKDL190143343-1a-D708-AK1543_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/hiseq4000-paired-1/REC1_CKDL190143343-1a-D708-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Aethomys-hindei-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/hiseq4000-paired-1/REC1_CKDL190143343-1a-D708-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Aethomys-hindei-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Aethomys-hindei/Aethomys-hindei.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-hindei/Aethomys-hindei.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Aethomys-hindei-mosdepth.log
#

#

