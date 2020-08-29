#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1/Z25191_S46_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1/Z25191_S46_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1/Z25191_S46_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1/Z25191_S46_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-nextseq-single-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2/Z25191_S46_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2/Z25191_S46_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2/Z25191_S46_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2/Z25191_S46_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-nextseq-single-2-merge-mouse.log
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2/Z25191_S14_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2/Z25191_S14_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2/Z25191_S14_L004_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2/Z25191_S14_L003_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-nextseq-paired-2-merge-mouse.log
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-nextseq-single-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-nextseq-single-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-1/Z25191_S21_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-1/Z25191_S21_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-nextseq-paired-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-nextseq-paired-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/miseq-paired/Z25191_S21_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/miseq-paired/Z25191_S21_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-miseq-paired-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-1/Z25191_S21_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/miseq-paired/Z25191_S21_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Leopoldomys-sabanus-mouse/Leopoldomys-sabanus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Leopoldomys-sabanus-mosdepth-mouse.log
