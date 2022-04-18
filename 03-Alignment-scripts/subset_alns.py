#!/usr/bin/env python3
#############################################################################
# For copying alignments of subsets of loci
#
# Gregg Thomas
# Fall 2021
#############################################################################

import sys, os
#import core as CORE
#import seqparse as SEQ

#############################################################################

indir = "../03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/aa/";
outdir = "../03-Alignments/exonerate/full-coding-trimmed-f175-seq20-site50/aa-nrf-below-0.25/";

subset_file = "/mnt/beegfs/gt156213e/murinae-seq/04-Phylo/full-coding-iqtree/loci-nrf-below-0.25.txt";
subset_loci = [ line.split("\t")[0] for line in open(subset_file, "r").read().split("\n") ];

if not os.path.isdir(outdir):
    os.system("mkdir " + outdir);

alns_not_found = 0;
alns_copied = 0;

for locus in subset_loci:
    infilename = os.path.join(indir, locus + "-mafft-cds.filter.fa");
    if not os.path.isfile(infilename):
        alns_not_found += 1;
        continue;

    outfilename = os.path.join(outdir, locus + "-mafft-cds.filter.fa");
    cp_cmd = "cp " + infilename + " " + outfilename;
    print(cp_cmd);
    os.system(cp_cmd);
    alns_copied += 1;

print("aligns not found: " + str(alns_not_found));
print("aligns copied   : " + str(alns_copied));