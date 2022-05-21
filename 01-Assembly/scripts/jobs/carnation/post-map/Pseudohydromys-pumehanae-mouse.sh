#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/hiseq4000-paired-1/SM073_CKDL190143343-1a-D708-AK1682_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pseudohydromys-ellermani/Pseudohydromys-ellermani-flagstats.txt
