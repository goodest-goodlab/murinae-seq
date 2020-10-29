#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/hiseq2000-paired-1/10460X5_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/hiseq2000-paired-1/10460X5_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference-hiseq2000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-reference-hiseq2000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/hiseq2000-paired-2/lane1_GCAAGA_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/hiseq2000-paired-2/lane1_GCAAGA_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference-hiseq2000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-reference-hiseq2000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/hiseq2000-paired-1/10460X5_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/hiseq2000-paired-2/lane1_GCAAGA_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-reference-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Mus-musculus-reference/Mus-musculus-reference.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculus-reference/Mus-musculus-reference.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculus-reference-mosdepth.log
#

#

