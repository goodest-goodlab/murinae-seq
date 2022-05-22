#!/usr/bin/python
############################################################
# For rodent exomes, Spring 2022
#
# Reads concordance factors by node per gene and
# gathers gene info
############################################################

import sys, os, core, seqparse, argparse
import treec as TREE

############################################################
# Functions

transcript_file = "/mnt/beegfs/gt156213e/murinae-seq/02-Annotation-data/selected-transcripts-targets.txt";
cf_tree_file = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concord-rooted-NEW/full_coding_iqtree_astral.cf.stat_tree";
species_tree_file = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concord-rooted-NEW/full_coding_iqtree_astral.cf.branch";
gene_tree_file = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/loci-labeled-NEW.treefile";
outfilename = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/concord-rooted-NEW/topo-counts.tab";

print("reading annotation table...");

gene_data = {};
first = True;
for line in open(transcript_file):
    if line[0] == "#":
        continue;

    if first:
        first = False;
        continue;

    line = line.strip().split("\t");

    gene_data[line[2]] = { 'mgid' : line[0], 'mtid' : line[1], 'mchr' : line[15], 'mstart' : line[16], 'mend' : line[17], 'rgid' : line[5], 'rid' : line[6], 'rchr' : line[21], 'rstart': line[22], 'rend' : line[23] };

print("reading gene tree ids...");

gtids = {};
i = 1;
for line in open(gene_tree_file):
    line = line.strip().split("\t");
    gtids[str(i)] = line[0].split("-")[0];
    i += 1;

print("reading iqtree labels...");

tree = TREE.Tree(open(species_tree_file, "r").read());


print("reading quartet topos and writing output...");
with open(outfilename, "w") as outfile:
    h1 = [ "iqtree.node", "tp.node", "iqtree.gene",  "mpid" ];
    h2 = [ "mgid", "mtid", "mchr", "mstart", "mend", "rgid", "rid", "rchr", "rstart", "rend"];
    h3 = ["topo"];
    headers = h1 + h2 + h3;

    outfile.write("\t".join(headers) + "\n");

    first = True;
    for line in open(cf_tree_file):
        if line[0] == "#":
            continue;

        if first:
            first = False;
            continue;
        #print(line);

        line = line.strip().split("\t");
        node = line[0];
        iqtree = line[1];

        topo = "NA";
        if line[2] == "1":
            topo = "c";
        elif line[3] == "1":
            topo = "d1";
        elif line[4] == "1":
            topo = "d2";

        tpid = [ l for l in tree.label if tree.label[l] == node ][0];
        pid = gtids[iqtree];

        gene = gene_data[pid];

        outline = [node, tpid, iqtree, pid] + [ gene[h] for h in h2 ] + [topo];
        #print(outline);
        outfile.write("\t".join(outline) + "\n");