#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/hiseq4000-paired-3/SM110_CKDL200159916-1a-D706-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/hiseq4000-paired-3/SM110_CKDL200159916-1a-D706-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Myomyscus-verreauxii-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/hiseq4000-paired-3/SM110_CKDL200159916-1a-D706-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Myomyscus-verreauxii-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Myomyscus-verreauxii/Myomyscus-verreauxii-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Myomyscus-verreauxii/Myomyscus-verreauxii.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Myomyscus-verreauxii-mosdepth.log
#

#

