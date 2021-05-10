#!/usr/bin/python
############################################################
# For exomes, 04.2021
# Adds rat exon ids to an annotation file.
############################################################

import sys

blastfile = "../03-Alignments/blast/mm10-exon-to-rnor6/exon-to-exon-hits-bit.txt";
meid_to_reid = {};
for line in open(blastfile):
    line = line.strip().split("\t");
    meid_to_reid[line[0]] = line[1];
print(len(meid_to_reid));

annotfile = "../02-Annotation-data/Mus-selected-sequences_metadata_samp-counts.csv";
# The annotation file.
outfilename = "../02-Annotation-data/Mus-selected-sequences_metadata_samp-counts_ratids.csv";

with open(outfilename, "w") as outfile:
    first = True;
    for line in open(annotfile):
        line = line.strip();
        if first:
            outfile.write(line + ",rat_exon_id\n");
            first = False;
            continue;

        line_list = line.split(",");
        #print(len(line_list));
        meid = line_list[17];
        try:
            line += "," + meid_to_reid[meid] + "\n";
        except KeyError:
            line += ",NA\n";

        outfile.write(line);

