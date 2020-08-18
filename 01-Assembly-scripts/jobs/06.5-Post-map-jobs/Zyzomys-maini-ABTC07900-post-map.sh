#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-1/Zyzomys_maini_ABTC07900_L001_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-1/Zyzomys_maini_ABTC07900_L001_unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zyzomys-maini-ABTC07900-seq-run-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2/Zyzomys_maini_ABTC07900_L001_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2/Zyzomys_maini_ABTC07900_L002_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2/Zyzomys_maini_ABTC07900_L001_unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2/Zyzomys_maini_ABTC07900_L002_unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zyzomys-maini-ABTC07900-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zyzomys-maini-ABTC07900-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zyzomys-maini-ABTC07900-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zyzomys-maini-ABTC07900-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Zyzomys-maini-ABTC07900/Zyzomys-maini-ABTC07900.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Zyzomys-maini-ABTC07900-mosdepth.log