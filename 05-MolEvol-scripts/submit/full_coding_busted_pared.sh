#!/bin/bash
#SBATCH --job-name=full_coding_busted_pared
#SBATCH --output=full_coding_busted_pared-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

conda activate hyphyenv

parallel -j 64 < /mnt/beegfs/gt156213e/murinae-seq/05-MolEvol-scripts/jobs/full_coding_busted_pared.sh