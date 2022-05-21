#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/hiseq4000-paired-3/SM105_CKDL200159916-1a-D701-AK1682_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/hiseq4000-paired-3/SM105_CKDL200159916-1a-D701-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lophiomys-imhausi-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/hiseq4000-paired-3/SM105_CKDL200159916-1a-D701-AK1682_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lophiomys-imhausi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Lophiomys-imhausi/Lophiomys-imhausi-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lophiomys-imhausi/Lophiomys-imhausi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lophiomys-imhausi-mosdepth.log
#

#

