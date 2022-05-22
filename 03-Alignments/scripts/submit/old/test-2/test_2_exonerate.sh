#!/bin/bash
#SBATCH --job-name=test_2_exonerate
#SBATCH --output=test_2_exonerate-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=30
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 30 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/test_2_exonerate.sh