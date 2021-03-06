#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/hiseq4000-paired-2/REC19_CKDL190143345-1a-D707-AK1545_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/hiseq4000-paired-2/REC19_CKDL190143345-1a-D707-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-callitrichus-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/hiseq4000-paired-2/REC19_CKDL190143345-1a-D707-AK1545_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-callitrichus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Taeromys-callitrichus/Taeromys-callitrichus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-callitrichus/Taeromys-callitrichus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-callitrichus-mosdepth.log
#

#

