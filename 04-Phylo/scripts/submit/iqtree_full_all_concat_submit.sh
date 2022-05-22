#!/bin/bash
#SBATCH --job-name=iqtree_full_all
#SBATCH --output=iqtree_full_all-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=3
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=180
#SBATCH --mem=0

iqtree -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/seq/full-all-trimmed/genes-trimmed-fa --prefix /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-all-iqtree/concat/iqtree_full_all -B 1000 -T 1 &> /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-all-iqtree/concat/concat-terminal.log
iqtree -t /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-all-iqtree/concat/iqtree_full_all.treefile --gcf /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-all-iqtree/loci.treefile -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/seq/full-all-trimmed/genes-trimmed-fa --scf 100 --cf-verbose --prefix /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-all-iqtree/concord/iqtree_full_all -T 1