#!/bin/bash
# samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/hiseq4000-paired-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/hiseq4000-paired-1/REC17_CKDL190143344-1a-D705-AK1545_H7275BBXX_L3_.fastp.decon.unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/hiseq4000-paired-1/REC17_CKDL190143344-1a-D705-AK1545_H7275BBXX_L3_.fastp.decon.merged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-xanthurus-hiseq4000-paired-1-merge-mouse.log
# picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/hiseq4000-paired-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/hiseq4000-paired-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-xanthurus-hiseq4000-paired-1-mkdup-mouse.log
#samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/hiseq4000-paired-1.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-xanthurus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus.bam
#samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus-depth.tab
#samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus-stats.txt
#samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Rattus-xanthurus-mouse/Rattus-xanthurus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Rattus-xanthurus-mosdepth-mouse.log
