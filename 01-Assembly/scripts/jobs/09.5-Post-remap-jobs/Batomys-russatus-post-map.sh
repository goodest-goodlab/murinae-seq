#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/hiseq4000-paired-2/REC28_CKDL190143345-1a-D706-AK1546_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/hiseq4000-paired-2/REC28_CKDL190143345-1a-D706-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Batomys-russatus-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/hiseq4000-paired-2/REC28_CKDL190143345-1a-D706-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Batomys-russatus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Batomys-russatus/Batomys-russatus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Batomys-russatus/Batomys-russatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Batomys-russatus-mosdepth.log
#

#

