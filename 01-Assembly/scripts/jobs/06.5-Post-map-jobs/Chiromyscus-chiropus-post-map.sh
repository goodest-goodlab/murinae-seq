#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/hiseq4000-paired-1/SM034_CKDL190143344-1a-D702-AK1680_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/hiseq4000-paired-1/SM034_CKDL190143344-1a-D702-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Chiromyscus-chiropus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/hiseq4000-paired-1/SM034_CKDL190143344-1a-D702-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Chiromyscus-chiropus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Chiromyscus-chiropus/Chiromyscus-chiropus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Chiromyscus-chiropus/Chiromyscus-chiropus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Chiromyscus-chiropus-mosdepth.log
#

#
