#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/hiseq4000-paired-3/SM095_CKDL200159916-1a-D708-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/hiseq4000-paired-3/SM095_CKDL200159916-1a-D708-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-hamatus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/hiseq4000-paired-3/SM095_CKDL200159916-1a-D708-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-hamatus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Taeromys-hamatus/Taeromys-hamatus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Taeromys-hamatus/Taeromys-hamatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Taeromys-hamatus-mosdepth.log
#

#

