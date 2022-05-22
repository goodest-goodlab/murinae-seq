

dataset=""
name=""

time -p python 03_exonerate_gen_2.py -i ../03-Alignments/seq/reproductive-mclennan-coding/ -o ../03-Alignments/exonerate/reproductive-mclennan-coding/ -n exonerate_rep_mcl -part good_lab_reincarnation -tasks 100

# sbatch

time -p python 04_exonerate_to_cds_2_trimmed.py -i ../03-Alignments/exonerate/reproductive-mclennan-coding/ -o ../03-Alignments/exonerate/reproductive-mclennan-coding-seq/ -f 0 > logs/exonerate-to-cds-rep-mcl-f0.log

# mkdir mafft/aa

time -p mafft_gen.py -i ../03-Alignments/exonerate/reproductive-mclennan-coding-seq-f0/aa/ -o ../03-Alignments/exonerate/reproductive-mclennan-coding-mafft-f0/aa/ -n exonerate_mafft_rep_mcl -part good_lab_reincarnation -tasks 100

# sbatch


time -p python 05_backtranslate.py -aa ../03-Alignments/exonerate/australian-full-coding-mafft-f0/aa/ -nt ../03-Alignments/exonerate/australian-full-coding-seq-f0/nt/ -o ../03-Alignments/exonerate/australian-full-coding-mafft-f0/nt/

time -p python 06_aln_filter.py -i ../03-Alignments/exonerate/australian-full-coding-mafft-f0/nt/ -f 0 -o ../03-Alignments/exonerate/australian-full-coding-trimmed
