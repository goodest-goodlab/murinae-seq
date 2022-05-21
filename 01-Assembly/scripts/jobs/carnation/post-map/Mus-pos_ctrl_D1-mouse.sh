#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/hiseq4000-paired-1/M44_D11_CKDL190143344-1a-D711-AK1780_H7275BBXX_L3_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_D1/Mus-pos_ctrl_D1-flagstats.txt
