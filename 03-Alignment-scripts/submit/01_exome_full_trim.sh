#!/bin/bash
#SBATCH --job-name=01_exome_full_trim
#SBATCH --output=01_exome_full_trim-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_large_cpu
#SBATCH --nodes=1-5
#SBATCH --ntasks=200
#SBATCH --ntasks-per-node=40
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

source ~/.bash_profile
parallel -j 200 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/01_exome_full_trim.sh