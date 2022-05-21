#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L004_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L001_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L002_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-1/JAE3632_S64_L003_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L003_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L004_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L002_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-paired-2/JAE3632_S32_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/miseq-paired/JAE3632_S38_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L004_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L001_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L002_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-single-2/JAE3632_S64_L003_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/nextseq-paired-1/JAE3632_S38_001.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Maxomys-surifer/Maxomys-surifer-flagstats.txt
