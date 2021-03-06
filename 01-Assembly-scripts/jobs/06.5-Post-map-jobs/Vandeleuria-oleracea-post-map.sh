#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/hiseq4000-paired-2/SM079_CKDL190143345-1a-D708-AK1780_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/hiseq4000-paired-2/SM079_CKDL190143345-1a-D708-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Vandeleuria-oleracea-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/hiseq4000-paired-2/SM079_CKDL190143345-1a-D708-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Vandeleuria-oleracea-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Vandeleuria-oleracea/Vandeleuria-oleracea.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Vandeleuria-oleracea/Vandeleuria-oleracea.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Vandeleuria-oleracea-mosdepth.log
#

#

