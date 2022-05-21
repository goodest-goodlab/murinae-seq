#!/bin/bash
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-1.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-1/52954_BH7T33BCX2_CAGTACT_S17_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-1/52954_BH7T33BCX2_CAGTACT_S17_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-delicatulus-WAMM29247-seq-run-1-merge-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-2/52954_BH7T77BCX2_CAGTACT_S17_L001_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-2/52954_BH7T77BCX2_CAGTACT_S17_L002_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-delicatulus-WAMM29247-seq-run-2-merge-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-1.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-1.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-delicatulus-WAMM29247-seq-run-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-delicatulus-WAMM29247-seq-run-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-1.merge.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-delicatulus-WAMM29247-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-depth.tab
samtools bedcov /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-bedcov.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Pseudomys-delicatulus-WAMM29247-mosdepth-mouse.log
samtools view -bh /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247.bam -L /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-targets.bam
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-targets.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Pseudomys-delicatulus-WAMM29247-mouse/Pseudomys-delicatulus-WAMM29247-targets-flagstats.txt
