#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/hiseq4000-paired-1/SM047_CKDL190143343-1a-DY0088-AK1680_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/hiseq4000-paired-1/SM047_CKDL190143343-1a-DY0088-AK1680_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mammelomys-lanosus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/hiseq4000-paired-1/SM047_CKDL190143343-1a-DY0088-AK1680_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mammelomys-lanosus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mammelomys-lanosus/Mammelomys-lanosus-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mammelomys-lanosus/Mammelomys-lanosus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mammelomys-lanosus-mosdepth.log
#

#

