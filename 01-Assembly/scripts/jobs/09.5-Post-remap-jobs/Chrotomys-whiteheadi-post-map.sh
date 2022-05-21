#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/hiseq4000-paired-2/REC34_CKDL190143345-1a-D704-AK1780_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/hiseq4000-paired-2/REC34_CKDL190143345-1a-D704-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Chrotomys-whiteheadi-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/hiseq4000-paired-2/REC34_CKDL190143345-1a-D704-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Chrotomys-whiteheadi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Chrotomys-whiteheadi/Chrotomys-whiteheadi-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Chrotomys-whiteheadi/Chrotomys-whiteheadi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Chrotomys-whiteheadi-mosdepth.log
#

#

