#!/bin/bash
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/hiseq4000-paired-1/SM089_CKDL190143343-1a-D707-AK1543_H7275BBXX_L2_.fastp.decon.merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/hiseq4000-paired-1/SM089_CKDL190143343-1a-D707-AK1543_H7275BBXX_L2_.fastp.decon.unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Limnomys-sibuanus-hiseq4000-paired-1-merge-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Limnomys-sibuanus-hiseq4000-paired-1-mkdup-mouse.log
#samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Limnomys-sibuanus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus.bam
#samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus-depth.tab
#samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus-stats.txt
#samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Limnomys-sibuanus-mouse/Limnomys-sibuanus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Limnomys-sibuanus-mosdepth-mouse.log
