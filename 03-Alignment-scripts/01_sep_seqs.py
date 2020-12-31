#!/usr/bin/python3
############################################################
# For rat exomes, 10.2020
# Separates a single FASTA file with all targets into 
# FASTA files for each target.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mseq, mfiles, globs
from collections import defaultdict

############################################################

infilename = "../03-Alignments/raw/Full-dataset_iupac-no-trim-coding_contigs.fa";
outdir = "../03-Alignments/seq/full/";

# infilename = "../03-Alignments/raw/Emily-Data_iupac-no-trim-coding_contigs.fa";
# outdir = "../03-Alignments/seq/emily-subset/";

if not os.path.isdir(outdir):
    os.system("mkdir " + outdir);

mcore.PWS("# " + mcore.getDateTime() + " Reading sequences...");
all_seqs = mseq.fastaGetDict(infilename);
mcore.PWS("# Total sequences read: " + str(len(all_seqs)));               
mcore.PWS("# ----------------");

mcore.PWS("# " + mcore.getDateTime() + " Separating sequences...");
seqs_by_target = defaultdict(dict);
for title in all_seqs:
    target, spec = title[1:].split("_|_");
    seqs_by_target[target][spec] = all_seqs[title];
mcore.PWS("# Total targets found:  " + str(len(seqs_by_target)));               
mcore.PWS("# ----------------");

mcore.PWS("# " + mcore.getDateTime() + " Writing sequences...");
files_written, seqs_written = 0, 0;
for target in seqs_by_target:
    outfilename = os.path.join(outdir, target + ".fa");
    with open(outfilename, "w") as outfile:
        for spec in seqs_by_target[target]:
            outfile.write(">" + spec + "\n");
            outfile.write(seqs_by_target[target][spec] + "\n");
            seqs_written += 1;
        files_written += 1;
mcore.PWS("# Sequences written: " + str(seqs_written)); 
mcore.PWS("# Files written:     " + str(files_written));               
mcore.PWS("# ----------------");