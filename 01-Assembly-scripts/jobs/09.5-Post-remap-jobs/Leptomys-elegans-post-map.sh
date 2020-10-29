#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/hiseq4000-paired-1/SM044_CKDL190143343-1a-D704-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/hiseq4000-paired-1/SM044_CKDL190143343-1a-D704-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leptomys-elegans-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/hiseq4000-paired-1/SM044_CKDL190143343-1a-D704-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leptomys-elegans-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Leptomys-elegans/Leptomys-elegans-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leptomys-elegans/Leptomys-elegans.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leptomys-elegans-mosdepth.log
#

#

