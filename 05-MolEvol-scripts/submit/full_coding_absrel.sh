#!/bin/bash
#SBATCH --job-name=full_coding_absrel
#SBATCH --output=full_coding_absrel-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_large_cpu
#SBATCH --nodes=4
#SBATCH --ntasks=120
#SBATCH --tasks-per-node=30
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

conda activate hyphyenv

parallel -j 100 < /mnt/beegfs/gt156213e/murinae-seq/05-MolEvol-scripts/jobs/full_coding_absrel.sh
