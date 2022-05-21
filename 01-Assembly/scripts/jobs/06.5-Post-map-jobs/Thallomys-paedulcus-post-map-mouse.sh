#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/hiseq4000-paired-3.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/hiseq4000-paired-3/SM096_CKDL200159916-1a-D709-AK1680_HC3LGCCX2_L6_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/hiseq4000-paired-3/SM096_CKDL200159916-1a-D709-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thallomys-paedulcus-hiseq4000-paired-3-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/hiseq4000-paired-3.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/hiseq4000-paired-3.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thallomys-paedulcus-hiseq4000-paired-3-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/hiseq4000-paired-3.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thallomys-paedulcus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thallomys-paedulcus-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thallomys-paedulcus-mouse/Thallomys-paedulcus-targets-flagstats.txt
