#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/hiseq4000-paired-2/REC22_CKDL190143345-1a-D710-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/hiseq4000-paired-2/REC22_CKDL190143345-1a-D710-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Halmaheramys-bokimekot-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/hiseq4000-paired-2/REC22_CKDL190143345-1a-D710-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Halmaheramys-bokimekot-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Halmaheramys-bokimekot/Halmaheramys-bokimekot-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Halmaheramys-bokimekot/Halmaheramys-bokimekot.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Halmaheramys-bokimekot-mosdepth.log
#

#

