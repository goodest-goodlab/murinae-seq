#!/bin/bash
#SBATCH --job-name=exonerate_mafft_rep_pahl
#SBATCH --output=exonerate_mafft_rep_pahl-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=60
#SBATCH --ntasks-per-node=60
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 60 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exonerate_mafft_rep_pahl.sh