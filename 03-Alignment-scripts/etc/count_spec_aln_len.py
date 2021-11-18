#!/usr/bin/python3
############################################################
# For rat exomes, 06.2021
# Counts the length of alignments by species.
############################################################

import sys, os, core

inp = sys.argv[1];


if os.path.isdir(inp):
    for f in os.listdir(inp):
        alnfile = os.path.join(inp, f);
        #print(alnfile);

        if f.endswith(".phy"):
            seqs = core.phylipGetDict(alnfile)[0];
        elif f.endswith(".fa"):
            seqs = core.fastaGetDict(alnfile);
        else:
            continue;

        for title in seqs:
            print(",".join([f,title.replace("_R_", ""),str(len(seqs[title]))]));

elif os.path.isfile(inp):
    if inp.endswith(".phy"):
        seqs = core.phylipGetDict(inp)[0];
    elif inp.endswith(".fa"):
        seqs = core.fastaGetDict(inp);
    for title in seqs:
        print(",".join([title.replace("_R_", ""),str(len(seqs[title]))]));
