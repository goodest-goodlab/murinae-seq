#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/hiseq4000-paired-1/SM070_CKDL190143343-1a-D710-AK1681_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/hiseq4000-paired-1/SM070_CKDL190143343-1a-D710-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pithecheir-melanurus-hiseq4000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/hiseq4000-paired-3/SM070_CKDL200159916-1a-D710-AK1681_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/hiseq4000-paired-3/SM070_CKDL200159916-1a-D710-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pithecheir-melanurus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/hiseq4000-paired-1/SM070_CKDL190143343-1a-D710-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/hiseq4000-paired-3/SM070_CKDL200159916-1a-D710-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pithecheir-melanurus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Pithecheir-melanurus/Pithecheir-melanurus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pithecheir-melanurus/Pithecheir-melanurus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pithecheir-melanurus-mosdepth.log
#

#

