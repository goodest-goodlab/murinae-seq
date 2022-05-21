#!/bin/bash
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-2/lane1_ACTATC_L001_002.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-2/lane1_ACTATC_L001_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-platythrix-hiseq2000-paired-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-1/10460X13_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-1/10460X13_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix-hiseq2000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-platythrix-hiseq2000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix-hiseq2000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-platythrix-hiseq2000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-1/10460X13_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/hiseq2000-paired-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-platythrix-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mus-platythrix/Mus-platythrix-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-platythrix/Mus-platythrix.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-platythrix-mosdepth.log
#

#

