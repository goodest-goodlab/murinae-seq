#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/hiseq4000-paired-2/REC18_CKDL190143345-1a-D706-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/hiseq4000-paired-2/REC18_CKDL190143345-1a-D706-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Sundamys-annandalei-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/hiseq4000-paired-2/REC18_CKDL190143345-1a-D706-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Sundamys-annandalei-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Sundamys-annandalei/Sundamys-annandalei-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Sundamys-annandalei/Sundamys-annandalei.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Sundamys-annandalei-mosdepth.log
#

#

