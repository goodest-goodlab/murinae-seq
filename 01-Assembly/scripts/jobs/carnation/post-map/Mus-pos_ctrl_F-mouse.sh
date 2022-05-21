#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/hiseq4000-paired-1/M44_F11_CKDL190143343-1a-D711-AK1544_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Mus-pos_ctrl_F/Mus-pos_ctrl_F-flagstats.txt
