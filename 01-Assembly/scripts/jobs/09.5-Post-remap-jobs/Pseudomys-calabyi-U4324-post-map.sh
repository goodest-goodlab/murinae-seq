#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/seq-run-2/53913_HTVLWBCX2_TCGCAGG_S1_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/seq-run-2/53913_HTVLWBCX2_TCGCAGG_S1_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-calabyi-U4324-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-calabyi-U4324-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-calabyi-U4324-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-calabyi-U4324/Pseudomys-calabyi-U4324.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-calabyi-U4324-mosdepth.log
#

#

