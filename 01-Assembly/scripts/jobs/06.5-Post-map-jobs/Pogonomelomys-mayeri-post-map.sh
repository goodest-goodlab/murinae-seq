#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/hiseq4000-paired-1/REC26_CKDL190143344-1a-D704-AK1546_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/hiseq4000-paired-1/REC26_CKDL190143344-1a-D704-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomelomys-mayeri-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/hiseq4000-paired-1/REC26_CKDL190143344-1a-D704-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomelomys-mayeri-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Pogonomelomys-mayeri/Pogonomelomys-mayeri.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-mayeri/Pogonomelomys-mayeri.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomelomys-mayeri-mosdepth.log
#

#

