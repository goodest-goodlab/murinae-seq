#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1/Mastacomys_fuscus_M13957_L002_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1/Mastacomys_fuscus_M13957_L001_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1/Mastacomys_fuscus_M13957_L001_unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1/Mastacomys_fuscus_M13957_L002_unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mastacomys-fuscus-M13957-seq-run-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2/Mastacomys_fuscus_M13957_L001_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2/Mastacomys_fuscus_M13957_L002_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2/Mastacomys_fuscus_M13957_L001_unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2/Mastacomys_fuscus_M13957_L002_unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mastacomys-fuscus-M13957-seq-run-2-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mastacomys-fuscus-M13957-seq-run-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mastacomys-fuscus-M13957-seq-run-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mastacomys-fuscus-M13957-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mastacomys-fuscus-M13957-mouse/Mastacomys-fuscus-M13957.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mastacomys-fuscus-M13957-mosdepth-mouse.log
