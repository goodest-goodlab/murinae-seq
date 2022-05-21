#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/hiseq4000-paired-1/SM040_CKDL190143343-1a-DY0088-AK1681_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Hybomys-planifrons/Hybomys-planifrons-flagstats.txt
