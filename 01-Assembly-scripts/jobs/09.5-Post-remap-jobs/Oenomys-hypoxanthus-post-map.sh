#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/hiseq4000-paired-1/REC13_CKDL190143344-1a-D701-AK1545_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/hiseq4000-paired-1/REC13_CKDL190143344-1a-D701-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Oenomys-hypoxanthus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/hiseq4000-paired-1/REC13_CKDL190143344-1a-D701-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Oenomys-hypoxanthus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Oenomys-hypoxanthus/Oenomys-hypoxanthus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Oenomys-hypoxanthus/Oenomys-hypoxanthus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Oenomys-hypoxanthus-mosdepth.log
#

#

