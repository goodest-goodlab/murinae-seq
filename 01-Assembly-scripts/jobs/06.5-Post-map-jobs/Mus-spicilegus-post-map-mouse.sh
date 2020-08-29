#!/bin/bash
#
#
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/hiseq2000-paired-1/10460X11_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/hiseq2000-paired-1/10460X11_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus-hiseq2000-paired-1-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-spicilegus-hiseq2000-paired-1-mkdup-mouse.log
picard -Xmx10g MarkDuplicates I=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/hiseq2000-paired-2/lane1_AACTCC_L001_001.fastp.decon.bam TMP_DIR=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/tmp O=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/hiseq2000-paired-2/lane1_AACTCC_L001_001.fastp.decon.mkdup.bam M=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus-hiseq2000-paired-2-mkdup-metrics.txt CREATE_INDEX=true &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-spicilegus-hiseq2000-paired-2-mkdup-mouse.log
samtools merge -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/hiseq2000-paired-1/10460X11_131030_SN141_0734_AC2RLAACXX_7_.fastp.decon.mkdup.bam /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/hiseq2000-paired-2/lane1_AACTCC_L001_001.fastp.decon.mkdup.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-spicilegus-merge-mouse.log
samtools index /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus.bam
samtools depth -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus-depth.tab
samtools stats -d -r /mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus-stats.txt
samtools flagstat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus.bam > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus-flagstats.txt
mosdepth -x -b /mnt/beegfs/gt156213e/murinae-seq/Targets/targets-mm10-coords.bed /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map/Mus-spicilegus-mouse/Mus-spicilegus.bam &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs/Mus-spicilegus-mosdepth-mouse.log
