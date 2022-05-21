#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/hiseq2000-paired-2/lane1_GCAAGA_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/hiseq2000-paired-1/10460X5_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-musculus-reference/Mus-musculus-reference-flagstats.txt
