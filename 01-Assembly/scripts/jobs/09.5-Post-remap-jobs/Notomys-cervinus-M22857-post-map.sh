#!/bin/bash
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-2/52922_AH7T7NBCX2_AAGCTAA_S5_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-2/52922_AH7T7NBCX2_AAGCTAA_S5_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Notomys-cervinus-M22857-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-1/52922_AH7T2JBCX2_AAGCTAA_S5_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-1/52922_AH7T2JBCX2_AAGCTAA_S5_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Notomys-cervinus-M22857-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Notomys-cervinus-M22857-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-1/52922_AH7T2JBCX2_AAGCTAA_S5_L001_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Notomys-cervinus-M22857-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Notomys-cervinus-M22857/Notomys-cervinus-M22857-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Notomys-cervinus-M22857/Notomys-cervinus-M22857.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Notomys-cervinus-M22857-mosdepth.log
#

#

