#############################################################################
# Roots the gene trees from the full coding set for ancestral reconstruction
# pipeline.
#
# Gregg Thomas, November 2021
#############################################################################

import sys, os

#############################################################################

indir = "../04-Phylo/full-coding-iqtree/loci/";
locus_dirs = os.listdir(indir);

no_tree_loci = [ locus for locus in locus_dirs if not any(f.endswith(".treefile") for f in os.listdir(os.path.join(indir, locus))) ];
print("LOCI WITHOUT A TREE:")
print(no_tree_loci);

tree_files = [ [ os.path.join(indir, locus, f) for f in os.listdir(os.path.join(indir, locus)) if f.endswith(".treefile") and not f.endswith(".rooted.treefile") ][0] for locus in locus_dirs if locus not in no_tree_loci ];
print(len(tree_files), " tree files found.");

have_both_trees = 0;
lophi_only_trees = 0;
lophur_only_trees = 0;
missing_both_trees = 0;

for tree_file in tree_files:
    #tree_file = tf_list[0];
    root = True;
    
    tree = open(tree_file, "r").read();


    if "Lophiomys_imhausi_UM5152" in tree and "Lophuromys_woosnami_LSUMZ37793" in tree:
        have_both_trees += 1;
    elif "Lophiomys_imhausi_UM5152" in tree:
        lophi_only_trees += 1;
    elif "Lophuromys_woosnami_LSUMZ37793" in tree:
        lophur_only_trees += 1;
    else:
        root = False;
        missing_both_trees += 1;

    if root:
        outfilename = tree_file.replace(".treefile", ".rooted.treefile");
        nw_cmd = "nw_reroot -l " + tree_file + " Lophiomys_imhausi_UM5152 Lophuromys_woosnami_LSUMZ37793 > " + outfilename;
        #print(nw_cmd);
        os.system(nw_cmd);

print(have_both_trees, " trees have both outgroups");
print(lophi_only_trees, " trees have only Lophiomys_imhausi_UM5152");
print(lophur_only_trees, " trees have only Lophuromys_woosnami_LSUMZ37793");
print(missing_both_trees, " trees have neither outgroup");
print()
print(have_both_trees + lophi_only_trees + lophur_only_trees, " total trees rooted")