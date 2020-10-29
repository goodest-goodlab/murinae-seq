#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/hiseq4000-paired-3/SM108_CKDL200159916-1a-D704-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/hiseq4000-paired-3/SM108_CKDL200159916-1a-D704-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Micaelemys-namaquensis-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/hiseq4000-paired-3/SM108_CKDL200159916-1a-D704-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Micaelemys-namaquensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Micaelemys-namaquensis/Micaelemys-namaquensis-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Micaelemys-namaquensis/Micaelemys-namaquensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Micaelemys-namaquensis-mosdepth.log
#

#

