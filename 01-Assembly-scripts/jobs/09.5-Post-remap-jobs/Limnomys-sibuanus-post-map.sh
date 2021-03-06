#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/hiseq4000-paired-1/SM089_CKDL190143343-1a-D707-AK1543_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/hiseq4000-paired-1/SM089_CKDL190143343-1a-D707-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Limnomys-sibuanus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/hiseq4000-paired-1/SM089_CKDL190143343-1a-D707-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Limnomys-sibuanus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Limnomys-sibuanus/Limnomys-sibuanus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Limnomys-sibuanus/Limnomys-sibuanus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Limnomys-sibuanus-mosdepth.log
#

#

