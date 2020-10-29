#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/hiseq4000-paired-3/SM094_CKDL200159916-1a-D707-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/hiseq4000-paired-3/SM094_CKDL200159916-1a-D707-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-celebensis-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/hiseq4000-paired-3/SM094_CKDL200159916-1a-D707-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-celebensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Taeromys-celebensis/Taeromys-celebensis-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-celebensis/Taeromys-celebensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-celebensis-mosdepth.log
#

#

