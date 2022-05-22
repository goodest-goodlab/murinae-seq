#!/bin/bash
#SBATCH --job-name=iqtree_rep_all
#SBATCH --output=iqtree_rep_all-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=120
#SBATCH --mem=0

iqtree -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/seq/reproductive-all-trimmed/genes-trimmed-fa --prefix /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/reproductive-all-iqtree/concat/iqtree_rep_all -B 1000 -T 120 &> /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/reproductive-all-iqtree/concat/concat-terminal.log
iqtree -t /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/reproductive-all-iqtree/concat/iqtree_rep_all.treefile --gcf /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/reproductive-all-iqtree/loci.treefile -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/seq/reproductive-all-trimmed/genes-trimmed-fa --scf 100 --cf-verbose --prefix /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/reproductive-all-iqtree/concord/iqtree_rep_all -T 1