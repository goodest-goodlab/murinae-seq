#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/hiseq4000-paired-1/SM071_CKDL190143343-1a-D707-AK1682_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/hiseq4000-paired-1/SM071_CKDL190143343-1a-D707-AK1682_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomys-macrourus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/hiseq4000-paired-1/SM071_CKDL190143343-1a-D707-AK1682_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomys-macrourus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Pogonomys-macrourus/Pogonomys-macrourus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomys-macrourus/Pogonomys-macrourus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomys-macrourus-mosdepth.log
#

#

