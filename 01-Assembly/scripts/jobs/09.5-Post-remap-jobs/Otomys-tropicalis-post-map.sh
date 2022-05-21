#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/hiseq4000-paired-1/REC15_CKDL190143344-1a-DY0088-AK1545_H7275BBXX_L3_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/hiseq4000-paired-1/REC15_CKDL190143344-1a-DY0088-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis-hiseq4000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Otomys-tropicalis-hiseq4000-paired-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/hiseq4000-paired-3/REC15_CKDL200159916-1a-DY0088-AK1545_HC3LGCCX2_L6_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/hiseq4000-paired-3/REC15_CKDL200159916-1a-DY0088-AK1545_HC3LGCCX2_L6_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis-hiseq4000-paired-3-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Otomys-tropicalis-hiseq4000-paired-3-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/hiseq4000-paired-1/REC15_CKDL190143344-1a-DY0088-AK1545_H7275BBXX_L3_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/hiseq4000-paired-3/REC15_CKDL200159916-1a-DY0088-AK1545_HC3LGCCX2_L6_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Otomys-tropicalis-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Otomys-tropicalis/Otomys-tropicalis-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Otomys-tropicalis/Otomys-tropicalis.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Otomys-tropicalis-mosdepth.log
#

#

