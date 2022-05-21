#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-1/53921_HTVLKBCX2_ACCAACT_S9_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-1/53921_HTVLKBCX2_ACCAACT_S9_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-conditor-ABTC13335-seq-run-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-2/53921_HTVLWBCX2_ACCAACT_S9_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-2/53921_HTVLWBCX2_ACCAACT_S9_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-conditor-ABTC13335-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-conditor-ABTC13335-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-conditor-ABTC13335-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-conditor-ABTC13335-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-conditor-ABTC13335/Leporillus-conditor-ABTC13335.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-conditor-ABTC13335-mosdepth.log
#

#

