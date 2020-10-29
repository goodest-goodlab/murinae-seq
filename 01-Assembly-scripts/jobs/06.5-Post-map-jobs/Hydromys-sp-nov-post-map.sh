#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/hiseq4000-paired-1/REC9_CKDL190143343-1a-D707-AK1544_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/hiseq4000-paired-1/REC9_CKDL190143343-1a-D707-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-sp-nov-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/hiseq4000-paired-1/REC9_CKDL190143343-1a-D707-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-sp-nov-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Hydromys-sp-nov/Hydromys-sp-nov.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hydromys-sp-nov/Hydromys-sp-nov.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hydromys-sp-nov-mosdepth.log
#

#

