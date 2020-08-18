#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1/JAE4870_S66_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1/JAE4870_S66_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1/JAE4870_S66_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1/JAE4870_S66_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-single-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2/JAE4870_S66_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2/JAE4870_S66_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2/JAE4870_S66_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2/JAE4870_S66_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-single-2-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-1/JAE4870_S40_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-1/JAE4870_S40_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-paired-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L001_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L002_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L002_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L003_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L003_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L004_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2/JAE4870_S35_L004_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-paired-2-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/miseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/miseq-paired/JAE4870_S40_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/miseq-paired/JAE4870_S40_L001_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-miseq-paired-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-single-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-single-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-nextseq-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/miseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/miseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-miseq-paired-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/miseq-paired.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Paruromys-dominator/Paruromys-dominator.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Paruromys-dominator/Paruromys-dominator.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Paruromys-dominator-mosdepth.log