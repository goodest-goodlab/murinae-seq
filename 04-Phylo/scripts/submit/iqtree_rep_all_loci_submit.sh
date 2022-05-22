#!/bin/bash
#SBATCH --job-name=iqtree_rep_all
#SBATCH --output=iqtree_rep_all-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_large_cpu
#SBATCH --nodes=6
#SBATCH --ntasks=120
#SBATCH --ntasks-per-node=20
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 120 < /mnt/beegfs/gt156213e/murinae-seq/04-Phylo-scripts/jobs/iqtree_rep_all_loci.sh