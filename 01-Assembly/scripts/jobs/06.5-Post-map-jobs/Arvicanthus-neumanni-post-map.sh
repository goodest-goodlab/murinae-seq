#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/hiseq4000-paired-3/SM099_CKDL200159916-1a-D712-AK1680_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/hiseq4000-paired-3/SM099_CKDL200159916-1a-D712-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-neumanni-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/hiseq4000-paired-3/SM099_CKDL200159916-1a-D712-AK1680_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-neumanni-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Arvicanthus-neumanni/Arvicanthus-neumanni.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-neumanni/Arvicanthus-neumanni.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-neumanni-mosdepth.log
#

#
