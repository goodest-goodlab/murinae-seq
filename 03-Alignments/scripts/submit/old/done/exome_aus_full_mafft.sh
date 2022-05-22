#!/bin/bash
#SBATCH --job-name=exome_aus_full_mafft
#SBATCH --output=exome_aus_full_mafft-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=4
#SBATCH --ntasks=240
#SBATCH --ntasks-per-node=60
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 240 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exome_aus_full_mafft.sh