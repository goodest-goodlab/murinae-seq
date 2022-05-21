#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/hiseq4000-paired-2/M44_G11_CKDL190143345-1a-D711-AK1545_H7275BBXX_L4_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Mus-pos_ctrl_G/Mus-pos_ctrl_G-flagstats.txt
