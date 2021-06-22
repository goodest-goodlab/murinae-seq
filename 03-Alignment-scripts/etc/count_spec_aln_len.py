#!/usr/bin/python3
############################################################
# For rat exomes, 06.2021
# Counts the length of alignments by species.
############################################################

import sys, os, core

indir = sys.argv[1];

for f in os.listdir(indir):
    if not f.endswith(".fa"):
        continue;

    alnfile = os.path.join(indir, f);

    seqs = core.fastaGetDict(alnfile);

    for title in seqs:
        print(",".join([f,title.replace("_R_", ""),str(len(seqs[title]))]));