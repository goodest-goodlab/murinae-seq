#!/usr/bin/env python3
#############################################################################
# For concatenating alignments that may contain missing data
# Fills in any missing taxa for a particular locus with "-"
#
# Gregg Thomas
# Spring 2022
#############################################################################

import sys, os
import core as CORE
import seqparse as SEQ
import treeparse as tp

#############################################################################

indir = "/mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/aa-nrf-below-0.25/";
tree_file = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/mcmc-dating/full_coding_iqtree_astral.cf.bl.nrf25.treefile";
outfile = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/mcmc-dating/full-coding-aa-nrf-below-0.25.fa";

print("Reading species list from tree...");
tinfo, tree, root = tp.treeParse(open(tree_file).read());
species = [">" + n for n in tinfo if tinfo[n][2] == 'tip'];
print("Read " + str(len(species)) + " species")

print("Concatenating alignments...");

concat_alns = { spec : "" for spec in species };
num_alns = 0;
missing_spec = [];
for locus in os.listdir(indir):
    if not locus.endswith(".fa"):
        continue;

    aln_file = os.path.join(indir, locus);

    cur_seqs = SEQ.fastaGetDict(aln_file);

    aln_len = len(cur_seqs[list(cur_seqs.keys())[0]]);
    print(locus, aln_len);

    for sample in cur_seqs:
        if sample not in species:
            sys.exit("ERROR: Unknown species found in alignment file: " + locus + " " + sample);

    missing_spec.append(0);
    for spec in species:
        if spec in cur_seqs:
            concat_alns[spec] += cur_seqs[spec];
        else:
            concat_alns[spec] += "N" * aln_len;
            missing_spec[-1] += 1;
    num_alns += 1;

print("Concatenated " + str(num_alns) + " alignments");
print("Total missing sequences: ", sum(missing_spec));
print("Avg. missing sequences per aln: ", CORE.mean(missing_spec));

print("Writing concatenated alignments...");
with open(outfile, "w") as OUT:
    num_written = 0;
    for spec in concat_alns:
        OUT.write(spec + "\n");
        OUT.write(concat_alns[spec] + "\n");
        num_written +=1;
print("Wrote " + str(num_written) + " alignments")
print("Done!");