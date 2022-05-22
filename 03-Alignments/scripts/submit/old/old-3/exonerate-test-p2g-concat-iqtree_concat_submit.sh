#!/bin/bash
#SBATCH --job-name=exonerate-test-p2g-concat-iqtree
#SBATCH --output=exonerate-test-p2g-concat-iqtree-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition=good_lab_cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=0

iqtree -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-test-p2g-concat-aln/nt-filter --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-test-p2g-concat-iqtree/concat/exonerate-test-p2g-concat-iqtree -B 1000 -T 1 &> /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-test-p2g-concat-iqtree/concat/concat-terminal.log
iqtree -t /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-test-p2g-concat-iqtree/concat/exonerate-test-p2g-concat-iqtree.treefile --gcf /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-test-p2g-concat-iqtree/loci.treefile -p /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-test-p2g-concat-aln/nt-filter --scf 100 --cf-verbose --prefix /mnt/beegfs/gt156213e/murinae-seq/03-Alignment-scripts/exonerate-test-p2g-concat-iqtree/concord/exonerate-test-p2g-concat-iqtree -T 1