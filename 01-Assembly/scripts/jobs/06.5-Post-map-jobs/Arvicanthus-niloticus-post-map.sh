#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/hiseq4000-paired-3/SM100_CKDL200159916-1a-D701-AK1681_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/hiseq4000-paired-3/SM100_CKDL200159916-1a-D701-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-niloticus-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/hiseq4000-paired-3/SM100_CKDL200159916-1a-D701-AK1681_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-niloticus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Arvicanthus-niloticus/Arvicanthus-niloticus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Arvicanthus-niloticus/Arvicanthus-niloticus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Arvicanthus-niloticus-mosdepth.log
#

#

