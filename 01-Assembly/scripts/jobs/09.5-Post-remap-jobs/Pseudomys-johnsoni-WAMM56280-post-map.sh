#!/bin/bash
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-2/52938_BH7T77BCX2_AATAAGC_S1_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-2/52938_BH7T77BCX2_AATAAGC_S1_L001_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-johnsoni-WAMM56280-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-1/52938_BH7T33BCX2_AATAAGC_S1_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-1/52938_BH7T33BCX2_AATAAGC_S1_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-johnsoni-WAMM56280-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-johnsoni-WAMM56280-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-1/52938_BH7T33BCX2_AATAAGC_S1_L001_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-johnsoni-WAMM56280-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-johnsoni-WAMM56280/Pseudomys-johnsoni-WAMM56280.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Pseudomys-johnsoni-WAMM56280-mosdepth.log
#

#

