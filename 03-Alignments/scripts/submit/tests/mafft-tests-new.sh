#!/bin/bash
#SBATCH --job-name=mafft-tests-new
#SBATCH --output=mafft-tests-new-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=30
#SBATCH --ntasks-per-node=30
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 30 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/mafft-tests-new.sh