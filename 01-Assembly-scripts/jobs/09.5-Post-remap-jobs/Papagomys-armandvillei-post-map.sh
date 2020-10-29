#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/hiseq4000-paired-1/SM057_CKDL190143344-1a-D704-AK1682_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/hiseq4000-paired-1/SM057_CKDL190143344-1a-D704-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Papagomys-armandvillei-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/hiseq4000-paired-1/SM057_CKDL190143344-1a-D704-AK1682_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Papagomys-armandvillei-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Papagomys-armandvillei/Papagomys-armandvillei-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Papagomys-armandvillei/Papagomys-armandvillei.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Papagomys-armandvillei-mosdepth.log
#

#

