#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-1/53924_HTVLKBCX2_TTGAAGT_S12_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-1/53924_HTVLKBCX2_TTGAAGT_S12_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-delicatulus-M29247-seq-run-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-2/53924_HTVLWBCX2_TTGAAGT_S12_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-2/53924_HTVLWBCX2_TTGAAGT_S12_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-delicatulus-M29247-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-delicatulus-M29247-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-delicatulus-M29247-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-delicatulus-M29247-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-delicatulus-M29247-mosdepth.log
#

#
