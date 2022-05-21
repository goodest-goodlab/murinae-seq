#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/hiseq4000-paired-3/A42697_CKDL200159916-1a-D702-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/hiseq4000-paired-3/A42697_CKDL200159916-1a-D702-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyomys-goliath-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/hiseq4000-paired-3/A42697_CKDL200159916-1a-D702-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyomys-goliath-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Hyomys-goliath/Hyomys-goliath-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Hyomys-goliath-mosdepth.log
#

#

