#!/bin/bash
#
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-2.merge.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-2/52957_BH7T77BCX2_AGTCAGA_S20_L002_001.fastp.decon.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-2/52957_BH7T77BCX2_AGTCAGA_S20_L001_001.fastp.decon.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-apicalis-C90-seq-run-2-merge.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-1/52957_BH7T33BCX2_AGTCAGA_S20_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-1/52957_BH7T33BCX2_AGTCAGA_S20_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90-seq-run-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-apicalis-C90-seq-run-1-mkdup.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-2.merge.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-2.merge.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90-seq-run-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-apicalis-C90-seq-run-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-1/52957_BH7T33BCX2_AGTCAGA_S20_L001_001.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/seq-run-2.merge.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-apicalis-C90-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Leporillus-apicalis-C90/Leporillus-apicalis-C90-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Leporillus-apicalis-C90/Leporillus-apicalis-C90.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Leporillus-apicalis-C90-mosdepth.log
#

#

