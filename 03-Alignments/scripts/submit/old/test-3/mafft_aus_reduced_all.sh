#!/bin/bash
#SBATCH --job-name=mafft_aus_reduced_all
#SBATCH --output=mafft_aus_reduced_all-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_small_cpu
#SBATCH --nodes=3
#SBATCH --ntasks=60
#SBATCH --ntasks-per-node=20
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 60 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/mafft_aus_reduced_all.sh