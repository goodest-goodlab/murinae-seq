#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/hiseq4000-paired-2/REC30_CKDL190143345-1a-D708-AK1546_H7275BBXX_L4_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-musculoides/Mus-musculoides-flagstats.txt
