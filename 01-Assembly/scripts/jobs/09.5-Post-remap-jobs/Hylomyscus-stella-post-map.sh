#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/hiseq4000-paired-1/REC10_CKDL190143343-1a-D708-AK1544_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/hiseq4000-paired-1/REC10_CKDL190143343-1a-D708-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hylomyscus-stella-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/hiseq4000-paired-1/REC10_CKDL190143343-1a-D708-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hylomyscus-stella-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Hylomyscus-stella/Hylomyscus-stella-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hylomyscus-stella/Hylomyscus-stella.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hylomyscus-stella-mosdepth.log
#

#

