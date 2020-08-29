#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-1.merge.bam  &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-australis-M25541-seq-run-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-2.merge.bam  &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-australis-M25541-seq-run-2-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-australis-M25541-seq-run-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-australis-M25541-seq-run-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-australis-M25541-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-australis-M25541-mouse/Pseudomys-australis-M25541.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-australis-M25541-mosdepth-mouse.log
