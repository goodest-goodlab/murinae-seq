#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/hiseq4000-paired-2/REC32_CKDL190143345-1a-D711-AK1546_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/hiseq4000-paired-2/REC32_CKDL190143345-1a-D711-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Abeomelomys-sevia-hiseq4000-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/hiseq4000-paired-3/REC32_CKDL200159916-1a-D711-AK1546_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/hiseq4000-paired-3/REC32_CKDL200159916-1a-D711-AK1546_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Abeomelomys-sevia-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/hiseq4000-paired-2/REC32_CKDL190143345-1a-D711-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/hiseq4000-paired-3/REC32_CKDL200159916-1a-D711-AK1546_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Abeomelomys-sevia-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Abeomelomys-sevia/Abeomelomys-sevia-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Abeomelomys-sevia/Abeomelomys-sevia.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Abeomelomys-sevia-mosdepth.log
#

#

