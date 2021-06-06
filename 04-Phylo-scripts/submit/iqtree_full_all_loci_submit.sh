#!/bin/bash
#SBATCH --job-name=iqtree_full_all
#SBATCH --output=iqtree_full_all-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=5
#SBATCH --ntasks=100
#SBATCH --ntasks-per-node=20
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 100 < /mnt/beegfs/gt156213e/murinae-seq/04-Phylo-scripts/jobs/iqtree_full_all_loci.sh