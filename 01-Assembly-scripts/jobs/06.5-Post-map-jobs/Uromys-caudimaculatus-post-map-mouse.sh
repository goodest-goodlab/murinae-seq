#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/hiseq4000-paired-1/SM078_CKDL190143344-1a-D707-AK1780_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/hiseq4000-paired-1/SM078_CKDL190143344-1a-D707-AK1780_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Uromys-caudimaculatus-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/hiseq4000-paired-1/SM078_CKDL190143344-1a-D707-AK1780_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Uromys-caudimaculatus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Uromys-caudimaculatus-mouse/Uromys-caudimaculatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Uromys-caudimaculatus-mosdepth-mouse.log
