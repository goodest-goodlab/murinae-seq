#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/hiseq4000-paired-1/SM069_CKDL190143343-1a-D709-AK1681_H7275BBXX_L2_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Phloeomys-cumingii/Phloeomys-cumingii-flagstats.txt
