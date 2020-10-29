#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/hiseq4000-paired-2/REC30_CKDL190143345-1a-D708-AK1546_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/hiseq4000-paired-2/REC30_CKDL190143345-1a-D708-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-musculoides-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/hiseq4000-paired-2/REC30_CKDL190143345-1a-D708-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-musculoides-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mus-musculoides/Mus-musculoides-referee-corrected.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-musculoides/Mus-musculoides.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/09.5-Post-remap-logs/Mus-musculoides-mosdepth.log
#

#

