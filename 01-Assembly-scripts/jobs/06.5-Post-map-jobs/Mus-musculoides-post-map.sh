#!/bin/bash
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/hiseq4000-paired-2/REC30_CKDL190143345-1a-D708-AK1546_H7275BBXX_L4_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/hiseq4000-paired-2/REC30_CKDL190143345-1a-D708-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides-hiseq4000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculoides-hiseq4000-paired-2-mkdup.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/hiseq4000-paired-2/REC30_CKDL190143345-1a-D708-AK1546_H7275BBXX_L4_.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculoides-merge.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides.bam
samtools depth /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides-depth.tab
#

samtools stats -d -r /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Scaffolds/Mus-musculoides/Mus-musculoides.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides-flagstats.txt
mosdepth -x /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-musculoides/Mus-musculoides.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-musculoides-mosdepth.log
#

#

