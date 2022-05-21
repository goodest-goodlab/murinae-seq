#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/hiseq4000-paired-1/SM055_CKDL190143344-1a-DY0088-AK1682_H7275BBXX_L3_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Niviventer-cremoriventer/Niviventer-cremoriventer-flagstats.txt
