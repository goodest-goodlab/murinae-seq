#!/bin/bash
#SBATCH --job-name=exome_prequal
#SBATCH --output=exome_prequal-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 20 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exome_prequal.sh