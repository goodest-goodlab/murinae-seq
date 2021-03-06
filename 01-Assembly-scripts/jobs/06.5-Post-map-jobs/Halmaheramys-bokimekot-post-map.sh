#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/hiseq4000-paired-2/REC22_CKDL190143345-1a-D710-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/hiseq4000-paired-2/REC22_CKDL190143345-1a-D710-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Halmaheramys-bokimekot-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/hiseq4000-paired-2/REC22_CKDL190143345-1a-D710-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Halmaheramys-bokimekot-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Halmaheramys-bokimekot/Halmaheramys-bokimekot.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Halmaheramys-bokimekot-mosdepth.log
#

#

