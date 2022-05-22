#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/hiseq4000-paired-1/REC25_CKDL190143344-1a-DY0088-AK1546_H7275BBXX_L3_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/hiseq4000-paired-1/REC25_CKDL190143344-1a-DY0088-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Uromys-sp-nov-hiseq4000-paired-1-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Uromys-sp-nov-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Uromys-sp-nov-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Uromys-sp-nov-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-sp-nov-mouse/Uromys-sp-nov-targets-flagstats.txt