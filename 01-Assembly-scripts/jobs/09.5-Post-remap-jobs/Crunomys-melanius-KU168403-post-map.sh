#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/hiseq4000-paired-1/REC5_CKDL190143343-1a-DY0088-AK1544_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/hiseq4000-paired-1/REC5_CKDL190143343-1a-DY0088-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Crunomys-melanius-KU168403-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/hiseq4000-paired-1/REC5_CKDL190143343-1a-DY0088-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Crunomys-melanius-KU168403-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Crunomys-melanius-KU168403/Crunomys-melanius-KU168403.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Crunomys-melanius-KU168403-mosdepth.log
#

#

