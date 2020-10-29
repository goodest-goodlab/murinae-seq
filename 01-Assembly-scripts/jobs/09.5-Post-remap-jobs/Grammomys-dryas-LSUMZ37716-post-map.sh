#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/hiseq4000-paired-1/REC8_CKDL190143343-1a-D706-AK1544_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/hiseq4000-paired-1/REC8_CKDL190143343-1a-D706-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-dryas-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/hiseq4000-paired-1/REC8_CKDL190143343-1a-D706-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-dryas-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Grammomys-dryas/Grammomys-dryas-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Grammomys-dryas/Grammomys-dryas.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Grammomys-dryas-mosdepth.log
#

#

