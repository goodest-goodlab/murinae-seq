#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1/Z27993_S43_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1/Z27993_S43_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1/Z27993_S43_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1/Z27993_S43_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-single-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2/Z27993_S43_L001_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2/Z27993_S43_L002_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2/Z27993_S43_L003_R1_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2/Z27993_S43_L004_R1_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-single-2-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-1/Z27993_S19_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-1/Z27993_S19_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-paired-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2/Z27993_S11_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2/Z27993_S11_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2/Z27993_S11_L004_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2/Z27993_S11_L003_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-paired-2-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/miseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/miseq-paired/Z27993_S19_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/miseq-paired/Z27993_S19_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-miseq-paired-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-single-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-single-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-paired-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-nextseq-paired-2-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/miseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/miseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-miseq-paired-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/miseq-paired.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Echiothrix-centrosa-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Echiothrix-centrosa-mouse/Echiothrix-centrosa-targets-flagstats.txt
