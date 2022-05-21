#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/hiseq4000-paired-3/SM096_CKDL200159916-1a-D709-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/hiseq4000-paired-3/SM096_CKDL200159916-1a-D709-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Thallomys-paedulcus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/hiseq4000-paired-3/SM096_CKDL200159916-1a-D709-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Thallomys-paedulcus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Thallomys-paedulcus/Thallomys-paedulcus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thallomys-paedulcus/Thallomys-paedulcus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Thallomys-paedulcus-mosdepth.log
#

#

