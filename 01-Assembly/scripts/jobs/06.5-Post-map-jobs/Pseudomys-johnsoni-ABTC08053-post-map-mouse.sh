#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-1/52935_AH7T2JBCX2_TTAACTC_S18_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-1/52935_AH7T2JBCX2_TTAACTC_S18_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-johnsoni-ABTC08053-seq-run-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-2/52935_AH7T7NBCX2_TTAACTC_S18_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-2/52935_AH7T7NBCX2_TTAACTC_S18_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-johnsoni-ABTC08053-seq-run-2-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-johnsoni-ABTC08053-seq-run-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-johnsoni-ABTC08053-seq-run-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-johnsoni-ABTC08053-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-johnsoni-ABTC08053-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-johnsoni-ABTC08053-mouse/Pseudomys-johnsoni-ABTC08053-targets-flagstats.txt
