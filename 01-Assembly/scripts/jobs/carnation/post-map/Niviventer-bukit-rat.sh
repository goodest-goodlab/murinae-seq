#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/hiseq4000-paired-1/SM054_CKDL190143344-1a-D702-AK1682_H7275BBXX_L3_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Niviventer-bukit/Niviventer-bukit-flagstats.txt
