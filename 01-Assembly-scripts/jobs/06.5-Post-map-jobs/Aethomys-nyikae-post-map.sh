#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/hiseq4000-paired-1/SM084_CKDL190143343-1a-D702-AK1543_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/hiseq4000-paired-1/SM084_CKDL190143343-1a-D702-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Aethomys-nyikae-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/hiseq4000-paired-1/SM084_CKDL190143343-1a-D702-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Aethomys-nyikae-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Aethomys-nyikae/Aethomys-nyikae.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Aethomys-nyikae/Aethomys-nyikae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Aethomys-nyikae-mosdepth.log
#

#

