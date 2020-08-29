#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/hiseq4000-paired-1/REC24_CKDL190143343-1a-D702-AK1546_H7275BBXX_L2_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/hiseq4000-paired-1/REC24_CKDL190143343-1a-D702-AK1546_H7275BBXX_L2_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thamnomys-sp.-hiseq4000-paired-1-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/hiseq4000-paired-1/REC24_CKDL190143343-1a-D702-AK1546_H7275BBXX_L2_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thamnomys-sp.-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp. /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Thamnomys-sp.-mouse/Thamnomys-sp.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Thamnomys-sp.-mosdepth-mouse.log
