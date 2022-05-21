#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/hiseq4000-paired-1/REC10_CKDL190143343-1a-D708-AK1544_H7275BBXX_L2_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/hiseq4000-paired-1/REC10_CKDL190143343-1a-D708-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-stella-hiseq4000-paired-1-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-stella-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-stella-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Hylomyscus-stella-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Hylomyscus-stella-mouse/Hylomyscus-stella-targets-flagstats.txt
