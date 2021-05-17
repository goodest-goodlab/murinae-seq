#!/bin/bash
gatk HaplotypeCaller -R /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mus-macedonicus/Mus-macedonicus-referee-corrected.fa -I /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Mus-macedonicus/Mus-macedonicus.bam -stand-call-conf 30 --native-pair-hmm-threads 4 -O /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicus.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Mus-macedonicus-haplotypecaller.log
gatk SelectVariants -V /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicus.vcf -O /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicus.snps.vcf -select-type SNP -xl-select-type MIXED -xl-select-type SYMBOLIC &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Mus-macedonicus-selectsnps.log
bcftools filter -m+ -e "MQ < 30.0 || DP < 5 || DP > 60" -e 'ALT="*"' -s Filter --threads 4 -Oz -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicus.snps.filter.vcf /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicus.snps.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Mus-macedonicus-filter.log
tabix /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicus.snps.filter.vcf
bcftools consensus -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Mus-macedonicus/Mus-macedonicus-referee-corrected.fa -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicusiupac-consensus.fa -I -e "FILTER='Filter'" /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Mus-macedonicus/Mus-macedonicus.snps.filter.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Mus-macedonicus-consensus.log