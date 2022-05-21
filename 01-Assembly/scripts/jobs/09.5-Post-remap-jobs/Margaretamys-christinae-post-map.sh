#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/hiseq4000-paired-2/SM061_CKDL190143345-1a-D702-AK1780_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/hiseq4000-paired-2/SM061_CKDL190143345-1a-D702-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Margaretamys-christinae-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/hiseq4000-paired-2/SM061_CKDL190143345-1a-D702-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Margaretamys-christinae-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Margaretamys-christinae/Margaretamys-christinae-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Margaretamys-christinae/Margaretamys-christinae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Margaretamys-christinae-mosdepth.log
#

#

