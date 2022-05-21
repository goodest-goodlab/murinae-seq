#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-1/53916_HTVLKBCX2_GGATCAA_S4_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-1/53916_HTVLKBCX2_GGATCAA_S4_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-mitchellii-M21518-seq-run-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-2/53916_HTVLWBCX2_GGATCAA_S4_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-2/53916_HTVLWBCX2_GGATCAA_S4_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-mitchellii-M21518-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-mitchellii-M21518-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-mitchellii-M21518-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-mitchellii-M21518-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-mitchellii-M21518/Notomys-mitchellii-M21518.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-mitchellii-M21518-mosdepth.log
#

#

