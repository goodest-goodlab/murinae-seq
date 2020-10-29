#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/hiseq4000-paired-3/SM109_CKDL200159916-1a-D705-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/hiseq4000-paired-3/SM109_CKDL200159916-1a-D705-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mylomys-dybowskii-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/hiseq4000-paired-3/SM109_CKDL200159916-1a-D705-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mylomys-dybowskii-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Mylomys-dybowskii/Mylomys-dybowskii.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mylomys-dybowskii/Mylomys-dybowskii.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mylomys-dybowskii-mosdepth.log
#

#

