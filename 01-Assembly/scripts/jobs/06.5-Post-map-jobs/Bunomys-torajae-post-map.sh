#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/hiseq4000-paired-3/SM093_CKDL200159916-1a-D706-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/hiseq4000-paired-3/SM093_CKDL200159916-1a-D706-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Bunomys-torajae-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/hiseq4000-paired-3/SM093_CKDL200159916-1a-D706-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Bunomys-torajae-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Bunomys-torajae/Bunomys-torajae.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Bunomys-torajae/Bunomys-torajae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Bunomys-torajae-mosdepth.log
#

#

