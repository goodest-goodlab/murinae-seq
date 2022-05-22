#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/hiseq4000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/hiseq4000-paired-2/SM039_CKDL190143345-1a-D707-AK1680_H7275BBXX_L4_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/hiseq4000-paired-2/SM039_CKDL190143345-1a-D707-AK1680_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-lunaris-hiseq4000-paired-2-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/hiseq4000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/hiseq4000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-lunaris-hiseq4000-paired-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/hiseq4000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-lunaris-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hybomys-lunaris-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hybomys-lunaris-mouse/Hybomys-lunaris-targets-flagstats.txt