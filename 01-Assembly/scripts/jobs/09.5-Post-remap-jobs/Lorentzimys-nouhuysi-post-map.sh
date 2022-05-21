#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1/ABTC46314_S55_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1/ABTC46314_S55_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1/ABTC46314_S55_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1/ABTC46314_S55_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2/ABTC46314_S55_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2/ABTC46314_S55_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2/ABTC46314_S55_L004_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2/ABTC46314_S55_L003_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-nextseq-single-2-merge.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2/ABTC46314_S24_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2/ABTC46314_S24_L003_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2/ABTC46314_S24_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2/ABTC46314_S24_L004_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-nextseq-paired-2-merge.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-1/ABTC-46314_S30_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-1/ABTC-46314_S30_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/miseq-paired/ABTC-46314_S30_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/miseq-paired/ABTC-46314_S30_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-1/ABTC-46314_S30_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/miseq-paired/ABTC-46314_S30_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Lorentzimys-nouhuysi/Lorentzimys-nouhuysi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Lorentzimys-nouhuysi-mosdepth.log
#

#

