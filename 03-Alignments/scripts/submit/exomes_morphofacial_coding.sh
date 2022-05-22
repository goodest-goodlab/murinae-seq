#!/bin/bash
#SBATCH --job-name=exomes_morphofacial_coding
#SBATCH --output=exomes_morphofacial_coding-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=50
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 50 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/exomes_morphofacial_coding.sh