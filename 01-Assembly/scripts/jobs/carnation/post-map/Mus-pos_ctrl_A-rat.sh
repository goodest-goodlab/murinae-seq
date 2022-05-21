#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/hiseq4000-paired-2/M44_A12_CKDL190143345-1a-D712-AK1680_H7275BBXX_L4_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_A/Mus-pos_ctrl_A-flagstats.txt
