#!/usr/bin/python3
###########################################################
# For rodent exomes, 12.2020
# Extracts and concatenates aligned segments from 
# exonerate .gff output
###########################################################

import sys, os, core, math, argparse, subprocess, multiprocessing as mp

###########################################################

def readSeqInfo(seqfile, tabfile):
    expecteds = {};
    first = True;
    for line in open(tabfile):
        if line[0] == "#":
            continue;
        if first:
            first = False;
            continue;

        line = line.strip().split("\t");
        ftype, tid, start, end, num_cds = line[1], line[6].split(";")[1], int(line[3])-1, int(line[4]), line[7];

        if ftype != "protein_coding exon":
            continue;

        if tid not in expecteds:
            expecteds[tid] = { 'num-cds' : 0, 'tot-len' : 0, 'starts' : [], 'ends' : [] };
        expecteds[tid]['num-cds'] += 1;
        cds_len = end - start;
        expecteds[tid]['tot-len'] += cds_len;
        expecteds[tid]['starts'].append(start);
        expecteds[tid]['ends'].append(end);
    core.PWS("# Protein coding transcripts read: " + str(len(expecteds)), logfile);
    # Read tab file.

    # for tid in expecteds:
    #     start = min(expecteds[tid]['starts']);
    #     end = max(expecteds[tid]['ends']);
    #     tlen = end - start;
    #     expecteds[tid]['len'] = tlen;
    # # Get CDS lengths.

    seqs_orig = core.fastaGetDict(seqfile);
    seqs = {};
    for title in seqs_orig:
        new_title = title.split(" ")[0];
        new_title = new_title[1:new_title.index(".")];
        if new_title not in expecteds:
            continue;
        seqs[new_title] = seqs_orig[title];
    core.PWS("# Coding sequences read: " + str(len(seqs)), logfile);
    # Read sequences;

    for tid in seqs:
        assert abs(expecteds[tid]['tot-len'] - len(seqs[tid])) <= 10, "\nUnexpected sequence length:\n" + tid + "\nExpected: " + str(expecteds[tid]['tot-len']) + "\nObserved: " + str(len(seqs[tid])) + "\n" + str(expecteds[tid]);
    # Check that the lengths match.

    return seqs, expecteds;

################################

def parseGFF(file_list, indir, seqdir, outdir, mseq, mexp, rseq, rexp):
    written, skipped = 0,0;
    tracker = {};
    # Parse function counters and tracker

    for gff_file in file_list:
    # Loop through all files
        if not gff_file.endswith(".gff"):
            skipped += 1;
            continue;
        # Skip any files that aren't GFF

        pid = gff_file[:gff_file.index("-")];
        mtid = mus_pid_to_tid[pid];
        if mtid not in mexp:
            skipped += 1;
            continue;
        rpid = mus_pid_to_rat_pid[pid];
        rtid = rat_pid_to_tid[rpid];
        tracker[pid] = {};
        # Get the protein ID from the file name and add it to the tracker

        gff_path = os.path.join(indir, gff_file);
        # Get the full path of the GFF file

        for line in open(gff_path):
        # Loop through all lines in current file
            if any(line.startswith(skip_str) for skip_str in ["Command line", "Hostname", "#", "--"]):
                continue;
            # Skip lines that start with some key characters

            line = line.strip().split("\t");
            try:
                if line[2] != "cds":
                    continue;
                sample, start, end, strand = line[0], line[3], line[4], line[6];
            except:
                print(" * ", gff_file, "\t", line);
                continue;
            # Parse the line and skip if not CDS

            if sample not in tracker[pid]:
                tracker[pid][sample] = { 'num-cds' : 0, 'starts' : [], 'ends' : [], 'seqs' : [], 'tot-len' : 0 };
            # Add the sample to the tracker for the current protein

            tracker[pid][sample]['starts'].append(start);
            tracker[pid][sample]['ends'].append(end);
            tracker[pid][sample]['num-cds'] += 1;
            tracker[pid][sample]['tot-len'] += (int(end) - int(start));
            # Add the CDS prediction info to the tracker for the current sample

            seqfile = os.path.join(seqdir, pid, sample + ".fa");
            # Use the sequence directory and the protein ID to get the original sequence file name for the current protein and sequence

            cmd = "samtools faidx " + seqfile + " " + sample + ":" + start + "-" + end
            if strand == "-":
                cmd += " -i";     
            cmd_result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE);
            assert cmd_result.stderr.decode() == "", "\nsamtools returned an error with the following command:\n" + cmd + "\n"
            # Retrieve the sequence of the current CDS with samtools

            cmd_out = cmd_result.stdout.decode()
            tracker[pid][sample]['seqs'].append("".join(list(filter(None, cmd_out.split("\n")[1:]))));
            # Parse the sequence from the samtools output and add it to the tracker

        outfilename = os.path.join(outdir, pid + ".fa");
        # Define the output file name for the current protein ID
        with open(outfilename, "w") as outfile:
            outfile.write(">mm10\n" + mseq[mtid] + "\n");
            add_rat = False;
            if rtid in rseq:
                add_rat = True;
                outfile.write(">rnor6\n" + rseq[rtid] + "\n");

            for sample in tracker[pid]:
            # Loop through every sample in the current protein ID

                sample_seq = "";
                # Initialize an empty sequence string

                sorted_indices = [ tracker[pid][sample]['starts'].index(start) for start in sorted(tracker[pid][sample]['starts'] ) ];
                # Sort the sequences for the current sample by sorting the starting coordinates and saving the sorted indices which will be used
                # to look up the sequences in the sorted order

                # print(tracker[pid][sample]);
                # print(sorted_indices);

                for ind in sorted_indices:
                    # print(tracker[pid][sample]['seqs'][ind]);
                    sample_seq += tracker[pid][sample]['seqs'][ind];
                # Loop through the sorted indices and add that sequence to the sequence string

                outfile.write(">" + sample + "\n" + sample_seq + "\n");
                # Write the sequence to the file

                tracker[pid][sample]['seqs'] = "";
                # Overwrite the sequences in the tracker with an empty string to free up memory

            tracker[pid]["mm10"] = {'starts' : [], 'ends' : [], 'seqs' : "", 'num-cds' : str(mexp[mtid]['num-cds']), 'tot-len' : str(mexp[mtid]['tot-len']) };
            if add_rat:
                tracker[pid]["rnor6"] = {'starts' : [], 'ends' : [], 'seqs' : "", 'num-cds' : str(rexp[rtid]['num-cds']), 'tot-len' : str(rexp[rtid]['tot-len']) };
            written += 1;

    return tracker, written, skipped;

###########################################################
# Options

parser = argparse.ArgumentParser(description="Exonerate command generator");
parser.add_argument("-i", dest="input", help="Directory of input gff.", default=False);
parser.add_argument("-o", dest="output", help="Desired output directory for un-aligned, concatenated CDS seqs.", default=False);
parser.add_argument("-s", dest="seqdir", help="Directory containing unaligned contig sequences (pre-exonerate).", default=False);
parser.add_argument("-p", dest="procs", help="Number of processes to use. Default: 1", type=int, default=1);
parser.add_argument("--overwrite", dest="overwrite", help="If the output directory already exists and you wish to overwrite it, set this option.", action="store_true", default=False);
# IO options

args = parser.parse_args();
print(args.input);
if not args.input or not os.path.isdir(args.input):
    sys.exit( " * Error 1: An input directory must be defined with -i.");
args.input = os.path.abspath(args.input);

if not args.output:
    sys.exit( " * Error 2: An output directory must be defined with -o.");

args.output = os.path.abspath(args.output);
if os.path.isdir(args.output) and not args.overwrite:
    sys.exit( " * Error 3: Output directory (-o) already exists! Explicity specify --overwrite to overwrite it.");

if not args.seqdir:
    sys.exit( " * Error 4: An sequence directory must be defined with -s.");    
# IO option error checking

if args.procs < 1:
    sys.exit( " * Error 5: Number of processes (-p) must be a positive integer.");

pad = 26
cwd = os.getcwd();
# Job vars

log_file = os.path.join("logs", os.path.basename(os.path.normpath(args.output)) + "-exonerate-to-cds-2.log");
# Job files

##########################
# Reporting run-time info for records.

with open(log_file, "w") as logfile:
    core.runTime("#!/bin/bash\n# Exonerate sequence extractor", logfile);
    core.PWS("# IO OPTIONS", logfile);
    core.PWS(core.spacedOut("# Input directory:", pad) + args.input, logfile);
    core.PWS(core.spacedOut("# Output directory:", pad) + args.output, logfile);
    if args.overwrite:
        core.PWS(core.spacedOut("# --overwrite set:", pad) + "Overwriting previous files in output directory.", logfile);
    if not os.path.isdir(args.output):
        core.PWS("# Creating output directory.", logfile);
        os.system("mkdir " + args.output);
    core.PWS(core.spacedOut("# Sequence directory:", pad) + args.seqdir, logfile);
    core.PWS(core.spacedOut("# Procs:", pad) + str(args.procs), logfile);
    core.PWS(core.spacedOut("# Logfile:", pad) + log_file, logfile);
    core.PWS("# ----------------", logfile);
    # Log info

    annotation_file = "../02-Annotation-data/Mus_best_cds_metadata.csv";
    transcripts_file = "../02-Annotation-data/selected-transcripts.txt";
    mus_transcripts = "../02-Annotation-data/mm10-cds.tab";
    mus_seq_file = "../Reference-genomes/mm10/Mus_musculus.GRCm38.cds.all.fa";
    rat_transcripts = "../02-Annotation-data/rnor6-cds.tab";
    rat_seq_file = "../Reference-genomes/Rnor6/Rattus_norvegicus.Rnor_6.0.cds.all.fa";
    rat_id_file = "../Reference-genomes/Rnor6/rnor6-ens99-ids.tab";
    # Various annotation files...

    core.PWS("# Reading main annotation file: " + annotation_file, logfile);
    mus_pid_to_tid = {};
    first = True;
    for line in open(annotation_file):
        if first:
            first = False;
            continue;
        line = line.replace("\"", "").strip().split(",");
        mus_pid_to_tid[line[13]] = line[9];
    core.PWS("# Protein IDs read: " + str(len(mus_pid_to_tid)), logfile);
    core.PWS("# ----------------", logfile);

    core.PWS("# Reading mouse seqs: " + mus_seq_file + " " + mus_transcripts, logfile);
    mus_seqs, mus_expected = readSeqInfo(mus_seq_file, mus_transcripts);
    core.PWS("# ----------------", logfile);

    core.PWS("# Reading rat seqs: " + rat_seq_file + " " + rat_transcripts, logfile);
    rat_seqs, rat_expected = readSeqInfo(rat_seq_file, rat_transcripts);
    core.PWS("# ----------------", logfile);
    
    core.PWS("# Reading selected transcripts: " + transcripts_file, logfile);
    mus_pid_to_rat_pid = {};
    first = True;
    for line in open(transcripts_file):
        if line[0] == "#":
            continue;
        if first:
            first = False;
            continue;

        line = line.strip().split("\t");
        mus_pid, rat_pid = line[2], line[6];
        mus_pid_to_rat_pid[mus_pid] = rat_pid;
    core.PWS("# IDs read: " + str(len(mus_pid_to_rat_pid)), logfile);
    core.PWS("# ----------------", logfile);

    core.PWS("# Reading rat IDs: " + rat_id_file, logfile);
    rat_pid_to_tid = {};
    for line in open(rat_id_file):
        line = line.strip().split("\t");
        if len(line) != 3:
            continue;
        rat_pid_to_tid[line[2]] = line[1];
    core.PWS("# Rat IDs read: " + str(len(rat_pid_to_tid)), logfile);
    core.PWS("# ----------------", logfile);

    written_main, skipped_main = 0,0;
    tracker_main = {};
    # The main count and tracker variables

    files = os.listdir(args.input)
    files_per_proc = int(math.ceil(len(files) / args.procs));
    file_lists = list(core.chunks(files, files_per_proc));
    # Splitting the input files into even chunks for parallelization

    pool = mp.Pool(processes=args.procs);
    # Starting the pool of processes

    for result in pool.starmap(parseGFF, ( (fl, args.input, args.seqdir, args.output, mus_seqs, mus_expected, rat_seqs, rat_expected) for fl in file_lists )):
        tracker_main.update(result[0]);
        written_main += result[1];
        skipped_main += result[2];
    # Pass each chunk of files to the parse function and collect variables
    core.PWS(core.spacedOut("# Files written:", pad) + str(written_main), logfile);
    core.PWS(core.spacedOut("# Files skipped:", pad) + str(skipped_main), logfile);
    core.PWS("# ----------------", logfile);

    for pid in tracker_main:
        for sample in tracker_main[pid]:
            outline = pid + "\t" + sample + "\t" + str(tracker_main[pid][sample]['num-cds']) + "\t" + str(tracker_main[pid][sample]['tot-len']);
            core.PWS(outline, logfile);
    # Write the number of CDS for each sample

        