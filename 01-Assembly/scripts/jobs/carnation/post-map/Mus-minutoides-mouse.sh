#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/hiseq2000-paired-2/lane1_CTCTGC_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/hiseq2000-paired-1/10460X2_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-minutoides/Mus-minutoides-flagstats.txt
