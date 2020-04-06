#!/bin/bash
#SBATCH --job-name=04A_reformat_exomes
#SBATCH --output=04A_reformat_exomes-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_small_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 10 < /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/04A_reformat_exomes.sh