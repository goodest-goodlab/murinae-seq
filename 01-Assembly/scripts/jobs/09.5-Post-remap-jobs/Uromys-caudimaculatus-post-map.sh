#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/hiseq4000-paired-1/SM078_CKDL190143344-1a-D707-AK1780_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/hiseq4000-paired-1/SM078_CKDL190143344-1a-D707-AK1780_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Uromys-caudimaculatus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/hiseq4000-paired-1/SM078_CKDL190143344-1a-D707-AK1780_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Uromys-caudimaculatus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Uromys-caudimaculatus/Uromys-caudimaculatus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-caudimaculatus/Uromys-caudimaculatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Uromys-caudimaculatus-mosdepth.log
#

#

