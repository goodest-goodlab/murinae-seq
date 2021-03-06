#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/hiseq4000-paired-1/SM055_CKDL190143344-1a-DY0088-AK1682_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/hiseq4000-paired-1/SM055_CKDL190143344-1a-DY0088-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Niviventer-cremoriventer-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/hiseq4000-paired-1/SM055_CKDL190143344-1a-DY0088-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Niviventer-cremoriventer-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Niviventer-cremoriventer/Niviventer-cremoriventer.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-cremoriventer/Niviventer-cremoriventer.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Niviventer-cremoriventer-mosdepth.log
#

#

