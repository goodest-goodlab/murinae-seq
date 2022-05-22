#!/bin/bash
#SBATCH --job-name=exonerate-test-p2g-macse-trim
#SBATCH --output=exonerate-test-p2g-macse-trim-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 1 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exonerate-test-p2g-macse-trim.sh