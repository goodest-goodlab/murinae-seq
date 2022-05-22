#!/bin/bash
#SBATCH --job-name=exome_subset_nc_mafft
#SBATCH --output=exome_subset_nc_mafft-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=3
#SBATCH --ntasks=180
#SBATCH --ntasks-per-node=60
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 180 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exome_subset_nc_mafft.sh