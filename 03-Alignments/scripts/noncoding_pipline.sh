

dataset=""
name=""


mafft_gen.py -i ../03-Alignments/seq/full-all/ -o ../03-Alignments/mafft/full-all/ -n mafft_exomes_full_all -part good_lab_reincarnation -tasks 100

time -p seq_convert.py -i genes_trimmed -f p -o genes-trimmed-fa -t f

time -p iqtree_gt_gen.py -i ../03-Alignments/seq/reproductive-all-trimmed/genes-trimmed-fa/ -o ../04-Phylo/reproductive-all-iqtree/ -b 1000 -n iqtree_rep_all -part good_lab_large_cpu -nodes 6 -tasks 120 -tpn 20

# sbatch

# sbatch