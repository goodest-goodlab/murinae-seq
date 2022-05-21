#!/bin/bash
samtools merge -r /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi.sorted.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-1/TCD4312_S38_L002_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-1/TCD4312_S38_L003_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-1/TCD4312_S38_L004_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-1/TCD4312_S38_L001_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-paired-2/TCD4312_S6_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-paired-2/TCD4312_S6_L003_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-paired-2/TCD4312_S6_L002_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-paired-2/TCD4312_S6_L004_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/miseq-paired/TCD4312_S14_L001_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-2/TCD4312_S38_L002_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-2/TCD4312_S38_L003_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-2/TCD4312_S38_L004_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-single-2/TCD4312_S38_L001_R1_001.fastp.decon.bam /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/nextseq-paired-1/TCD4312_S14_001.fastp.decon.bam
java -jar ~/bin/picard.jar MarkDuplicates I=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi.sorted.bam O=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi.sorted.mkdup.bam M=/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-mkdup-metrics.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-target-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-target-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-avg-target-depth.txt
samtools depth -b /scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-tile-depth.tab
awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-tile-depth.tab > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-avg-tile-depth.txt
samtools flagstat /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi.sorted.mkdup.bam > /scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/Praomys-degraaffi/Praomys-degraaffi-flagstats.txt
