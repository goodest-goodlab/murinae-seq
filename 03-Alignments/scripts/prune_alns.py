#!/usr/bin/env python3
#############################################################################
# For running selection tests on pared trees, we also prune alignments
#
# Gregg Thomas
# Fall 2021
#############################################################################

import sys, os
import core as CORE
import seqparse as SEQ

#############################################################################

indir = "../03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/nt/";
outdir = "../03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/nt-pared/";

prune_file = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo-scripts/tree-paring/min-spec-paring-astral-exempt/all-pruned-tips.txt";
prune_labels = [ ">" + label for label in open(prune_file, "r").read().split("\n") ];

if not os.path.isdir(outdir):
    os.system("mkdir " + outdir);

alns_empty = 0;
alns_written = 0;

for f in os.listdir(indir):
    if not f.endswith(".fa"):
        continue;

    infilename = os.path.join(indir, f);
    outfilename = os.path.join(outdir, f);

    cur_seqs = SEQ.fastaGetDict(infilename);

    new_seqs = {};

    for label in cur_seqs:
        if label not in prune_labels:
            new_seqs[label] = cur_seqs[label];

    if not new_seqs:
        alns_empty += 1;
        continue;

    with open(outfilename, "w") as outfile:
        for label in new_seqs:
            outfile.write(label + "\n");
            outfile.write(new_seqs[label] + "\n");
    alns_written += 1;


print("empty aligns after pruning: " + str(alns_empty));
print("pruned aligns written     : " + str(alns_written));