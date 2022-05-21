#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/hiseq4000-paired-1/SM051_CKDL190143344-1a-D706-AK1681_H7275BBXX_L3_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/hiseq4000-paired-1/SM051_CKDL190143344-1a-D706-AK1681_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mirzamys-louiseae-hiseq4000-paired-1-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mirzamys-louiseae-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mirzamys-louiseae-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mirzamys-louiseae-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mirzamys-louiseae-mouse/Mirzamys-louiseae-targets-flagstats.txt
