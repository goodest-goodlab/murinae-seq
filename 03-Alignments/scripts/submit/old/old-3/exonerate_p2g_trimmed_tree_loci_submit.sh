#!/bin/bash
#SBATCH --job-name=exonerate_p2g_trimmed_tree
#SBATCH --output=exonerate_p2g_trimmed_tree-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 20 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exonerate_p2g_trimmed_tree_loci.sh