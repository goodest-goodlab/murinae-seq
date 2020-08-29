#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/hiseq4000-paired-1/REC26_CKDL190143344-1a-D704-AK1546_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/hiseq4000-paired-1/REC26_CKDL190143344-1a-D704-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomelomys-bruijni-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/hiseq4000-paired-1/REC26_CKDL190143344-1a-D704-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomelomys-bruijni-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pogonomelomys-bruijni-mouse/Pogonomelomys-bruijni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pogonomelomys-bruijni-mosdepth-mouse.log
