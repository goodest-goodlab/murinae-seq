#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/hiseq4000-paired-3.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/hiseq4000-paired-3/SM099_CKDL200159916-1a-D712-AK1680_HC3LGCCX2_L6_.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/hiseq4000-paired-3/SM099_CKDL200159916-1a-D712-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-neumanni-hiseq4000-paired-3-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/hiseq4000-paired-3.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/hiseq4000-paired-3.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-neumanni-hiseq4000-paired-3-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/hiseq4000-paired-3.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-neumanni-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-neumanni-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni-mouse/Arvicanthus-neumanni-targets-flagstats.txt
