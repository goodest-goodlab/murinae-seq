#!/bin/bash
#SBATCH --job-name=full_coding_anc_recon
#SBATCH --output=full_coding_anc_recon-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --tasks-per-node=32
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

conda activate hyphyenv

parallel -j 32 < /mnt/beegfs/gt156213e/murinae-seq/05-MolEvol-scripts/jobs/full_coding_anc_recon.sh