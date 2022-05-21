#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/hiseq4000-paired-3/SM106_CKDL200159916-1a-D702-AK1544_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/hiseq4000-paired-3/SM106_CKDL200159916-1a-D702-AK1544_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lophuromys-woosnami-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/hiseq4000-paired-3/SM106_CKDL200159916-1a-D702-AK1544_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lophuromys-woosnami-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Lophuromys-woosnami/Lophuromys-woosnami-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophuromys-woosnami/Lophuromys-woosnami.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lophuromys-woosnami-mosdepth.log
#

#

