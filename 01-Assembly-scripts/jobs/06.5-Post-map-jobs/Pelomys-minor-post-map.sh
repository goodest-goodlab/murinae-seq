#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/hiseq4000-paired-2/REC16_CKDL190143345-1a-D704-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/hiseq4000-paired-2/REC16_CKDL190143345-1a-D704-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pelomys-minor-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/hiseq4000-paired-2/REC16_CKDL190143345-1a-D704-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pelomys-minor-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Pelomys-minor/Pelomys-minor.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pelomys-minor/Pelomys-minor.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pelomys-minor-mosdepth.log
#

#

