#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/hiseq4000-paired-1/SM069_CKDL190143343-1a-D709-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/hiseq4000-paired-1/SM069_CKDL190143343-1a-D709-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Phloeomys-cumingi-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/hiseq4000-paired-1/SM069_CKDL190143343-1a-D709-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Phloeomys-cumingi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Phloeomys-cumingi/Phloeomys-cumingi-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Phloeomys-cumingi/Phloeomys-cumingi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Phloeomys-cumingi-mosdepth.log
#

#

