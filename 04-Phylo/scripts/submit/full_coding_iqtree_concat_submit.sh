#!/bin/bash
#SBATCH --job-name=full_coding_iqtree
#SBATCH --output=full_coding_iqtree-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=3
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=60
#SBATCH --mem=0

iqtree -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/nt --prefix /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concat/full_coding_iqtree -B 1000 -T 1 &> /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concat/concat-terminal.log
iqtree -t /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concat/full_coding_iqtree.treefile --gcf /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/loci.treefile -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/nt --scf 100 --cf-verbose --prefix /mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concord/full_coding_iqtree -T 1