#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/hiseq4000-paired-1/SM084_CKDL190143343-1a-D702-AK1543_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Aethomys-nyikae/Aethomys-nyikae-flagstats.txt
