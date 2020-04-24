#!/bin/bash
#SBATCH --job-name=get-exome-seqs
#SBATCH --output=%x-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_small_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10000

cd /mnt/beegfs/gt156213e/murinae-seq/02-Annotation-scripts/
python get_selected_seqs.py