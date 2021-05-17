#!/bin/bash
gatk HaplotypeCaller -R /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-referee-corrected.fa -I /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.bam -stand-call-conf 30 --native-pair-hmm-threads 4 -O /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Pseudomys-delicatulus-M29247-haplotypecaller.log
gatk SelectVariants -V /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.vcf -O /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.snps.vcf -select-type SNP -xl-select-type MIXED -xl-select-type SYMBOLIC &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Pseudomys-delicatulus-M29247-selectsnps.log
bcftools filter -m+ -e "MQ < 30.0 || DP < 5 || DP > 60" -e 'ALT="*"' -s Filter --threads 4 -Oz -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.snps.filter.vcf /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.snps.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Pseudomys-delicatulus-M29247-filter.log
tabix /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.snps.filter.vcf
bcftools consensus -f /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247-referee-corrected.fa -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247iupac-consensus.fa -I -e "FILTER='Filter'" /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall/Pseudomys-delicatulus-M29247/Pseudomys-delicatulus-M29247.snps.filter.vcf &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs/Pseudomys-delicatulus-M29247-consensus.log