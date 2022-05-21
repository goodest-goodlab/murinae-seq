#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/hiseq4000-paired-2/SM045_CKDL190143345-1a-D709-AK1680_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/hiseq4000-paired-2/SM045_CKDL190143345-1a-D709-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Macruromys-major-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/hiseq4000-paired-2/SM045_CKDL190143345-1a-D709-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Macruromys-major-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Macruromys-major/Macruromys-major-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Macruromys-major/Macruromys-major.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Macruromys-major-mosdepth.log
#

#

