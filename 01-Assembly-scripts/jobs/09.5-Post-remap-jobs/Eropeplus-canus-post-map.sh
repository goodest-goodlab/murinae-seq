#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/hiseq4000-paired-3/SM115_CKDL200159916-1a-D711-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/hiseq4000-paired-3/SM115_CKDL200159916-1a-D711-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Eropeplus-canus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/hiseq4000-paired-3/SM115_CKDL200159916-1a-D711-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Eropeplus-canus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Eropeplus-canus/Eropeplus-canus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Eropeplus-canus/Eropeplus-canus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Eropeplus-canus-mosdepth.log
#

#

