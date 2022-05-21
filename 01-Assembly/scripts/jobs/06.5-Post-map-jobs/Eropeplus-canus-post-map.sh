#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/hiseq4000-paired-3/SM115_CKDL200159916-1a-D711-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/hiseq4000-paired-3/SM115_CKDL200159916-1a-D711-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Eropeplus-canus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/hiseq4000-paired-3/SM115_CKDL200159916-1a-D711-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Eropeplus-canus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Eropeplus-canus/Eropeplus-canus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Eropeplus-canus/Eropeplus-canus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Eropeplus-canus-mosdepth.log
#

#

