#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/hiseq4000-paired-1/SM044_CKDL190143343-1a-D704-AK1681_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Leptomys-elegans/Leptomys-elegans-flagstats.txt
