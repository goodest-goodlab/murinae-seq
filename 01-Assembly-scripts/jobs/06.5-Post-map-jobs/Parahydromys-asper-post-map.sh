#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/hiseq4000-paired-1/SM058_CKDL190143344-1a-D704-AK1680_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/hiseq4000-paired-1/SM058_CKDL190143344-1a-D704-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Parahydromys-asper-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/hiseq4000-paired-1/SM058_CKDL190143344-1a-D704-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Parahydromys-asper-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Parahydromys-asper/Parahydromys-asper.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper/Parahydromys-asper.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Parahydromys-asper-mosdepth.log
#

#

