#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1/ABTC44798_S58_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1/ABTC44798_S58_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1/ABTC44798_S58_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1/ABTC44798_S58_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2/ABTC44798_S58_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2/ABTC44798_S58_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2/ABTC44798_S58_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2/ABTC44798_S58_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2/ABTC44798_S26_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2/ABTC44798_S26_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2/ABTC44798_S26_L004_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2/ABTC44798_S26_L003_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-1/ABTC-44798_S32_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-1/ABTC-44798_S32_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/miseq-paired/ABTC-44798_S32_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/miseq-paired/ABTC-44798_S32_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-1/ABTC-44798_S32_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/miseq-paired/ABTC-44798_S32_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Melomys-rufescens/Melomys-rufescens.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Melomys-rufescens/Melomys-rufescens.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Melomys-rufescens-mosdepth.log
#

#

