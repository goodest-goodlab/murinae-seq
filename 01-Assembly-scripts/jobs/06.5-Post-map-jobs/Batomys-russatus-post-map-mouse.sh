#!/bin/bash
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/hiseq4000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/hiseq4000-paired-2/REC28_CKDL190143345-1a-D706-AK1546_H7275BBXX_L4_.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/hiseq4000-paired-2/REC28_CKDL190143345-1a-D706-AK1546_H7275BBXX_L4_.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Batomys-russatus-hiseq4000-paired-2-merge-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/hiseq4000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/hiseq4000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Batomys-russatus-hiseq4000-paired-2-mkdup-mouse.log
#samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/hiseq4000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Batomys-russatus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus.bam
#samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus-depth.tab
#samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus-stats.txt
#samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Batomys-russatus-mouse/Batomys-russatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Batomys-russatus-mosdepth-mouse.log
