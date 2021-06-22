#!/bin/bash
#SBATCH --job-name=full_coding_iqtree
#SBATCH --output=full_coding_iqtree-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=3
#SBATCH --ntasks=60
#SBATCH --ntasks-per-node=False
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 60 < /mnt/beegfs/gt156213e/murinae-seq/04-Phylo-scripts/jobs/full_coding_iqtree_loci.sh