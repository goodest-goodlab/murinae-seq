#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/hiseq4000-paired-2/SM081_CKDL190143345-1a-D710-AK1780_H7275BBXX_L4_.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedRat/Zelotomys-woosnami/Zelotomys-woosnami-flagstats.txt
