#!/bin/bash
#SBATCH --job-name=03_test_1_mafft_f175
#SBATCH --output=03_test_1_mafft_f175-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 1 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/03_test_1_mafft_f175.sh