#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/hiseq4000-paired-1/REC23_CKDL190143344-1a-D701-AK1546_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/hiseq4000-paired-1/REC23_CKDL190143344-1a-D701-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Thamnomys-kempi-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/hiseq4000-paired-1/REC23_CKDL190143344-1a-D701-AK1546_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Thamnomys-kempi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Thamnomys-kempi/Thamnomys-kempi-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Thamnomys-kempi/Thamnomys-kempi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Thamnomys-kempi-mosdepth.log
#

#

