#!/usr/bin/python3
############################################################
# For rat exomes, 10.2020
# Separates a single FASTA file with all targets into 
# FASTA files for each target.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, core, mseq, mfiles, globs
from collections import defaultdict

############################################################

def parseHeaderIds(seqdict, seq_mode, selected_ts):
# This function re-parses some of the FASTA header IDs
    new_seqdict = {};
    for title in seqdict:
        if seq_mode == "exon":
            new_title = title.split("|")[2];
            new_seqdict[new_title] = seqdict[title];
        # In exon mode, we want the exon ID to be the header.
        elif seq_mode == "utr":
            ts_id = title.split("|")[1];
            if ts_id not in selected_ts:
                continue;
            # If the transcript isn't one of the selected ones, skip.

            new_title = title.split("|")[2].split(";");
            for t in new_title:
                new_seqdict[t] = seqdict[title];
        # In UTR mode we want each exon for each transcript to be a separate entry in the dictionary.
    return new_seqdict;

##############################

def readSeqs(spec, tid_list, utr=False):
    if spec == "mouse":
        exons_file = "../Reference-genomes/mm10/Mus_musculus.GRCm38.exon.all.500flank.fa";
        utr5_file = "../Reference-genomes/mm10/Mus_musculus.GRCm38.5utr.fa";
        utr3_file = "../Reference-genomes/mm10/Mus_musculus.GRCm38.3utr.fa";
    elif spec == "rat":
        exons_file = "../Reference-genomes/Rnor6/Rattus_norvegicus.Rnor_6.0.exon.all.500flank.fa";
        utr5_file = "../Reference-genomes/Rnor6/Rattus_norvegicus.Rnor_6.0.5utr.fa";
        utr3_file = "../Reference-genomes/Rnor6/Rattus_norvegicus.Rnor_6.0.3utr.fa";
    # Sequences downloaded from Ensembl Biomart 99

    mcore.PWS("# " + mcore.getDateTime() + " Reading " + spec + " exon sequences: " + exons_file);
    exons = mseq.fastaGetDict(exons_file);
    # Read the sequences
    exons = parseHeaderIds(exons, "exon", tid_list);
    # Parse the header IDs so they only contain the exon ID.
    mcore.PWS("# Total sequences read: " + str(len(exons)));               
    mcore.PWS("# ----------------");
    # This block reads the exon sequences + 500bp of flanking sequence

    utr5, utr3 = "", "";
    if utr:
        mcore.PWS("# " + mcore.getDateTime() + " Reading " + spec + " UTR sequences: " + utr5_file + " " + utr3_file);
        utr5 = mseq.fastaGetDict(utr5_file);
        utr5 = parseHeaderIds(utr5, "utr", tid_list);
        utr3 = mseq.fastaGetDict(utr3_file);
        utr3 = parseHeaderIds(utr3, "utr", tid_list);
        # Read the sequences and parse the header IDs so each exon coincides with the UTR for the transcript
        mcore.PWS("# Total 5' UTRs read: " + str(len(utr5)));  
        mcore.PWS("# Total 3' UTRs read: " + str(len(utr3)));               
        mcore.PWS("# ----------------");
    # This block reads the UTR sequences

    return exons, utr5, utr3;

############################################################

datasets = ["australian-full-all", "australian-full-coding", "australian-reduced-all", "australian-reduced-coding", "reproductive-all", "reproductive-coding",
            "reproductive-mclennan-all", "reproductive-mclennan-coding", "reproductive-pahl-all", "reproductive-pahl-coding", "reproductive-testes-mass-all", "reproductive-testes-mass-coding", 
            "reproductive-sperm-img-all", "reproductive-sperm-img-coding", "reproductive-sperm-morpho-all", "reproductive-sperm-morpho-coding", "full-all", "full-coding"]

dataset = "reproductive-testes-mass-coding";
if dataset not in datasets:
    sys.exit(" * ERROR: check dataset.");

mcore.PWS("# " + mcore.getDateTime() + " Separating sequences for dataset: " + dataset);

####


exclude_samples = [];
add_rat = False;
add_mouse = False;
rm_samples = False;
rmdir = "../03-Alignments/samples-to-rm/";
# Job variables

####

orthfile = "../02-Annotation-data/mm10-rnor6-master-transcript-id-table.tab";
# The ortholog file between mouse and rat.
core.PWS("# " + core.getDateTime() + " Reading selected transcript IDs: " + orthfile);
orth_tids = {};
for line in open(orthfile):
    line = line.strip().split("\t");

    orth_tids[line[1]] = line[4];
    # Add the related gene ids to the orths dict.
mouse_tids = set(list(orth_tids.keys()));
rat_tids = set(list(orth_tids.values()));
core.PWS("# " + core.getDateTime() + " Transcripts read: " + str(len(orth_tids)));
core.PWS("# ----------------");
# Read the list of selected transcripts from the master table, with mouse and rat IDs

####

blastfile = "../03-Alignments/blast/mm10-exon-to-rnor6/exon-to-exon-hits-bit.txt";
core.PWS("# " + core.getDateTime() + " Reading exon-to-exon BLAST hits IDs: " + blastfile);
orth_eids = {};
for line in open(blastfile):
    line = line.strip().split("\t");
    orth_eids[line[0]] = line[2];
core.PWS("# " + core.getDateTime() + " Orthologs read: " + str(len(orth_eids)));
core.PWS("# ----------------");
# Read the exon orthologs from the parsed BLAST output.

###

mousefile = "../Reference-genomes/mm10/mm10-ens99-ids.tab";
core.PWS("# " + core.getDateTime() + " Reading mouse IDs: " + mousefile);
meid_to_mtid = {};
mtid_to_meid = {};
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

    mtid = line[1];
    meid = line[3];

    if mtid not in mouse_tids:
        continue;
    # Skipt transcripts not in our selected set.

    meid_to_mtid[meid] = mtid;
    mtid_to_meid[mtid] = meid;
core.PWS("# IDs read: " + str(len(mouse_tids)));               
core.PWS("# ----------------");
# Get the mouse IDs to convert between exon and transcript.

####

ratfile = "../Reference-genomes/Rnor6/rnor6-ens99-ids.tab";
core.PWS("# " + core.getDateTime() + " Reading rat IDs: " + ratfile);
reid_to_rtid = {};
rtid_to_reid = {}
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

    rtid = line[1];
    reid = line[3];
    if rtid not in rat_tids:
        continue;

    reid_to_rtid[reid] = rtid;
    rtid_to_reid[rtid] = reid;
core.PWS("# IDs read: " + str(len(rat_tids)));    
core.PWS("# ----------------");
# Get the rat IDs to convert between exon and transcript.

####

mcore.PWS("# " + mcore.getDateTime() + " Retrieving sequences from dataset: " + dataset);
infilename = False;

if dataset == "australian-full-all":
    infilename = "../03-Alignments/raw/australian-full_unaligned-contigs.fa";
# Australian dataset, iupac, coding

##

if dataset == "australian-full-coding":
    infilename = "../03-Alignments/raw/coding_australian-full_unaligned-contigs.fa";
# Australian dataset, iupac, noncoding

##

if dataset == "australian-reduced-all":
    infilename = "../03-Alignments/raw/australian-reduced_unaligned-contigs.fa";
# Australian dataset, reduced, iupac, coding

##

if dataset == "australian-reduced-coding":
    infilename = "../03-Alignments/raw/coding_australian-reduced_unaligned-contigs.fa";
# Australian dataset, reduced, iupac, noncoding

##

if dataset == "reproductive-all":
    add_mouse = True;
    add_rat = True;
    infilename = "../03-Alignments/raw/emily-dataset_unaligned-contigs.fa";
# Emily's dataset, coding

##

if dataset == "reproductive-coding":
    add_rat = True;
    infilename = "../03-Alignments/raw/coding_emily-dataset_unaligned-contigs.fa";
# Emily's dataset, noncoding

##

if dataset == "reproductive-mclennan-all":
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_McLennanEtAl_set_30April2021.csv");
    infilename = "../03-Alignments/raw/emily-dataset_unaligned-contigs.fa";
# Emily's dataset, coding

##

if dataset == "reproductive-mclennan-coding":
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_McLennanEtAl_set_30April2021.csv");
    infilename = "../03-Alignments/raw/coding_emily-dataset_unaligned-contigs.fa";
# Emily's dataset, noncoding

##

if dataset == "reproductive-pahl-all":
    rm_file = os.path.join(rmdir, "REMOVE_PahlEtAl_set_30April2021.csv");
    rm_samples = True;
    infilename = "../03-Alignments/raw/emily-dataset_unaligned-contigs.fa";
# Emily's dataset, coding

##

if dataset == "reproductive-pahl-coding":
    rm_file = os.path.join(rmdir, "REMOVE_PahlEtAl_set_30April2021.csv");
    rm_samples = True;
    infilename = "../03-Alignments/raw/coding_emily-dataset_unaligned-contigs.fa";
# Emily's dataset, noncoding

##

if dataset == "reproductive-testes-mass-all":
    add_mouse = True;
    add_rat = True;
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_relative_testes_mass_set_30April2021.csv");
    infilename = "../03-Alignments/raw/emily-dataset_unaligned-contigs.fa";
# Emily's dataset, coding

##

if dataset == "reproductive-testes-mass-coding":
    add_rat = True;
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_relative_testes_mass_set_30April2021.csv");
    infilename = "../03-Alignments/raw/coding_emily-dataset_unaligned-contigs.fa";
# Emily's dataset, noncoding

##

if dataset == "reproductive-sperm-img-all":
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_sperm_image_set_30April2021.csv");
    infilename = "../03-Alignments/raw/emily-dataset_unaligned-contigs.fa";
# Emily's dataset, coding

##

if dataset == "reproductive-sperm-img-coding":
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_sperm_image_set_30April2021.csv");
    infilename = "../03-Alignments/raw/coding_emily-dataset_unaligned-contigs.fa";
# Emily's dataset, noncoding

##

if dataset == "reproductive-sperm-morpho-all":
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_sperm_morpho_set_30April2021.csv");
    infilename = "../03-Alignments/raw/emily-dataset_unaligned-contigs.fa";
# Emily's dataset, coding

##

if dataset == "reproductive-sperm-morpho-coding":
    rm_samples = True;
    rm_file = os.path.join(rmdir, "REMOVE_sperm_morpho_set_30April2021.csv");
    infilename = "../03-Alignments/raw/coding_emily-dataset_unaligned-contigs.fa";
# Emily's dataset, noncoding

##

if dataset == "full-all":
    add_mouse = True;
    add_rat = True;
    rm_samples = True;
    rm_file = os.path.join(rmdir, "full-dataset-rm-samples.csv");
    # A CSV file with samples to exclude in the first column.

    infilename = "../03-Alignments/raw/full-dataset_unaligned-contigs.fa";
# Full dataset, coding

##

if dataset == "full-coding":
    add_rat = True;
    rm_samples = True;
    rm_file = os.path.join(rmdir, "full-dataset-rm-samples.csv");
    # A CSV file with samples to exclude in the first column.

    infilename = "../03-Alignments/raw/coding_full-dataset_unaligned-contigs.fa";
# Full dataset, noncoding

if not infilename:
    sys.exit(" * ERROR: No infilename.");

####

if add_mouse:
    mouse_exons, mouse_5utr, mouse_3utr = readSeqs("mouse", mouse_tids, utr=True);
# Read the mouse reference seqs
if add_rat:
    rat_exons, rat_5utr, rat_3utr = readSeqs("rat", rat_tids, utr=True);
# Read the rat reference seqs
if rm_samples:
    exclude_samples = { line.split(",")[0].replace("-", "_") : 0 for line in open(rm_file) if not line.startswith("#") };
    #del(exclude_samples['Species']);
# Read the samples to exclude   

####

mcore.PWS("# " + mcore.getDateTime() + " Input file       : " + infilename);
if not os.path.isfile(infilename):
    sys.exit("ERROR: Cannot find input file.");
outdir = "../03-Alignments/seq/" + dataset;
# Set the output directory
mcore.PWS("# " + mcore.getDateTime() + " Output directory : " + outdir);
if not os.path.isdir(outdir):
    print("+ Creating output directory.")
    os.system("mkdir " + outdir);
if exclude_samples != []:
    mcore.PWS("# " + mcore.getDateTime() + " Excluding samples: " + ",".join(exclude_samples));
# I/O info, including creation of output directory.
####

mcore.PWS("# " + mcore.getDateTime() + " Reading sequences...");
all_seqs = mseq.fastaGetDict(infilename);
mcore.PWS("# Total sequences read: " + str(len(all_seqs)));               
mcore.PWS("# ----------------");
# Read the input sequence file

####

mcore.PWS("# " + mcore.getDateTime() + " Separating sequences...");
seqs_by_target = defaultdict(dict);
for title in all_seqs:
    target, spec = title[1:].split("_|_");
    seqs_by_target[target][spec] = all_seqs[title];
mcore.PWS("# Total targets found:  " + str(len(seqs_by_target)));               
mcore.PWS("# ----------------");
# Separate sequences by target

####

mcore.PWS("# " + mcore.getDateTime() + " Writing sequences...");
no_samples, files_written, seqs_written, rat_written = 0, 0, 0, 0;
for target in seqs_by_target:
    target_seqs = {};

    if "Selenocysteine" in target:
        continue;
    # Skip Selenocysteine entries

    exon_id = target.split("_")[2].split("-")[1];
    # Grab the exon ID from the target ID

    ref_write_mode = "exon";
    if exon_id in ["five", "three"]:
        ref_write_mode = exon_id;
        ts_id = target.split("_")[1].split("-")[1];
        exon_id = mtid_to_meid[ts_id];     
    # If the target is  UTR, grab the transcript ID and look up the exon ID with that sequence.

    if len(seqs_by_target[target]) < 3:
        no_samples += 1;
        continue;
    # Skip targets with fewer than 3 samples in them

    outfilename = os.path.join(outdir, target + ".fa");
    with open(outfilename, "w") as outfile:
        for spec in seqs_by_target[target]:
            spec_skip = False;
            for exclude in exclude_samples:
                if exclude in spec:
                    spec_skip = True;
            # Skip the sequence if it is in the excluded samples

            if not spec_skip:
                #target_seqs[">" + spec] = seqs_by_target[target][spec];

                outfile.write(">" + spec + "\n");
                outfile.write(seqs_by_target[target][spec] + "\n");
                seqs_written += 1;
            # Write the sequence if it is to be included

        ##

        if add_mouse:
            outfile.write(">mm10" + "\n");
            if ref_write_mode == "five":
                #print("YAHAHA")
                #target_seqs[">mm10"] = mouse_5utr[exon_id];
                outfile.write(mouse_5utr[exon_id] + "\n");
            elif ref_write_mode == "three":
                #target_seqs[">mm10"] = mouse_3utr[exon_id];
                outfile.write(mouse_3utr[exon_id] + "\n");
            else:
                #target_seqs[">mm10"] = mouse_exons[exon_id];
                outfile.write(mouse_exons[exon_id] + "\n");
            seqs_written += 1;
        # If mouse is to be added, lookup the proper sequence to add

        ##

        if add_rat and exon_id in orth_eids:
            rat_exon_id = orth_eids[exon_id];

            if ref_write_mode == "five":
                #target_seqs[">rnor6"] = rat_5utr[rat_exon_id];
                outfile.write(">rnor6" + "\n");
                outfile.write(rat_5utr[rat_exon_id] + "\n");
                seqs_written += 1;          
            elif ref_write_mode == "three":
                #target_seqs[">rnor6"] = rat_3utr[rat_exon_id];
                outfile.write(">rnor6" + "\n");
                outfile.write(rat_3utr[rat_exon_id] + "\n");
                seqs_written += 1;  
            else:
                if rat_exon_id != "NA":
                    #target_seqs[">rnor6"] = rat_exons[rat_exon_id];
                    outfile.write(">rnor6" + "\n");
                    outfile.write(rat_exons[rat_exon_id] + "\n");
                    seqs_written += 1;
            rat_written += 1;
        # If rat is to be added, look up the proper sequence to add
    files_written += 1;
    # outfilename = os.path.join(outdir, target + ".fa");
    # with open(outfilename, "w") as outfile:
    #     for title in target_seqs:
    #         outfile.write(title + "\n");
    #         outfile.write(target_seqs[title] + "\n");
    #         seqs_written += 1;
    #     files_written += 1;
    # Write the sequences from the current target to a file

#### 

mcore.PWS("# Targets with less than 3 samples: " + str(no_samples));
mcore.PWS("# Sequences written:                " + str(seqs_written));
mcore.PWS("# Rat equences written:             " + str(rat_written));
mcore.PWS("# Files written:                    " + str(files_written));               
mcore.PWS("# ----------------");
# Report some counts