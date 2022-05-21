#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/seq-run-2/52932_AH7T7NBCX2_TAGGCCG_S15_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/seq-run-2/52932_AH7T7NBCX2_TAGGCCG_S15_L002_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/seq-run-1/52932_AH7T2JBCX2_TAGGCCG_S15_L001_001.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Pseudomys-australis/Pseudomys-australis-flagstats.txt
