#!/bin/bash
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/hiseq4000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/hiseq4000-paired-2/REC29_CKDL190143345-1a-D707-AK1546_H7275BBXX_L4_.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/hiseq4000-paired-2/REC29_CKDL190143345-1a-D707-AK1546_H7275BBXX_L4_.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-incomtus-hiseq4000-paired-2-merge-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/hiseq4000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/hiseq4000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-incomtus-hiseq4000-paired-2-mkdup-mouse.log
#samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/hiseq4000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-incomtus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus.bam
#samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus-depth.tab
#samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus-stats.txt
#samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Dasymys-incomtus-mouse/Dasymys-incomtus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Dasymys-incomtus-mosdepth-mouse.log
