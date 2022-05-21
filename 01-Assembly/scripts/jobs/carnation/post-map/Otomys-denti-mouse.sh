#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/hiseq4000-paired-1/REC14_CKDL190143344-1a-D702-AK1545_H7275BBXX_L3_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Otomys-denti/Otomys-denti-flagstats.txt
