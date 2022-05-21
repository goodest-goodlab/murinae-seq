#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/hiseq4000-paired-3/SM036_CKDL200159916-1a-D704-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/hiseq4000-paired-3/SM036_CKDL200159916-1a-D704-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crossomys-moncktoni-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/hiseq4000-paired-3/SM036_CKDL200159916-1a-D704-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crossomys-moncktoni-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Crossomys-moncktoni/Crossomys-moncktoni.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crossomys-moncktoni/Crossomys-moncktoni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crossomys-moncktoni-mosdepth.log
#

#

