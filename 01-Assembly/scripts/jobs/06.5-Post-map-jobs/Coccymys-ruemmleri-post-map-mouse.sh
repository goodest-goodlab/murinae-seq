#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/hiseq4000-paired-1/SM033_CKDL190143343-1a-D702-AK1681_H7275BBXX_L2_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/hiseq4000-paired-1/SM033_CKDL190143343-1a-D702-AK1681_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Coccymys-ruemmleri-hiseq4000-paired-1-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Coccymys-ruemmleri-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Coccymys-ruemmleri-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Coccymys-ruemmleri-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Coccymys-ruemmleri-mouse/Coccymys-ruemmleri-targets-flagstats.txt
