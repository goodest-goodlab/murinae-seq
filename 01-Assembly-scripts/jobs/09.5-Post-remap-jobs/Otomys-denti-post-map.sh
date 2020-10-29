#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/hiseq4000-paired-1/REC14_CKDL190143344-1a-D702-AK1545_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/hiseq4000-paired-1/REC14_CKDL190143344-1a-D702-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Otomys-denti-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/hiseq4000-paired-1/REC14_CKDL190143344-1a-D702-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Otomys-denti-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Otomys-denti/Otomys-denti-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-denti/Otomys-denti.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Otomys-denti-mosdepth.log
#

#

