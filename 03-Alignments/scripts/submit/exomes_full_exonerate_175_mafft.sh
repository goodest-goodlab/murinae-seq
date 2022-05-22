#!/bin/bash
#SBATCH --job-name=exomes_full_exonerate_175_mafft
#SBATCH --output=exomes_full_exonerate_175_mafft-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=100
#SBATCH --ntasks-per-node=100
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 100 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exomes_full_exonerate_175_mafft.sh