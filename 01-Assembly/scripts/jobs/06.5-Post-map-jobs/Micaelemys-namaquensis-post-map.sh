#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/hiseq4000-paired-3/SM108_CKDL200159916-1a-D704-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/hiseq4000-paired-3/SM108_CKDL200159916-1a-D704-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Micaelemys-namaquensis-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/hiseq4000-paired-3/SM108_CKDL200159916-1a-D704-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Micaelemys-namaquensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Micaelemys-namaquensis/Micaelemys-namaquensis.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Micaelemys-namaquensis/Micaelemys-namaquensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Micaelemys-namaquensis-mosdepth.log
#

#

