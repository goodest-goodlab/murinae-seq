#!/bin/bash
#SBATCH --job-name=exonerate_rep_pahl
#SBATCH --output=exonerate_rep_pahl-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=72
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 72 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exonerate_rep_pahl.sh