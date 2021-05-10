#!/usr/bin/python3
############################################################
# For rat exomes, 04.2021
# Using a combination of mouse exon to rat exon BLAST and
# Ensembl orthology predictions, generates a master table
# to convert between any mouse and rat Ensembl ID.
############################################################

import sys, os, core

############################################################

orthfile = "../02-Annotation-data/mouse-rat-orths-ens99.txt";
transcripts_file = "../02-Annotation-data/selected-transcripts-targets.txt";
blastfile = "../03-Alignments/blast/mm10-exon-to-rnor6/exon-to-exon-hits-bit.txt";
mousefile = "../Reference-genomes/mm10/mm10-ens99-ids.tab";
ratfile = "../Reference-genomes/Rnor6/rnor6-ens99-ids.tab";
outfilename = "../02-Annotation-data/mm10-rnor6-master-transcript-id-table.tab";

headers = ["mgid", "mtid", "mpid", "meid", "reid", "rpid", "rtid", "rgid"];

core.PWS("# " + core.getDateTime() + " Reading mouse-rat one-to-one orthologs: " + orthfile);
orths = {};
# Dict to convert between mouse transcript IDs and rat protein IDs
first = True;
for line in open(orthfile):
    if first:
        first = False;
        continue;
    # Skip the header
    
    line = line.strip().split("\t");

    if len(line) < 6:
        continue;
    # If there are no orths, skip.

    if line[7] != "ortholog_one2one":
        continue;
    # If the relationship isn't one-to-one, skip.

    mouse_tid = line[1];
    rat_id = line[6];
    orths[mouse_tid] = rat_id
    # Add the related gene ids to the orths dict. 
core.PWS("# " + core.getDateTime() + " Single-copy orthologs read: " + str(len(orths)));
core.PWS("# ----------------");
## Get the mouse transcript and rat protein 

core.PWS("# " + core.getDateTime() + " Reading selected transcripts for exome analysis: " + transcripts_file);
selected_transcripts = [];
first = True;
for line in open(transcripts_file):
    if line[0] == "#":
        continue;
    if first:
        first = False;
        continue;
    # Skip comment and header lines.

    line = line.strip().split("\t");
    selected_transcripts.append(line[1]);
    # Add the mouse transcript id to the transcripts dict
selected_transcripts = list(set(selected_transcripts));
# Remove redundant transcripts.
core.PWS("# " + core.getDateTime() + " Transcripts read: " + str(len(selected_transcripts)));
core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Reading mouse transcript IDs: " + mousefile);
mouse_tids = {};
first = True;
for line in open(mousefile):
    if first:
        first = False;
        continue;
    # Skip the header

    line = line.strip().split("\t");

    if len(line) != 4:
        sys.exit(line);
    # Skip lines that are too short or too long

    mouse_tids[line[1]] = line[:1] + line[2:3];
core.PWS("# IDs read: " + str(len(mouse_tids)));               
core.PWS("# ----------------");
## Get the mouse 

core.PWS("# " + core.getDateTime() + " Reading rat IDs: " + ratfile);
rat_tids = {};
rat_pids = {};
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

    if line[1] != "":
        rat_tids[line[1]] = line[:1] + line[2:3];
    if line[2] != "":
        rat_pids[line[2]] = line[:2];

core.PWS("# Transcript IDs read: " + str(len(rat_tids)));
core.PWS("# Protein IDs read:    " + str(len(rat_pids)));
core.PWS("# ----------------");
## Get the rat IDs

with open(outfilename, "w") as outfile:
    for mtid in orths:
        if mtid not in selected_transcripts:
            continue;

        rat_id = orths[mtid];

        outline = [mouse_tids[mtid][0]] + [mtid] + [mouse_tids[mtid][1]];

        if "ENSRNOP" in rat_id:
            outline += rat_pids[rat_id] + [rat_id];

        elif "ENSRNOT" in rat_id:
            outline += [rat_tids[rat_id][0]] + [rat_id] + [rat_tids[rat_id][1]];

        print("\t".join(outline));
        outfile.write("\t".join(outline) + "\n");





# core.PWS("# " + core.getDateTime() + " Reading selected transcripts for exome analysis: " + transcripts_file);
# selected_transcripts = [];
# first = True;
# for line in open(transcripts_file):
#     if line[0] == "#":
#         continue;
#     if first:
#         first = False;
#         continue;
#     # Skip comment and header lines.

#     line = line.strip().split("\t");
#     selected_transcripts.append(line[1]);
#     # Add the mouse transcript id to the transcripts dict
# selected_transcripts = set(selected_transcripts);
# # Remove redundant transcripts.
# core.PWS("# " + core.getDateTime() + " Transcripts read: " + str(len(selected_transcripts)));
# core.PWS("# ----------------");

# core.PWS("# " + core.getDateTime() + " Reading mouse exon to rat exon BLAST best hits file: " + blastfile);
# meid_to_reid = {};
# for line in open(blastfile):
#     line = line.strip().split("\t");
#     meid_to_reid[line[0]] = line[1];
# core.PWS("# " + core.getDateTime() + " Exon hits read: " + str(len(meid_to_reid)));
# core.PWS("# ----------------");
# ## Get the exon BLAST hits



# with open(outfilename, "w") as outfile:
#     for meid in meid_to_reid:
#         if meid not in mouse_ids:
#             print("***", meid);
#             continue;

#         if mouse_ids[meid][1] not in selected_transcripts:
#             continue;

#         outline = mouse_ids[meid] + [meid] + [meid_to_reid[meid]] + rat_ids[meid_to_reid[meid]][::-1];
#         # print(mouse_ids[meid]);
#         # print(meid);
#         # print([mouse_ids[meid]]);
#         # print(rat_ids[meid_to_reid[meid]]);


#         print("\t".join(outline));


#         print(meid, mouse_ids[meid]);
#         print(meid_to_reid[meid], rat_ids[meid_to_reid[meid]]);
#         print(mtid_to_rpid[mouse_ids[meid][1]]);

#         if mtid_to_rpid[mouse_ids[meid][1]] != rat_ids[meid_to_reid[meid]][2]:
#             continue;
#             #sys.exit();
#         outfile.write("\t".join(outline) + "\n")
#         print("----------")
#         #print(orths[mouse_ids[meid][]])
#         #sys.exit();