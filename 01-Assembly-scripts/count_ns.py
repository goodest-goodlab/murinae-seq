#!/usr/bin/python3
###########################################################
# For rodent exomes, 03.2021
# Simply counts all the Ns and heterozygous sites in each
# exome assembly
###########################################################

import sys, os, core, math, argparse, subprocess, multiprocessing as mp

###########################################################

asmdir = "../01-Assembly-data/10-Varcall/";
outfilename = "logs/count-ns.csv";

with open(outfilename, "w") as outfile:
    headers = ["sample", "contig", "length", "Ns", "hets", "softmasked"];
    outfile.write(",".join(headers) + "\n");
    for sample in os.listdir(asmdir):
        print("# Reading sample:", sample);
        asmfile = os.path.join(asmdir, sample, sample + "-iupac-consensus.fa");
        contigs = core.fastaGetDict(asmfile);
        print("#   ", len(contigs), "contigs read.");

        for contig in contigs:
            #print(contig);

            sample_dict = { contig : {'Ns' : 0, 'hets' : 0, 'softmasked' : 0} };
            seq = contigs[contig];

            ns = seq.count("N") + seq.count("n");
            hets = sum( [ seq.count(base) for base in "RYSWKMBDHVryswkmbdhv" ] );
            soft = sum( [ 1 for base in seq if base.islower() ] );

            outline = [ sample, contig.split(" ")[0][1:], str(len(seq)), str(ns), str(hets), str(soft) ];
            outfile.write(",".join(outline) + "\n");




