#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-1/Pseudomys_chapmani_WAMM29440_L001_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-1/Pseudomys_chapmani_WAMM29440_L001_unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-chapmani-WAMM29440-seq-run-1-merge.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2/Pseudomys_chapmani_WAMM29440_L001_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2/Pseudomys_chapmani_WAMM29440_L002_merged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2/Pseudomys_chapmani_WAMM29440_L001_unmerged.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2/Pseudomys_chapmani_WAMM29440_L002_unmerged.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-chapmani-WAMM29440-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-chapmani-WAMM29440-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-chapmani-WAMM29440-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-chapmani-WAMM29440-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-chapmani-WAMM29440/Pseudomys-chapmani-WAMM29440.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-chapmani-WAMM29440-mosdepth.log
