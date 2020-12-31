#!/bin/bash
#SBATCH --job-name=02_exome_macse
#SBATCH --output=02_exome_macse-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_large_cpu
#SBATCH --nodes=6
#SBATCH --ntasks=90
#SBATCH --ntasks-per-node=15
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 90 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/02_exome_macse_large.sh