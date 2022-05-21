#!/bin/bash
gatk HaplotypeCaller -R /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Hyomys-goliath/Hyomys-goliath-referee-corrected.fa -I /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Hyomys-goliath/Hyomys-goliath.bam -stand-call-conf 30 --native-pair-hmm-threads 4 -O /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliath.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Hyomys-goliath-haplotypecaller.log
gatk SelectVariants -V /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliath.vcf -O /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliath.snps.vcf -select-type SNP -xl-select-type MIXED -xl-select-type SYMBOLIC &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Hyomys-goliath-selectsnps.log
bcftools filter -m+ -e "MQ < 30.0 || DP < 5 || DP > 60" -e 'ALT="*"' -s Filter --threads 4 -Oz -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliath.snps.filter.vcf /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliath.snps.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Hyomys-goliath-filter.log
tabix /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliath.snps.filter.vcf
bcftools consensus -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Hyomys-goliath/Hyomys-goliath-referee-corrected.fa -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliathiupac-consensus.fa -I -e "FILTER='Filter'" /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Hyomys-goliath/Hyomys-goliath.snps.filter.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Hyomys-goliath-consensus.log
