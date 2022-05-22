#!/bin/bash
#SBATCH --job-name=iqtree-tests-new
#SBATCH --output=iqtree-tests-new-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=0

iqtree -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-new/mafft-filtered-f175-seq20-site50/nt --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-new/iqtree-f175/concat/iqtree-tests-new -B 1000 -T 1 &> /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-new/iqtree-f175/concat/concat-terminal.log
#iqtree -t /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-new/iqtree-f175/concat/iqtree-tests-new.treefile --gcf /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-new/iqtree-f175/loci.treefile -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-new/mafft-filtered-f175-seq20-site50/nt --scf 100 --cf-verbose --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-new/iqtree-f175/concord/iqtree-tests-new -T 1