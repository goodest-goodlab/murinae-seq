#!/bin/bash
#SBATCH --job-name=full_coding_iqtree_dating
#SBATCH --output=full_coding_iqtree_dating-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_reincarnation
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=60
#SBATCH --mem=100g

alndir=/mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/nt-nrf-below-0.25/
datefile=/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/fossil-calibrations-iqtree.txt
treefile=/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concord/astral-bl-nrf25/full_coding_iqtree_astral.cf.bl.nrf25.treefile
prefix=/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/astral-dating/
logfile=/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/astral-dating/iqtree.log

time -p iqtree -s $alndir --date $datefile --date-ci 100 -te $treefile --date-tip 0 --prefix $prefix -T 60 -mem 40G --redo-tree &> $logfile