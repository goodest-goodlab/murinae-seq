#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/hiseq4000-paired-3/SM112_CKDL200159916-1a-D708-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/hiseq4000-paired-3/SM112_CKDL200159916-1a-D708-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rhabdomys-pumilio-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/hiseq4000-paired-3/SM112_CKDL200159916-1a-D708-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rhabdomys-pumilio-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Rhabdomys-pumilio/Rhabdomys-pumilio-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Rhabdomys-pumilio/Rhabdomys-pumilio.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Rhabdomys-pumilio-mosdepth.log
#

#

