#!/usr/bin/python
############################################################
# For exomes, 04.2021
# Given a BLAST file, gets the best BLAST hit for each query.
# bedtools getfasta -fi /mnt/beegfs/gt156213e/murinae-seq/Reference-genomes/Rnor6/rnor6.fa -fo transcript.fa -name -bed transcript.bed
# makeblastdb -in transcript.fa -dbtype nucl -out rat-transcript
# blastn -db mouse-transcript -query ../transcript.fa -outfmt 6 -max_hsps 1 -max_target_seqs 1 -num_threads 32 -out psun-to-mm10-blast.txt
############################################################

import sys, os, argparse, core
from collections import defaultdict

############################################################

def maxScore(hits, score_ind):
# Function to get the max score from a list of lists of scores.
    max_hit, max_score = "", 0;
    for hit in hits:
        score = hit[score_ind];
        if score > max_score:
            max_score = score;
            max_hit = hit;

    return max_hit;

##################

def minScore(hits, score_ind):
# Function to get the min score from a list of lists of scores.
    min_hit, min_score = "", 999999;
    for hit in hits:
        score = hit[score_ind];
        if score < min_score:
            min_score = score;
            min_hit = hit;

    return min_hit;

############################################################

parser = argparse.ArgumentParser(description="Exonerate command generator");
parser.add_argument("-b", dest="blastfile", help="The query-to-target blast output file.", default=False);
parser.add_argument("-s", dest="score_mode", help="The score type to maximize by. One of: len, eval, bit", default=False);
parser.add_argument("-e", dest="eval_cutoff", help="The max evalue to consider a hit. Default: 1e-3", type=float, default=1e-3);
parser.add_argument("-o", dest="out_prefix", help="Desired output file PREFIX.", default=False);
parser.add_argument("--overwrite", dest="overwrite", help="If the output file already exists and you wish to overwrite it, set this option.", action="store_true", default=False);
args = parser.parse_args();
# IO options

if any(arg == False for arg in [args.blastfile, args.score_mode, args.out_prefix]):
    parser.print_help();
    sys.exit(" * ERROR 1: all options must be provided. See help menu with -h.");

if not os.path.isfile(args.blastfile):
    sys.exit(" * ERROR 2: Blast file not found (-b).");

if args.score_mode not in ["len", "eval", "bit"]:
    sys.exit(" * ERROR 3: Score mode (-s) must be one of: len, eval, bit.");

outfilename = args.out_prefix + "-" + args.score_mode + ".txt";
multioutfilename = args.out_prefix + "-" + args.score_mode + "-multi.txt";
print(" # Output file name: " + outfilename);
if os.path.isfile(outfilename) and not args.overwrite:
    sys.exit(" * ERROR 4: Output file already exists! Explicity specify --overwrite to overwrite it.");
# Input and error checking

# orthfile = "../02-Annotation-data/mouse-rat-orths-ens99.txt";
# # The ortholog file between mouse and rat.

# core.PWS("# " + core.getDateTime() + " Reading mouse-rat one-to-one orthologs: " + orthfile);
# orths = {};
# first = True;
# for line in open(orthfile):
#     if first:
#         first = False;
#         continue;
#     line = line.strip().split("\t");

#     if len(line) < 6:
#         continue;
#     # If there are no orths, skip.

#     if line[7] != "ortholog_one2one":
#         continue;
#     # If the relationship isn't one-to-one, skip.

#     mouse_gid = line[0];
#     rat_gid = line[5];

#     orths[mouse_gid] = rat_gid;
#     # Add the related gene ids to the orths dict. 
# core.PWS("# " + core.getDateTime() + " Single-copy orthologs read: " + str(len(orths)));
# core.PWS("# ----------------");

# transcripts_file = "../02-Annotation-data/selected-transcripts-targets.txt";
# # The selected transcripts between mouse and rat for the exome analysis.

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

orthfile = "master-transcript-id-table.tab";
# The ortholog file between mouse and rat.
orth_tids = {};
first = True;
for line in open(orthfile):
    if first:
        first = False;
        continue;
    line = line.strip().split("\t");

    orth_tids[line[1]] = line[4];
    # Add the related gene ids to the orths dict.
mouse_tids = set(list(orth_tids.keys()));
rat_tids = set(list(orth_tids.values()));
core.PWS("# " + core.getDateTime() + " Orthologs read: " + str(len(orth_tids)));
core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Reading BLAST file: " + args.blastfile);
query_hits = defaultdict(list);
total_hits, query_ids, target_ids = 0, [], [];
for line in open(args.blastfile):
    total_hits += 1;
    line = line.strip().split("\t");
    query_gid = line[0].split("|")[0];
    query_tids = set(line[0].split("|")[1].split(";"));
    query_eid = line[0].split("|")[2];
    target_gid = line[1].split("|")[0];
    target_tids = set(line[1].split("|")[1].split(";"));
    target_eid = line[1].split("|")[2];
    aln_len = int(line[3]); 
    evalue = float(line[10]);
    bit = float(line[11]);
    # Get all the ids and scores for the current hit.

    if evalue > args.eval_cutoff:
        continue;
    # If the evalue is above the cutoff, skip this hit.

    target_tid_orth = list(target_tids.intersection(rat_tids));
    query_tid_orth = list(query_tids.intersection(mouse_tids));

    if target_tid_orth == [] or query_tid_orth == []:
        continue;

    if orth_tids[query_tid_orth[0]] != target_tid_orth[0]:
        #print(query_tid_orth, target_tid_orth);
        continue;

    # if query_gid not in orths or target_gid not in orths[query_gid]:
    #     continue;
    # # If the mouse gene isn't in the single-copy list, or the rat gene isn't orthologous to the mouse gene, skip.

    # if len(list(query_tids.intersection(selected_transcripts))) == 0:
    #     continue;
    # # If the transcript isn't one of the selected transcripts, skip.

    query_ids.append(query_eid);
    target_ids.append(target_eid);
    # Add the exon ids to the lists of ids.

    hit = [query_tid_orth[0], target_eid, target_tid_orth[0], aln_len, evalue, bit];
    query_hits[query_eid].append(hit);
    # Add the hit to the hits dict.

core.PWS("# " + core.getDateTime() + " Total hits :      " + str(total_hits));
core.PWS("# " + core.getDateTime() + " Orthologous hits: " + str(len(query_hits)));
core.PWS("# " + core.getDateTime() + " Unique query ids: " + str(len(list(set(query_ids)))));
core.PWS("# " + core.getDateTime() + " Unique target ids:" + str(len(list(set(target_ids)))));
core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Distribution of hits per mouse exon id:");
hit_dist = defaultdict(int);
for query_id in query_hits:
    num_hits = len(query_hits[query_id]);
    hit_dist[num_hits] += 1;
for key in sorted(list(hit_dist.keys())):
    print(key, hit_dist[key]);
core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Filtering scores based on: " + args.score_mode);
query_hits_final = {};
for query_id in query_hits:
    if len(query_hits[query_id]) == 1:
        query_hits_final[query_id] = query_hits[query_id][0];
        continue;

    if args.score_mode == "len":
        score_ind = 3;
        best_hit = maxScore(query_hits[query_id], score_ind);

    elif args.score_mode == "eval":
        score_ind = 4;
        best_hit = minScore(query_hits[query_id], score_ind);

    elif args.score_mode == "bit":
        score_ind = 5;
        best_hit = maxScore(query_hits[query_id], score_ind);

    query_hits_final[query_id] = best_hit;
core.PWS("# " + core.getDateTime() + " Final hits :      " + str(len(query_hits_final)));
core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Counting hits per rat exon id:");
target_hit_counts = defaultdict(int);
for query_id in query_hits_final:
    #print(query_id, query_hits_final[query_id]);
    #sys.exit();
    target_hit_counts[query_hits_final[query_id][1]] += 1;
# for key in sorted(list(target_hit_counts.keys())):
#     print(key, target_hit_counts[key]);
core.PWS("# ----------------");

core.PWS("# " + core.getDateTime() + " Writing out hits: " + outfilename + " " + multioutfilename);
single_hits, multi_hits = 0, 0;
with open(outfilename, "w") as outfile, open(multioutfilename, "w") as multioutfile:
    for query_id in query_hits_final:
        outline = [query_id] + query_hits_final[query_id];
        outline = [ str(col) for col in outline ];
        if target_hit_counts[query_hits_final[query_id][1]] == 1:
            outfile.write("\t".join(outline) + "\n");
            single_hits += 1;
        else:
            multioutfile.write("\t".join(outline) + "\n");
            multi_hits += 1;
core.PWS("# " + core.getDateTime() + " One-to-one hits :    " + str(single_hits));
core.PWS("# " + core.getDateTime() + " One-to-multi hits :  " + str(multi_hits));
core.PWS("# ----------------");


        