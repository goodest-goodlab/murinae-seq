#!/usr/bin/python3
############################################################
# For rodent exomes, 04.2020
# Finds the 'best' transcript for each gene based on
# presence in mouse and rat
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, core, gzip, re
from collections import defaultdict

############################################################

infile = "../02-Annotation-data/mouse-rat-orths-ens99.txt";
gtffile_mouse = "../Reference-genomes/mm10/Mus_musculus.GRCm38.99.gtf.gz";
gtffile_rat = "../Reference-genomes/Rnor6/Rattus_norvegicus.Rnor_6.0.99.gtf.gz";
outfilename = "../02-Annotation-data/selected-transcripts.txt"

ds_thresh = 0.5

with open(outfilename, "w") as outfile:
    mcore.runTime("# Rodent exomes -- select mouse trancsripts", outfile);
    mcore.PWS("# Mouse GTF file:        " + gtffile_mouse, outfile);
    mcore.PWS("# Rat GTF file:          " + gtffile_rat, outfile);
    mcore.PWS("# Ensembl ortholog file: " + infile, outfile);
    mcore.PWS("# Output file:           " + outfilename, outfile);
    mcore.PWS("# --------------", outfile);
    mcore.PWS("# dS threshold:          " + str(ds_thresh), outfile);

    mcore.PWS("# --------------", outfile);
    mcore.PWS("# " + mcore.getDateTime() + " Reading mouse feature lengths...", outfile);
    mouse_transcript_lengths = {};
    exons = {};
    for line in gzip.open(gtffile_mouse):
        line = line.decode();
        if line[0] == "#":
            continue;
        line = line.strip().split("\t");
        feature_type, chrome, start, end, feature_info = line[2], line[0], int(line[3]), int(line[4]), line[8];
        if feature_type == "transcript":
            transcript_len = end - start;
            tid = re.findall('ENSMUST[\d]+', feature_info)[0];
            mouse_transcript_lengths[tid] = { 'chrome' : chrome,  'start' : start, 'end' : end, 'len' : transcript_len };
    

    mcore.PWS("# " + mcore.getDateTime() + " Reading rat feature lengths...");
    rat_transcript_lengths = {};
    rat_pid_to_tid = {};
    for line in gzip.open(gtffile_rat):
        line = line.decode();
        if line[0] == "#":
            continue;
        line = line.strip().split("\t");
        feature_type, chrome, start, end, feature_info = line[2], line[0], int(line[3]), int(line[4]), line[8];
        if feature_type == "transcript":
            transcript_len = end - start;
            tid = re.findall('ENSRNOT[\d]+', feature_info)[0];
            rat_transcript_lengths[tid] = { 'chrome' : chrome, 'start' : start, 'end' : end, 'len' : transcript_len };

        if feature_type == "CDS":
            tid = re.findall('ENSRNOT[\d]+', feature_info)[0];
            pid = re.findall('ENSRNOP[\d]+', feature_info)[0];
            rat_pid_to_tid[pid] = tid;
            
    mcore.PWS("Mouse transcripts read: " + str(len(mouse_transcript_lengths)), outfile);
    mcore.PWS("Rat transcripts read:   " + str(len(rat_transcript_lengths)), outfile);
    mcore.PWS("# --------------", outfile);
    
    mcore.PWS("# " + mcore.getDateTime() + " Reading orthologs...", outfile);
    genes = defaultdict(list);
    first = True;
    transcript_count = 0;
    for line in open(infile):
        if first == True:
            orig_headers = line;
            first = False;
            continue;
        if "ENSMUST" in line:
            transcript_count += 1;
        line = line.strip().split("\t");
        gid = line[0];
        genes[gid].append(line[1:]);
    mcore.PWS("# Genes read:      " + str(len(genes)), outfile);
    mcore.PWS("# Transcipts read: " + str(transcript_count), outfile);
    mcore.PWS("# --------------", outfile);

    mcore.PWS("# " + mcore.getDateTime() + " Filtering transcripts...", outfile);
    selected_transcripts = {};

    no_orth = 0;
    no_one2one = 0;
    low_conf = 0;
    ds_filter = 0;
    len_filter = 0;
    no_passed_transcripts = 0;

    for gid in genes:
        passed_transcripts = [];
        for transcript in genes[gid]:
            if len(transcript) < 14:
                no_orth += 1;
                continue;

            if transcript[6] != "ortholog_one2one":
                no_one2one += 1;
                continue;

            if transcript[13] != "1":
                low_conf += 1;
                continue;

            if transcript[12] == '' or float(transcript[12]) > ds_thresh:
                ds_filter += 1;
                continue;

            passed_transcripts.append(transcript);

        if len(passed_transcripts) > 1:
            max_len = 0;
            max_transcript = "";
            for transcript in passed_transcripts:
                mouse_tid = transcript[0];
                mouse_len = mouse_transcript_lengths[mouse_tid]['len'];

                rat_tid = transcript[5];
                if "ENSRNOP" in rat_tid:
                    rat_tid = rat_pid_to_tid[rat_tid];
                rat_len = rat_transcript_lengths[rat_tid]['len'];

                avg_len = (rat_len + mouse_len) / 2;
                if avg_len > max_len:
                    max_len = avg_len;
                    max_transcript = transcript;
                else:
                    len_filter += 1;
            selected_transcripts[gid] = max_transcript;

        elif len(passed_transcripts) == 1:
            max_transcript = passed_transcripts[0];
            selected_transcripts[gid] = max_transcript;

        else:
            no_passed_transcripts += 1;
      

    mcore.PWS("# Transcripts with no rat ortholog:                                                      " + str(no_orth), outfile);
    mcore.PWS("# Transcripts with no one2one rat ortholog:                                              " + str(no_one2one), outfile);
    mcore.PWS("# Transcripts with no high confidence rat ortholog:                                      " + str(low_conf), outfile);
    mcore.PWS("# Transcripts with no rat ortholog below dS threshold:                                   " + str(ds_filter), outfile);
    mcore.PWS("# Transcripts filtered for not being, on average between rat and mouse, longest in gene: " + str(len_filter), outfile);
    mcore.PWS("# Note: numbers reported are conditional on those transcripts passing the previous filter. Filters reported in order of their coding.");
    mcore.PWS("# --------------", outfile);
    mcore.PWS("# Genes with no passed transcripts:                                                      " + str(no_passed_transcripts), outfile);
    mcore.PWS("# Genes with selected transcript:                                                        " + str(len(selected_transcripts)), outfile);
    mcore.PWS("# --------------", outfile);
    mcore.PWS("# " + mcore.getDateTime() + " Writing selected transcripts to output file...", outfile);
    orig_headers = orig_headers + "\t" + "\t".join(["Mouse chrome", "Mouse start", "Mouse end", "Mouse length", "Rat chrome", "Rat start", "Rat end", "Rat length"]);
    outfile.write(orig_headers + "\n");
    for gid in selected_transcripts:
        mouse_tid = selected_transcripts[gid][0];
        mouse_gtf = mouse_transcript_lengths[mouse_tid]
        rat_tid = selected_transcripts[gid][5];
        if "ENSRNOP" in rat_tid:
            rat_tid = rat_pid_to_tid[rat_tid];
        rat_gtf = rat_transcript_lengths[rat_tid]

        outline = gid + "\t" + "\t".join(selected_transcripts[gid]) + "\t";
        outline += "\t".join([ mouse_gtf['chrome'], str(mouse_gtf['start']), str(mouse_gtf['end']), str(mouse_gtf['len']) ]) + "\t";
        outline += "\t".join([ rat_gtf['chrome'], str(rat_gtf['start']), str(rat_gtf['end']), str(rat_gtf['len']) ]);

        outfile.write(outline + "\n");


