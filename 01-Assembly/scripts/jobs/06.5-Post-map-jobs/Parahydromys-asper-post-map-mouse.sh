#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/hiseq4000-paired-1/SM058_CKDL190143344-1a-D704-AK1680_H7275BBXX_L3_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/hiseq4000-paired-1/SM058_CKDL190143344-1a-D704-AK1680_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Parahydromys-asper-hiseq4000-paired-1-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Parahydromys-asper-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Parahydromys-asper-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Parahydromys-asper-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Parahydromys-asper-mouse/Parahydromys-asper-targets-flagstats.txt
