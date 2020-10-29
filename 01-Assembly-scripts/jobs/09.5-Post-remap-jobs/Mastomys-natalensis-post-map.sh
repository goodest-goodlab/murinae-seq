#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/hiseq4000-paired-3/T4162_CKDL200159916-1a-DY0088-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/hiseq4000-paired-3/T4162_CKDL200159916-1a-DY0088-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mastomys-natalensis-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/hiseq4000-paired-3/T4162_CKDL200159916-1a-DY0088-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mastomys-natalensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mastomys-natalensis/Mastomys-natalensis-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mastomys-natalensis/Mastomys-natalensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mastomys-natalensis-mosdepth.log
#

#

