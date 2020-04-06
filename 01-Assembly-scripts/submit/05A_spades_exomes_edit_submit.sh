#!/bin/bash
#SBATCH --job-name=05A_spades_exomes
#SBATCH --output=05A_spades_exomes-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_small_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=16
#SBATCH --mem=0

parallel -j 2 < /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/05A_spades_exomes_edit.sh