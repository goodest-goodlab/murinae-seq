#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/hiseq2000-paired-1/10460X4_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/hiseq2000-paired-1/10460X4_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus-hiseq2000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-spretus-hiseq2000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/hiseq2000-paired-2/lane1_GGATCA_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/hiseq2000-paired-2/lane1_GGATCA_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus-hiseq2000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-spretus-hiseq2000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/hiseq2000-paired-1/10460X4_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/hiseq2000-paired-2/lane1_GGATCA_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-spretus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mus-spretus/Mus-spretus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-spretus/Mus-spretus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-spretus-mosdepth.log
#

#

