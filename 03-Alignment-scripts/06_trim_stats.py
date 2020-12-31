#!/usr/bin/python3
###########################################################
# For rodent exomes, 12.2020
# Gathers stats from first trimming step in MACSE pipeline
###########################################################

import sys, os, core, argparse

###########################################################

indir = "../03-Alignments/macse/01_full-trim/supp/";
outfilename = "logs/06-cds-trim-stats.csv";

with open(outfilename, "w") as outfile:
    first_file = True;
    for f in os.listdir(indir):
        if not f.endswith(".csv"):
            continue;

        gid = f.split("-")[0];

        infile = os.path.join(indir, f);
        first_line = True;

        for line in open(infile):
            if first_line:
                if first_file:
                    outfile.write("gene id;" + line);
                    first_file = False;

                first_line = False;
                continue;

            outfile.write(gid + ";" + line);
