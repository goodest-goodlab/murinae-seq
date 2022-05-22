#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-1/TCD4175_S35_L004_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-1/TCD4175_S35_L002_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-1/TCD4175_S35_L001_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-1/TCD4175_S35_L003_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-paired-2/TCD4175_S3_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-paired-2/TCD4175_S3_L002_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-paired-2/TCD4175_S3_L003_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-paired-2/TCD4175_S3_L004_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/miseq-paired/TCD4175_S11_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-2/TCD4175_S35_L004_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-2/TCD4175_S35_L002_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-2/TCD4175_S35_L001_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-single-2/TCD4175_S35_L003_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/nextseq-paired-1/TCD4175_S11_001.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Colomys-goslingi/Colomys-goslingi-flagstats.txt