#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/hiseq2000-paired-1/10460X14_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/hiseq2000-paired-1/10460X14_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus-hiseq2000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-musculus-hiseq2000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/hiseq2000-paired-2/lane1_TTGGAT_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/hiseq2000-paired-2/lane1_TTGGAT_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus-hiseq2000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-musculus-hiseq2000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/hiseq2000-paired-1/10460X14_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/hiseq2000-paired-2/lane1_TTGGAT_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-musculus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Mus-musculus-musculus/Mus-musculus-musculus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-musculus/Mus-musculus-musculus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-musculus-mosdepth.log
#

#

