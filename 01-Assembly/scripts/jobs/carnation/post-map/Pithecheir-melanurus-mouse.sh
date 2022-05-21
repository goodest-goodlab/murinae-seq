#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/hiseq4000-paired-1/SM070_CKDL190143343-1a-D710-AK1681_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Pithecheir-melanurus/Pithecheir-melanurus-flagstats.txt
