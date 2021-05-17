#!/bin/bash
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-2/52923_AH7T7NBCX2_GACGGCG_S6_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-2/52923_AH7T7NBCX2_GACGGCG_S6_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-alexis-ABTC94521-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-1/52923_AH7T2JBCX2_GACGGCG_S6_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-1/52923_AH7T2JBCX2_GACGGCG_S6_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-alexis-ABTC94521-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-alexis-ABTC94521-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-1/52923_AH7T2JBCX2_GACGGCG_S6_L001_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-alexis-ABTC94521-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Notomys-alexis-ABTC94521/Notomys-alexis-ABTC94521.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Notomys-alexis-ABTC94521-mosdepth.log
#

#
