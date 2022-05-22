#!/bin/bash
#SBATCH --job-name=exonerate_p2g_trimmed_tree
#SBATCH --output=exonerate_p2g_trimmed_tree-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=0

iqtree -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-p2g-trimmed-aln/nt --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-p2g-trimmed-tree/concat/exonerate_p2g_trimmed_tree -B 1000 -T 1 &> /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-p2g-trimmed-tree/concat/concat-terminal.log
iqtree -t /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-p2g-trimmed-tree/concat/exonerate_p2g_trimmed_tree.treefile --gcf /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-p2g-trimmed-tree/loci.treefile -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-p2g-trimmed-aln/nt --scf 100 --cf-verbose --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-p2g-trimmed-tree/concord/exonerate_p2g_trimmed_tree -T 1