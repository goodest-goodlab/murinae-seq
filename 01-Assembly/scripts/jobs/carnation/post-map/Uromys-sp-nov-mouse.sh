#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/hiseq4000-paired-1/REC25_CKDL190143344-1a-DY0088-AK1546_H7275BBXX_L3_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Uromys-sp-nov/Uromys-sp-nov-flagstats.txt
