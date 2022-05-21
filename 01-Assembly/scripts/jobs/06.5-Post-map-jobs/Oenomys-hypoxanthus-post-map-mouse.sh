#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/hiseq4000-paired-1/REC13_CKDL190143344-1a-D701-AK1545_H7275BBXX_L3_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/hiseq4000-paired-1/REC13_CKDL190143344-1a-D701-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Oenomys-hypoxanthus-hiseq4000-paired-1-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Oenomys-hypoxanthus-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Oenomys-hypoxanthus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Oenomys-hypoxanthus-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Oenomys-hypoxanthus-mouse/Oenomys-hypoxanthus-targets-flagstats.txt
