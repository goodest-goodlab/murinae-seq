#!/usr/bin/python
############################################################
# Bootstrap samples gene trees and calculates concordance
# factors for null distribution of delta values
############################################################

import sys, os, random

############################################################

species_tree = "../04-Phylo/full-coding-iqtree/concat/iqtree_full_coding.treefile";
#species_tree = "../04-Phylo/full-coding-iqtree/astral-rooted.out";
gene_tree_file = "../04-Phylo/full-coding-iqtree/loci.treefile";
outdir = "../04-Phylo/full-coding-iqtree/cf-reps-concat/";
overwrite = True;

if not os.path.isdir(outdir):
    os.system("mkdir " + outdir);
elif not overwrite:
    sys.exit(" * ERROR: output directory exists. Set overwrite an re-run to continue.");

print(outdir);
gene_trees = open(gene_tree_file, "r").read().split("\n");
num_gene_trees = len(gene_trees);

for i in range(0,1000):
    print(i);
    rep_str = str(i);

    while len(rep_str) < 4:
        rep_str = "0" + rep_str;

    rep_outdir = os.path.join(outdir, "rep" + rep_str);
    print(rep_outdir);
    if not os.path.isdir(rep_outdir):
        os.system("mkdir " + rep_outdir);

    cur_gt_file = os.path.join(rep_outdir, "rep" + rep_str + "-gt.txt");
    cur_gts = random.choices(gene_trees, k=num_gene_trees);
    with open(cur_gt_file, "w") as gtout:
        gtout.write("\n".join(cur_gts));

    prefix = rep_outdir + "/rep" + rep_str;

    iqtree_cmd = "iqtree -t " + species_tree + " --gcf " + cur_gt_file + " --df-tree --cf-verbose --prefix " + prefix + " -T 32";
    print(iqtree_cmd);
    os.system(iqtree_cmd);

