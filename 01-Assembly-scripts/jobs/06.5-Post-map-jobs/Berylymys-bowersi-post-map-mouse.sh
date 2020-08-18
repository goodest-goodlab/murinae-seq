#!/bin/bash
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1/ABTC116431_S41_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1/ABTC116431_S41_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1/ABTC116431_S41_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1/ABTC116431_S41_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-single-1-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2/ABTC116431_S41_L001_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2/ABTC116431_S41_L002_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2/ABTC116431_S41_L003_R1_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2/ABTC116431_S41_L004_R1_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-single-2-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-1/ABTC116431_S17_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-1/ABTC116431_S17_001.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-paired-1-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L002_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L003_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L004_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L002_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L001_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L003_001.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2/ABTC116431_S9_L004_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-paired-2-merge-mouse.log
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/miseq-paired.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/miseq-paired/ABTC116431_S17_L001_001.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/miseq-paired/ABTC116431_S17_L001_001.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-miseq-paired-merge-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-nextseq-single-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-single-1-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-nextseq-single-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-single-2-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-nextseq-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-paired-1-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-nextseq-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-nextseq-paired-2-mkdup-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/miseq-paired.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/miseq-paired.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-miseq-paired-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-miseq-paired-mkdup-mouse.log
#samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-single-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/nextseq-paired-2.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/miseq-paired.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi.bam
#samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-depth.tab
#samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-stats.txt
#samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Berylymys-bowersi-mouse/Berylymys-bowersi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Berylymys-bowersi-mosdepth-mouse.log
