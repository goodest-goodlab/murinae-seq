#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-1/SM085_CKDL190143343-1a-DY0088-AK1543_H7275BBXX_L2_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-1/SM085_CKDL190143343-1a-DY0088-AK1543_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-hiseq4000-paired-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-3.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-3/SM085_CKDL200159916-1a-DY0088-AK1543_HC3LGCCX2_L6_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-3/SM085_CKDL200159916-1a-DY0088-AK1543_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-hiseq4000-paired-3-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-hiseq4000-paired-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-3.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-3.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-hiseq4000-paired-3-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/hiseq4000-paired-3.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Carpomys-melanurus-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Carpomys-melanurus-mouse/Carpomys-melanurus-targets-flagstats.txt
