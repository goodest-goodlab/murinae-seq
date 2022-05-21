#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/hiseq4000-paired-1/SM010_CKDL190143343-1a-D701-AK1680_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/hiseq4000-paired-1/SM010_CKDL190143343-1a-D701-AK1680_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Xenuromys-barbatus-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/hiseq4000-paired-1/SM010_CKDL190143343-1a-D701-AK1680_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Xenuromys-barbatus-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Xenuromys-barbatus/Xenuromys-barbatus.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Xenuromys-barbatus/Xenuromys-barbatus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Xenuromys-barbatus-mosdepth.log
#

#

