#!/usr/bin/python3
############################################################
# For rat exomes, 05.2021
# Compares the number of mouse and rat exons in selected
# transcripts.
############################################################

import core
from collections import defaultdict
############################################################

def parseHeaderIds(seqdict):
# This function re-parses some of the FASTA header IDs
    tid_to_eids = {};

    new_seqdict = {};
    for title in seqdict:
        tid = title.split("|")[1];
        eids = title.split("|")[2].split(";");
        tid_to_eids[tid] = eids;
    return tid_to_eids;

############################################################

transcripts_file = "../02-Annotation-data/selected-transcripts-targets.txt";
ratfile = "../Reference-genomes/Rnor6/rnor6-ens99-ids.tab";

core.PWS("# " + core.getDateTime() + " Reading selected transcripts for exome analysis: " + transcripts_file);
mtid_to_rpid = {};
first = True;
for line in open(transcripts_file):
    if line[0] == "#":
        continue;
    if first:
        first = False;
        continue;
    # Skip comment and header lines.

    line = line.strip().split("\t");
    mtid_to_rpid[line[1]] = line[6];
    # Add the mouse transcript id to the transcripts dict
# Remove redundant transcripts.
core.PWS("# " + core.getDateTime() + " Transcripts read: " + str(len(mtid_to_rpid)));
core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Reading rat IDs: " + ratfile);
rpid_to_rtid = {};
first = True;
for line in open(ratfile):
    if first:
        first = False;
        continue;
    # Skip the header

    line = line.strip().split("\t");

    if len(line) != 4:
        sys.exit(line);
    # Skip lines that are too short or too long

    rpid_to_rtid[line[2]] = line[1];
core.PWS("# IDs read: " + str(len(rpid_to_rtid)));               
core.PWS("# ----------------");
## Get the rat IDs




add_rat = True;
rat_ts_file = "../Reference-genomes/Rnor6/Rattus_norvegicus.Rnor_6.0.transcript.all.fa";
# Sequences downloaded from Ensembl Biomart
core.PWS("# " + core.getDateTime() + " Reading rat exon sequences: " + rat_ts_file);
rat_ts = core.fastaGetDict(rat_ts_file);
# Read the sequences
rat_ts = parseHeaderIds(rat_ts);
# Parse the header IDs so they only contain the exon ID.
core.PWS("# Total sequences read: " + str(len(rat_ts)));               
core.PWS("# ----------------");



add_mouse = True;
mouse_ts_file = "../Reference-genomes/mm10/Mus_musculus.GRCm38.transcript.all.fa";
# Sequences downloaded from Ensembl Biomart
core.PWS("# " + core.getDateTime() + " Reading mouse exon sequences: " + mouse_ts_file);
mouse_ts = core.fastaGetDict(mouse_ts_file);
# Read the sequences
mouse_ts = parseHeaderIds(mouse_ts);
# Parse the header IDs so they only contain the exon ID.
core.PWS("# Total sequences read: " + str(len(mouse_ts)));               
core.PWS("# ----------------");
# This block adds the mouse exon sequences + 500bp of flanking sequence

diff_dist = defaultdict(int);
for mtid in mtid_to_rpid:
    rtid = rpid_to_rtid[mtid_to_rpid[mtid]];

    mouse_exons = len(mouse_ts[mtid]);
    rat_exons = len(rat_ts[rtid]);

    diff_dist[mouse_exons-rat_exons] += 1;

    if mouse_exons != rat_exons:
        print(mtid, rtid);

for diff in sorted(list(diff_dist.keys())):
    print(diff, diff_dist[diff]);