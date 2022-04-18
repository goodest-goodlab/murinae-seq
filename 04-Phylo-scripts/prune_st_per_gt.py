#!/usr/bin/python
#############################################################################
# Prunes the species tree for samples present in each gene
# tree
#############################################################################

import sys, os, treeparse as tp

#############################################################################

indir = "../04-Phylo/full-coding-iqtree/loci/";
locus_dirs = os.listdir(indir);

species_tree_file = "../04-Phylo/full-coding-iqtree/concord/full_coding_iqtree_astral.cf.tree";

gt_suffix = ".filter.treefile";
st_suffix = ".species.treefile";

tree_files, no_tree_loci = [], [];
for locus_dir in locus_dirs:
    tree_found = False;
    locus_files = os.listdir(os.path.join(indir, locus_dir));
    for locus_file in locus_files:
        if locus_file.endswith(gt_suffix):
            tree_files.append(os.path.join(indir, locus_dir, locus_file));
            tree_found = True;

    if not tree_found:
        no_tree_loci.append(locus_dir);

print("LOCI WITHOUT A TREE:")
print(no_tree_loci);

#tree_files = [ [ os.path.join(indir, locus, f) for f in os.listdir(os.path.join(indir, locus)) if f.endswith(".morphometrics.treefile") and not f.endswith(".morphometrics.rooted.treefile") ][0] for locus in locus_dirs if locus not in no_tree_loci ];
print(len(tree_files), " tree files found.");

for tree_file in tree_files:
    tinfo, tree, root = tp.treeParse(open(tree_file).read());
    cur_tips = [ n for n in tinfo if tinfo[n][2] == 'tip' ];

    outfilename = tree_file.replace(".treefile", st_suffix);
    nw_cmd = "nw_prune -v " + species_tree_file + " " + " ".join(cur_tips) + " > " + outfilename;
    #print(nw_cmd);
    os.system(nw_cmd);
    #sys.exit();

# print(have_both_trees, " trees have both outgroups");
# print(lophi_only_trees, " trees have only Lophiomys_imhausi_UM5152");
# print(lophur_only_trees, " trees have only Lophuromys_woosnami_LSUMZ37793");
# print(missing_both_trees, " trees have neither outgroup");
# print();
# print(have_both_trees + lophi_only_trees + lophur_only_trees, " total trees rooted");