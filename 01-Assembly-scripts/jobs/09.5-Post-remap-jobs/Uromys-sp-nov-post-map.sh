#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/hiseq4000-paired-1/REC25_CKDL190143344-1a-DY0088-AK1546_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/hiseq4000-paired-1/REC25_CKDL190143344-1a-DY0088-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Uromys-sp-nov-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/hiseq4000-paired-1/REC25_CKDL190143344-1a-DY0088-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Uromys-sp-nov-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Uromys-sp-nov/Uromys-sp-nov-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Uromys-sp-nov/Uromys-sp-nov.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Uromys-sp-nov-mosdepth.log
#

#

