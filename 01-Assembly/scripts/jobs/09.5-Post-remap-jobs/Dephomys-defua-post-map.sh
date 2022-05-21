#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/hiseq4000-paired-3/SM101_CKDL200159916-1a-D702-AK1681_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/hiseq4000-paired-3/SM101_CKDL200159916-1a-D702-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Dephomys-defua-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/hiseq4000-paired-3/SM101_CKDL200159916-1a-D702-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Dephomys-defua-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Dephomys-defua/Dephomys-defua-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Dephomys-defua/Dephomys-defua.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Dephomys-defua-mosdepth.log
#

#

