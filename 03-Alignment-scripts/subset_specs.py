#!/usr/bin/env python3
#############################################################################
# For copying alignments of subsets of sequences
#
# Gregg Thomas
# Fall 2021
#############################################################################

import sys, os
#import core as CORE
import seqparse as SEQ

#############################################################################

indir = "../03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/nt/";
outdir = "../03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/nt-morphometrics/";

subset_file = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo-scripts/morphometrics-tips.txt";
subset_tips = [ line.split("\t")[0] for line in open(subset_file, "r").read().split("\n") ];

if not os.path.isdir(outdir):
    os.system("mkdir " + outdir);

alns_low_seq = 0;
alns_copied = 0;

for locus in os.listdir(indir):
    if not locus.endswith(".fa"):
        continue;

    infilename = os.path.join(indir, locus);
    outfilename = os.path.join(outdir, locus);

    cur_seqs = SEQ.fastaGetDict(infilename);

    new_seqs = {};
    for title in cur_seqs:
        #print(title);
        if title[1:] in subset_tips:
            new_seqs[title] = cur_seqs[title];

    if len(new_seqs) < 4:
        alns_low_seq += 1;
        continue;

    with open(outfilename, "w") as outfile:
        for title in new_seqs:
            outfile.write(title + "\n");
            outfile.write(new_seqs[title] + "\n");
    alns_copied += 1;

print("aligns with less than 4 seqs: " + str(alns_low_seq));
print("aligns copied               : " + str(alns_copied));