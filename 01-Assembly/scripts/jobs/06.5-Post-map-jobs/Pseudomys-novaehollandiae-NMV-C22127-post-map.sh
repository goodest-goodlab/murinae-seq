#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-1/53927_HTVLKBCX2_CGACCTG_S15_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-1/53927_HTVLKBCX2_CGACCTG_S15_L001_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-novaehollandiae-NMV-C22127-seq-run-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-2/53927_HTVLWBCX2_CGACCTG_S15_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-2/53927_HTVLWBCX2_CGACCTG_S15_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-novaehollandiae-NMV-C22127-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-novaehollandiae-NMV-C22127-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-novaehollandiae-NMV-C22127-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-novaehollandiae-NMV-C22127-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-novaehollandiae-NMV-C22127/Pseudomys-novaehollandiae-NMV-C22127.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-novaehollandiae-NMV-C22127-mosdepth.log
#

#

