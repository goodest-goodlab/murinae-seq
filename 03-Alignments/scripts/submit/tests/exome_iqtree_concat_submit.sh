#!/bin/bash
#SBATCH --job-name=exome_iqtree
#SBATCH --output=exome_iqtree-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=0

iqtree -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/mafft/full-all-trimmed/genes-trimmed --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/tree/full-all-trimmed/concat/exome_iqtree -B 1000 -T 1 &> /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/tree/full-all-trimmed/concat/concat-terminal.log
iqtree -t /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/tree/full-all-trimmed/concat/exome_iqtree.treefile --gcf /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/tree/full-all-trimmed/loci.treefile -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/mafft/full-all-trimmed/genes-trimmed --scf 100 --cf-verbose --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/tree/full-all-trimmed/concord/exome_iqtree -T 1