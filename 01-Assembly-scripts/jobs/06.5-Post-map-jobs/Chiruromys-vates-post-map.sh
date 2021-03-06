#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/hiseq4000-paired-2/SM035_CKDL190143345-1a-D706-AK1680_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/hiseq4000-paired-2/SM035_CKDL190143345-1a-D706-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Chiruromys-vates-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/hiseq4000-paired-2/SM035_CKDL190143345-1a-D706-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Chiruromys-vates-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Chiruromys-vates/Chiruromys-vates.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiruromys-vates/Chiruromys-vates.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Chiruromys-vates-mosdepth.log
#

#

