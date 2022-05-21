#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/hiseq4000-paired-1/SM059_CKDL190143344-1a-D705-AK1682_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/hiseq4000-paired-1/SM059_CKDL190143344-1a-D705-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Genus-sp-nov-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/hiseq4000-paired-1/SM059_CKDL190143344-1a-D705-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Genus-sp-nov-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Genus-sp-nov/Genus-sp-nov.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Genus-sp-nov/Genus-sp-nov.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Genus-sp-nov-mosdepth.log
#

#

