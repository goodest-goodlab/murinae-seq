#!/bin/bash
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1/JLP25862_S31_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1/JLP25862_S31_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1/JLP25862_S31_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1/JLP25862_S31_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-single-1-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2/JLP25862_S31_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2/JLP25862_S31_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2/JLP25862_S31_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2/JLP25862_S31_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-single-2-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-1/JLP25862_S8_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-1/JLP25862_S8_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-paired-1-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L002_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L003_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L004_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L001_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L002_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L004_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2/JLP25862_S39_L003_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-paired-2-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/miseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/miseq-paired/JLP25862_S8_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/miseq-paired/JLP25862_S8_L001_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-miseq-paired-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/hiseq4000-paired-1/SM077_CKDL190143344-1a-D706-AK1780_H7275BBXX_L3_.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/hiseq4000-paired-1/SM077_CKDL190143344-1a-D706-AK1780_H7275BBXX_L3_.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-hiseq4000-paired-1-merge-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-single-1-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-single-2-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-paired-1-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-nextseq-paired-2-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/miseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/miseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-miseq-paired-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-hiseq4000-paired-1-mkdup-mouse.log
#samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/miseq-paired.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans.bam
#samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-depth.tab
#samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-stats.txt
#samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Taeromys-punicans-mouse/Taeromys-punicans.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Taeromys-punicans-mosdepth-mouse.log