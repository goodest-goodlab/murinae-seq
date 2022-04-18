#!/bin/bash
#SBATCH --job-name=full_coding_absrel_pared_err1
#SBATCH --output=%x-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=60
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

conda activate hyphyenv

parallel -j 59 < /mnt/beegfs/gt156213e/murinae-seq/05-MolEvol-scripts/jobs/full_coding_absrel_pared_err1.sh