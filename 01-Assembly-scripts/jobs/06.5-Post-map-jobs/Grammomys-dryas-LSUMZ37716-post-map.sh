#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/hiseq4000-paired-1/REC8_CKDL190143343-1a-D706-AK1544_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/hiseq4000-paired-1/REC8_CKDL190143343-1a-D706-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Grammomys-dryas-LSUMZ37716-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/hiseq4000-paired-1/REC8_CKDL190143343-1a-D706-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Grammomys-dryas-LSUMZ37716-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Grammomys-dryas-LSUMZ37716/Grammomys-dryas-LSUMZ37716.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Grammomys-dryas-LSUMZ37716-mosdepth.log
#

#

