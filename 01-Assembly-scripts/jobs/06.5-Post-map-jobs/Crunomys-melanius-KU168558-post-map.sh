#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/hiseq4000-paired-1/REC6_CKDL190143344-1a-D704-AK1544_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/hiseq4000-paired-1/REC6_CKDL190143344-1a-D704-AK1544_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crunomys-melanius-KU168558-hiseq4000-paired-1-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/hiseq4000-paired-1/REC6_CKDL190143344-1a-D704-AK1544_H7275BBXX_L3_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crunomys-melanius-KU168558-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Crunomys-melanius-KU168558/Crunomys-melanius-KU168558.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Crunomys-melanius-KU168558-mosdepth.log
#

#

