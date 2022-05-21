#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/hiseq4000-paired-3/SM104_CKDL200159916-1a-D705-AK1681_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/hiseq4000-paired-3/SM104_CKDL200159916-1a-D705-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Heimyscus-fumosus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/hiseq4000-paired-3/SM104_CKDL200159916-1a-D705-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Heimyscus-fumosus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Heimyscus-fumosus/Heimyscus-fumosus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Heimyscus-fumosus/Heimyscus-fumosus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Heimyscus-fumosus-mosdepth.log
#

#

