#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/hiseq4000-paired-2/SM011_CKDL190143345-1a-D701-AK1780_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/hiseq4000-paired-2/SM011_CKDL190143345-1a-D701-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Berylmys-mackenzii-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/hiseq4000-paired-2/SM011_CKDL190143345-1a-D701-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Berylmys-mackenzii-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Berylmys-mackenzii/Berylmys-mackenzii-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Berylmys-mackenzii/Berylmys-mackenzii.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Berylmys-mackenzii-mosdepth.log
#

#

