#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/hiseq4000-paired-1/REC26_CKDL190143344-1a-D704-AK1546_H7275BBXX_L3_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pogonomelomys-bruijni/Pogonomelomys-bruijni-flagstats.txt
