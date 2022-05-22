#!/usr/bin/python
############################################################
# For rodent exomes, 03.2021
# Takes Carl's full contig BLAST hit table and compares the
# number of hits to the number of mouse exons from an exonerate run
############################################################

import sys, os, core, coreseq, argparse

############################################################

annotation_file = "../02-Annotation-data/Mus-selected-sequences_metadata_samp-counts_ratids.csv";
blast_file = "../02-Annotation-data/all-samples_contig-match.txt";
outfilename = "etc/sample-hits-exons.csv";
#exonerate_dir = "../03-Alignments/exonerate-tests-rat/f0/seq-f0/";
#outfilename = os.path.join(exonerate_dir, "sample-hits-exons.csv");


core.PWS("# Reading exons per transcripts: " + annotation_file);
transcripts = {};

first = True;
for line in open(annotation_file):
    if first:
        first = False;
        continue;
    line = line.replace("\"", "").strip().split(",");
    coding, tid = line[1].replace("\"", ""), line[9].replace("\"", "");
    if tid == "NA":
        continue;

    if tid not in transcripts:
        transcripts[tid] = { 'coding-exons' : 0, 'total-exons' : 0 };

    transcripts[tid]['total-exons'] += 1;
    if coding == "TRUE":
        transcripts[tid]['coding-exons'] += 1;

core.PWS("# Total transcripts read: " + str(len(transcripts)));
core.PWS("# ----------------");
# Reads the mouse and target annotation info.

core.PWS("# " + core.getDateTime() + " Reading BLAST hits per transcript: " + blast_file);
samples = {};
for line in open(blast_file):
    line = line.strip().split(" ");
    #print(line);

    sample, tid = line[2], line[5];

    if tid == "NA":
        continue;

    if sample not in samples:
        samples[sample] = {};
    
    if tid not in samples[sample]:
        samples[sample][tid] = 0;

    samples[sample][tid] += 1;
core.PWS("# ----------------");

# core.PWS("# " + core.getDateTime() + " Reading mouse exons per transcript: " + infilename);
# transcripts = {};
# first = True;
# for line in open(infilename):
#     if first:
#         first = False;
#         continue;
#     line = line.strip().split(",");
#     tid, num_exons = line[3], line[5];
#     transcripts[tid] = str(num_exons);
# core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Writing output: " + outfilename);
with open(outfilename, "w") as outfile:
    headers = ["sample", "transcript", "blast hits", "total exons", "coding exons"];
    outfile.write(",".join(headers) + "\n");
    for sample in samples:
        for tid in samples[sample]:
            if tid not in transcripts:
                continue;
            outline = [sample, tid, str(samples[sample][tid]), str(transcripts[tid]['total-exons']), str(transcripts[tid]['coding-exons'])]; 
            outfile.write(",".join(outline) + "\n");
core.PWS("# ----------------");