#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/hiseq4000-paired-1/SM054_CKDL190143344-1a-D702-AK1682_H7275BBXX_L3_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/hiseq4000-paired-1/SM054_CKDL190143344-1a-D702-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Niviventer-bukit-hiseq4000-paired-1-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Niviventer-bukit-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Niviventer-bukit-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Niviventer-bukit-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Niviventer-bukit-mouse/Niviventer-bukit-targets-flagstats.txt
