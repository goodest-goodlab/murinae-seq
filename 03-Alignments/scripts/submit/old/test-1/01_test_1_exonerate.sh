#!/bin/bash
#SBATCH --job-name=01_test_1_exonerate
#SBATCH --output=01_test_1_exonerate-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 1 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/01_test_1_exonerate.sh