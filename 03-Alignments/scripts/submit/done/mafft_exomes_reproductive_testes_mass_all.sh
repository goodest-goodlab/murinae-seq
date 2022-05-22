#!/bin/bash
#SBATCH --job-name=mafft_exomes_reproductive_testes_mass_all
#SBATCH --output=mafft_exomes_reproductive_testes_mass_all-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=60
#SBATCH --ntasks-per-node=60
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 60 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/mafft_exomes_reproductive_testes_mass_all.sh