#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/hiseq4000-paired-2/REC_27_CKDL190143345-1a-D705-AK1546_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/hiseq4000-paired-2/REC_27_CKDL190143345-1a-D705-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Kadarsanomys-sodyi-hiseq4000-paired-2-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/hiseq4000-paired-3/REC27_CKDL200159916-1a-D705-AK1546_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/hiseq4000-paired-3/REC27_CKDL200159916-1a-D705-AK1546_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Kadarsanomys-sodyi-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/hiseq4000-paired-2/REC_27_CKDL190143345-1a-D705-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/hiseq4000-paired-3/REC27_CKDL200159916-1a-D705-AK1546_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Kadarsanomys-sodyi-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Kadarsanomys-sodyi/Kadarsanomys-sodyi.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Kadarsanomys-sodyi/Kadarsanomys-sodyi.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Kadarsanomys-sodyi-mosdepth.log
#

#

