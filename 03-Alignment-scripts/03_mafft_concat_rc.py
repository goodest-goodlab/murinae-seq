#!/usr/bin/python
############################################################
# For exomes, 11.2020
# Parses the aligned MAFFT targets: Makes sure they are all
# the same strand, concatenates targets.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, random, mcore, mseq, mfiles, globs
from collections import defaultdict

############################################################

targets_file = "../02-Annotation-data/Mus_best_cds_metadata.csv";
mouse_exon_dir = "../Targets/mm10-exon-target-seqs/";
mafft_dir = "../03-Alignments/mafft/aln/01_full-mafft/";
outdir = "../03-Alignments/exonerate/seq/full/";
tmpdir = "tmp/";
# Input and output info.

mcore.PWS("# " + mcore.getDateTime() + " Reading IDs: " + targets_file);
targets, targ_to_pid, pid_to_targ = {}, {}, defaultdict(list);
first = True;
for line in open(targets_file):
    if first:
        first = False;
        continue;
    
    line = line.strip().split(",");
    targ, tid, pid, eid = line[1].replace("\"", ""), line[9].replace("\"", ""), line[13].replace("\"", ""), line[17].replace("\"", "");

    targets[targ] = { 'tid' : tid, 'pid' : pid, 'eid' : eid, 'mstrand' : "NA", "seqs" : {} };
mcore.PWS("# Total targets: " + str(len(targets)));
mcore.PWS("# ----------------");
# Read the list of mouse target IDs.

first = True;
i = 0;
last_pid = "";
num_missing = 0;
for target in targets:
    cur_pid = targets[target]['pid'];
    # Targets will be named for the mouse protein ID for alignment with exonerate protein2genome

    if first:
        concat_seqs = defaultdict(str);
        last_pid = cur_pid;
        first = False;
    # Initialize some variables for the first sequence.

    if cur_pid != last_pid:
        i += 1;
        pid_outdir = os.path.join(outdir, last_pid)
        if not os.path.isdir(pid_outdir):
            os.system("mkdir " + pid_outdir);
        # Create the output directory.

        for spec in concat_seqs:
            spec_out = os.path.join(pid_outdir, spec.replace(">", "") + ".fa");
            with open(spec_out, "w") as outfile:
                outfile.write(spec + "\n");
                outfile.write(concat_seqs[spec]);
        # Write each sequence.

        concat_seqs = defaultdict(str);
    # When moving on to the next protein target, write the sequences from the current target and re-initialize the seq dict

    mafft_file = os.path.join(mafft_dir, target + "-mafft.fa");
    if not os.path.isfile(mafft_file):
        num_missing += 1;
        continue;
    #print(mafft_file);
    cur_seqs = mseq.fastaGetDict(mafft_file);
    for title in cur_seqs:
        cur_seqs[title] = cur_seqs[title].replace("-", "");
        # Replace gaps with empty strings to un-align the sequence.
    # Retrieve each sequence from the current alignment file.

    for title in cur_seqs:
        concat_seqs[title.replace("_R_", "")] += cur_seqs[title];
    # Add each sequence into the dictionary.

    last_pid = cur_pid;
    # Update the protein id.

print("# Num missing:", num_missing);
#######################

    # complement = { 'A': 'T', 'C': 'G', 'G': 'C', 'T': 'A', 'Y' : 'R', 'R' : 'Y', 'S' : 'S', 'W' : 'W', 'K' : 'M', 'M' : 'K', 'B' : 'V', 'V' : 'B', 'D' : 'H', 'H' : 'D', 'N' : 'N' };
    # exon_file = os.path.join(mouse_exon_dir, targets[target]['eid'] + ".fa");
    # mm10_seq = mseq.fastaGetDict(exon_file);
    # mm10_title = list(mm10_seq.keys())[0]; 
    # 
    # # random_title = random.choice(list(cur_seqs.keys()));
    # cur_str = mcore.getRandStr(10);
    # random_file = os.path.join(tmpdir, cur_str + ".tmp.fa");
    # with open(random_file, "w") as rfile:
    #     rfile.write(random_title + "\n");
    #     rfile.write(cur_seqs[random_title] + "\n");
    #     rfile.write(mm10_title + "\n");
    #     rfile.write(mm10_seq[mm10_title]);
    # random_outfile = os.path.join(tmpdir, cur_str + "-mafft.tmp.fa"); 

    # mafft_cmd = "mafft --adjustdirection --preservecase " + random_file + " 2> /dev/null 1> " + random_outfile;
    # print(mafft_cmd);
    # os.system(mafft_cmd);

    # aln_seqs = mseq.fastaGetDict(random_outfile);
    # cur_strand = "+";
    # num_rc = 0;
    # for title in aln_seqs:
    #     if "_R_" in title:
    #         num_rc += 1;

    # if num_rc == 1:
    #     cur_strand = "-";

    #assert num_rc <=1, "\nBoth sequences RC:\n" + target + "\n" + random_outfile;

    # targets[target]['mstrand'] = cur_strand;
    # print(targets[target]['mstrand'])

    # if targets[target]['mstrand'] == "-":
    #     for title in cur_seqs:
    #         cur_seqs[title] = "".join(complement.get(base, base) for base in reversed(cur_seqs[title]));
    ## THIS chunk did a prelim alignment with mafft to correct for mouse strand, but isn't needed because
    ## exonerate considers stand.