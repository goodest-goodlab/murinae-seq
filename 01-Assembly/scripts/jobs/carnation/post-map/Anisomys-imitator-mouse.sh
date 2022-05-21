#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/hiseq4000-paired-1/SM008_CKDL190143343-1a-D701-AK1681_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Anisomys-imitator/Anisomys-imitator-flagstats.txt
