#!/usr/bin/python3
############################################################
# For rodent exomes, 04.2020
# Retrieves the exons from each selected transcript and
# concatenates them together as CDS's.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, mcore, gzip, re
from collections import defaultdict

############################################################

if "-h" in sys.argv:
    sys.exit("Usage: python intron_sizes.py <species: mouse or rat (required)>");

if len(sys.argv) < 2:
    sys.exit(" * ERROR: Species must be provided: macaque or human");
species = sys.argv[1];
if sys.argv[1] not in ["mouse", "rat"]:
    sys.exit(" * ERROR: Species must be provided: macaque or human");

if species == 'mouse':
    gtffile = "../Reference-genomes/mm10/Mus_musculus.GRCm38.99.gtf.gz";
    regstr = "MUS";
elif species == 'rat':
    gtffile = "../Reference-genomes/Rnor6/Rattus_norvegicus.Rnor_6.0.99.gtf.gz";
    regstr = "RNO"
outfilename = "intron-sizes-" + species + ".csv";

mcore.runTime("# Rodent exomes -- get intron lengths");
mcore.PWS("# GTF file:              " + gtffile);
mcore.PWS("# Output file:           " + outfilename);
mcore.PWS("# ----------------");

mcore.PWS("# " + mcore.getDateTime() + " Reading transcripts...");
transcripts = {};
transcript_len_sum, first = 0, True;
for line in gzip.open(gtffile):
    line = line.decode();
    if line[0] == "#":
        continue;
    line = line.strip().split("\t");
    feature_type, chrome, start, end, strand, feature_info = line[2], line[0], int(line[3]), int(line[4]), line[6], line[8];

    if feature_type == "transcript" and "protein_coding" in feature_info:
        tid = re.findall('ENS' + regstr + 'T[\d]+', feature_info)[0];
        length = end - start;
        transcript_len_sum += int(length);
        transcripts[tid] = {'strand' : strand, 'exons' : {}};
num_transcripts = len(transcripts)
mcore.PWS("# Transcripts read:        " + str(num_transcripts));
mcore.PWS("# Avg. transcript length:  " + str(transcript_len_sum / num_transcripts));
mcore.PWS("# ----------------");

mcore.PWS("# " + mcore.getDateTime() + " Reading exons...");
exon_len_sum, num_exons, first = 0, 0, True;
for line in gzip.open(gtffile):
    line = line.decode();
    if line[0] == "#":
        continue;
    line = line.strip().split("\t");
    feature_type, chrome, start, end, strand, feature_info = line[2], line[0], int(line[3]), int(line[4]), line[6], line[8];

    if feature_type == "exon":
        num_exons += 1;
        tid = re.findall('ENS' + regstr + 'T[\d]+', feature_info)[0];
        if tid in transcripts:
            eid = re.findall('ENS' + regstr + 'E[\d]+', feature_info)[0];
            feature_info = feature_info.split("; ");
            exon_number = [ i[i.index(" ")+1:].replace("\"", "") for i in feature_info if "exon_number" in i ][0];
            length = end - start;
            exon_len_sum += int(length);
            transcripts[tid]['exons'][exon_number] = {'eid' : eid, 'start' : start, 'end' : end, 'len' : length};
mcore.PWS("# Exons read:        " + str(num_exons));
mcore.PWS("# Avg. exon length:  " + str(exon_len_sum / num_exons));
mcore.PWS("# ----------------");

mcore.PWS("# " + mcore.getDateTime() + " Calculating average space between exons...");
with open(outfilename, "w") as outfile:
    headers = 'exon id,exon len,intron len';
    outfile.write(headers + "\n");
    num_introns, intron_len_sum, max_len = 0, 0, 0;
    for tid in transcripts:
        num_exons = len(transcripts[tid]['exons']);
        for x in range(num_exons):
            start = transcripts[tid]['exons'][str(x+1)]['start'];
            end = transcripts[tid]['exons'][str(x+1)]['end'];

            if x == 0:
                outline = [transcripts[tid]['exons'][str(x+1)]['eid'], str(transcripts[tid]['exons'][str(x+1)]['len']), "NA"];

            else:
                num_introns += 1;

                if transcripts[tid]['strand'] == "+":
                    intron_len = start - last_end;
                elif transcripts[tid]['strand'] == "-":
                    intron_len = last_end - start;
                intron_len_sum += intron_len;

                if intron_len > max_len:
                    max_len = intron_len;

                outline = [transcripts[tid]['exons'][str(x+1)]['eid'], str(transcripts[tid]['exons'][str(x+1)]['len']), str(intron_len)];
            outfile.write(",".join(outline) + "\n");

            last_end = end;
            last_start = start;

mcore.PWS("# Number introns:      " + str(num_introns));
mcore.PWS("# Max intron size:     " + str(max_len));
mcore.PWS("# Avg. intron length:  " + str(intron_len_sum / num_introns));
mcore.PWS("# ----------------");