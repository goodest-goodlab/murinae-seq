#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/hiseq4000-paired-3/A_M29_CKDL200159916-1a-D701-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/hiseq4000-paired-3/A_M29_CKDL200159916-1a-D701-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-morotaiensis-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/hiseq4000-paired-3/A_M29_CKDL200159916-1a-D701-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-morotaiensis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Rattus-morotaiensis/Rattus-morotaiensis.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-morotaiensis/Rattus-morotaiensis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-morotaiensis-mosdepth.log
#

#

