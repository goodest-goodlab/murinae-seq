#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/hiseq4000-paired-3/SM098_CKDL200159916-1a-D711-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/hiseq4000-paired-3/SM098_CKDL200159916-1a-D711-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Anonymomys-mindorensis-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/hiseq4000-paired-3/SM098_CKDL200159916-1a-D711-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Anonymomys-mindorensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Anonymomys-mindorensis/Anonymomys-mindorensis.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Anonymomys-mindorensis/Anonymomys-mindorensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Anonymomys-mindorensis-mosdepth.log
#

#
