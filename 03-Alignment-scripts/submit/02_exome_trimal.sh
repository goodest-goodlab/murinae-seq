#!/bin/bash
#SBATCH --job-name=02_exome_trimal
#SBATCH --output=02_exome_trimal-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=40
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 40 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/scripts/jobs/02_exome_trimal.sh