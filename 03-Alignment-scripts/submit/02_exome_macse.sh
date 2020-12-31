#!/bin/bash
#SBATCH --job-name=02_exome_macse
#SBATCH --output=02_exome_macse-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=5
#SBATCH --ntasks=150
#SBATCH --ntasks-per-node=30
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 150 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/02_exome_macse.sh