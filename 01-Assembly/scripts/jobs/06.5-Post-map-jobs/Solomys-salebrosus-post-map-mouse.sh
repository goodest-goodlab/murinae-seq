#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/hiseq4000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/hiseq4000-paired-2/SM076_CKDL190143345-1a-D705-AK1780_H7275BBXX_L4_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/hiseq4000-paired-2/SM076_CKDL190143345-1a-D705-AK1780_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Solomys-salebrosus-hiseq4000-paired-2-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/hiseq4000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/hiseq4000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Solomys-salebrosus-hiseq4000-paired-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/hiseq4000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Solomys-salebrosus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Solomys-salebrosus-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Solomys-salebrosus-mouse/Solomys-salebrosus-targets-flagstats.txt