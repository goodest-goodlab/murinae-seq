#!/bin/bash
#SBATCH --job-name=01_exome_subset_mafft
#SBATCH --output=01_exome_subset_mafft-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=3-5
#SBATCH --ntasks=216
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 216 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/01_exome_subset_mafft.sh