#!/bin/bash
#SBATCH --job-name=full_coding_absrel_targets
#SBATCH --output=full_coding_absrel_targets-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_large_cpu
#SBATCH --nodes=10
#SBATCH --ntasks=100
#SBATCH --tasks-per-node=10
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

conda activate hyphyenv

parallel -j 100 < /mnt/beegfs/gt156213e/murinae-seq/05-MolEvol-scripts/jobs/full_coding_absrel_targets.sh