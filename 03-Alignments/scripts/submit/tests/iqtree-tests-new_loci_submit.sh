#!/bin/bash
#SBATCH --job-name=iqtree-tests-new
#SBATCH --output=iqtree-tests-new-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --mem=0

parallel -j 64 < /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/jobs/iqtree-tests-new_loci.sh