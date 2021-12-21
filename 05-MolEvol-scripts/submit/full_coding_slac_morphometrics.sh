#!/bin/bash
#SBATCH --job-name=full_coding_slac_morphometrics
#SBATCH --output=full_coding_slac_morphometrics-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=71
#SBATCH --tasks-per-node=71
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

conda activate hyphyenv

parallel -j 71 < /mnt/beegfs/gt156213e/murinae-seq/05-MolEvol-scripts/jobs/full_coding_slac_morphometrics.sh