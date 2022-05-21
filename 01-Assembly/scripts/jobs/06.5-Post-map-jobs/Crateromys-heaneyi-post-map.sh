#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/hiseq4000-paired-1/REC4_CKDL190143343-1a-D702-AK1544_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/hiseq4000-paired-1/REC4_CKDL190143343-1a-D702-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crateromys-heaneyi-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/hiseq4000-paired-1/REC4_CKDL190143343-1a-D702-AK1544_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crateromys-heaneyi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Crateromys-heaneyi/Crateromys-heaneyi.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crateromys-heaneyi/Crateromys-heaneyi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crateromys-heaneyi-mosdepth.log
#

#

