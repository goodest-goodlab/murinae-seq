#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/hiseq4000-paired-3/SM113_CKDL200159916-1a-D709-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/hiseq4000-paired-3/SM113_CKDL200159916-1a-D709-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Stochomys-longicaudatus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/hiseq4000-paired-3/SM113_CKDL200159916-1a-D709-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Stochomys-longicaudatus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Stochomys-longicaudatus/Stochomys-longicaudatus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Stochomys-longicaudatus/Stochomys-longicaudatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Stochomys-longicaudatus-mosdepth.log
#

#

