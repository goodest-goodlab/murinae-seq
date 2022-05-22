#!/bin/bash
#SBATCH --job-name=mafft_full_all
#SBATCH --output=mafft_full_all-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_small_cpu
#SBATCH --nodes=4
#SBATCH --ntasks=80
#SBATCH --ntasks-per-node=20
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 80 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/mafft_full_all.sh