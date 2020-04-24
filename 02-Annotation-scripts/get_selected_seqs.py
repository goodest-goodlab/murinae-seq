#!/usr/bin/python3
############################################################
# For rodent exomes, 04.2020
# Retrieves the exons from each selected transcript and
# concatenates them together as CDS's.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, mcore, mseq, gzip, re
from collections import defaultdict

############################################################

ref = "../Reference-genomes/mm10/mm10.fa";
gtffile_mouse = "../Reference-genomes/mm10/Mus_musculus.GRCm38.99.gtf.gz";
transcript_file = "../02-Annotation-data/selected-transcripts.txt";
outdir = "../02-Annotation-data/transcript-seq/";
#outdir = "../02-Annotation-data/ts2/";
logfilename = "get_selected_seqs.log";
# Hardcoded file names

with open(logfilename, "w") as logfile:
    mcore.runTime("# Rodent exomes -- get mouse CDS", logfile);
    mcore.PWS("# Mouse reference FASTA: " + ref, logfile);
    mcore.PWS("# Mouse GTF file:        " + gtffile_mouse, logfile);
    mcore.PWS("# Transcripts file:      " + transcript_file, logfile);
    mcore.PWS("# Sequence output dir:   " + outdir, logfile);
    mcore.PWS("# Log file:              " + logfilename, logfile);
    mcore.PWS("# ----------------", logfile);

    mcore.PWS("# " + mcore.getDateTime() + " Reading mouse transcripts...", logfile);
    mouse_transcripts = {};
    transcript_len_sum, first = 0, True;
    for line in open(transcript_file):
        if line[0] == "#" or first:
            first = False;
            continue;
        line = line.strip().split("\t");
        tid, chrome, start, end, length = line[1], line[15], line[16], line[17], line[18];
        transcript_len_sum += int(length);
        chrome = "chr" + chrome;

        mouse_transcripts[tid] = { 'chrome' : chrome, 'start' : start, 'end' : end, 'len' : length, 'exons' : {}, 'cds' : [], 'start-codon' : "", 'stop-codon' : "", 'strand' : "" };
        #mouse_transcripts[tid] = 0;
    num_transcripts = len(mouse_transcripts);
    mcore.PWS("# Transcripts read:        " + str(num_transcripts), logfile);
    mcore.PWS("# Avg. transcript length:  " + str(transcript_len_sum / num_transcripts), logfile);
    mcore.PWS("# ----------------", logfile);

    mcore.PWS("# " + mcore.getDateTime() + " Reading mouse CDS and exons...", logfile);
    num_exons, exon_len_sum = 0, 0;
    num_cds, cds_len_sum = 0, 0,;
    for line in gzip.open(gtffile_mouse):
        line = line.decode();
        if line[0] == "#":
            continue;
        line = line.strip().split("\t");
        feature_type, chrome, start, end, strand, feature_info = line[2], line[0], int(line[3]), int(line[4]), line[6], line[8];
        chrome = "chr" + chrome;
        # if feature_type == "CDS":
        #     tid = re.findall('ENSMUST[\d]+', feature_info)[0];
        #     if tid in mouse_transcripts:
        #         mouse_transcripts[tid] += 1;

        if feature_type == "transcript":
            tid = re.findall('ENSMUST[\d]+', feature_info)[0];
            if tid in mouse_transcripts:
                mouse_transcripts[tid]['strand'] = strand;

        if feature_type == "exon":
            tid = re.findall('ENSMUST[\d]+', feature_info)[0];
            if tid in mouse_transcripts:
                num_exons += 1;
                eid = re.findall('ENSMUSE[\d]+', feature_info)[0];
                feature_info = feature_info.split("; ");
                exon_num = [ i[i.index(" ")+1:].replace("\"", "") for i in feature_info if "exon_number" in i ][0];
                exon_len = end - start;
                exon_len_sum += exon_len;
                mouse_transcripts[tid]['exons'][eid] = { 'chrome' : chrome,  'start' : start, 'end' : end, 'len' : exon_len, 'num' : exon_num, 'strand' : strand };

        if feature_type == "CDS":
            tid = re.findall('ENSMUST[\d]+', feature_info)[0];
            if tid in mouse_transcripts:
                num_cds += 1;
                cds_len = end - start;
                cds_len_sum += cds_len;
                mouse_transcripts[tid]['cds'].append([chrome, start, end, cds_len, strand]);

        if feature_type == "start_codon":
            tid = re.findall('ENSMUST[\d]+', feature_info)[0];
            if tid in mouse_transcripts:
                mouse_transcripts[tid]['start-codon'] = start;
        if feature_type == "stop_codon":
            tid = re.findall('ENSMUST[\d]+', feature_info)[0];
            if tid in mouse_transcripts:
                mouse_transcripts[tid]['stop-codon'] = end;

    mcore.PWS("# Exons read:              " + str(num_exons), logfile);
    mcore.PWS("# Avg. exon length:        " + str(exon_len_sum / num_exons), logfile);
    mcore.PWS("# CDS fragments read:      " + str(num_cds), logfile);
    mcore.PWS("# Avg. CDS fragment length:" + str(cds_len_sum / num_cds), logfile);
    mcore.PWS("# ----------------", logfile);

    with_sc = 0;
    without_sc = 0;
    for tid in mouse_transcripts:
        if mouse_transcripts[tid]['start-codon'] != "":
            without_sc += 1;
        else:
            with_sc += 1;

    mcore.PWS("# Transcripts with start codons:    " + str(with_sc), logfile);
    mcore.PWS("# Transcripts without start codons: " + str(without_sc), logfile);    

    # core.PWS("# " + core.getDateTime() + " Counting...", logfile);
    # total_transcripts = 0;
    # more_than_one = 0;
    # just_one = 0;
    # none = 0;
    # for tid in mouse_transcripts:
    #     total_transcripts += 1;
    #     if mouse_transcripts[tid] > 1:
    #         more_than_one += 1;
    #     elif mouse_transcripts[tid] == 1:
    #         just_one += 1;
    #     elif mouse_transcripts[tid] < 1:
    #         none += 1;
    #         print(tid);
    #         sys.exit();

    # core.PWS("# Total transcripts:                   " + str(total_transcripts), logfile);
    # core.PWS("# Transcripts with more than one CDS:  " + str(more_than_one), logfile);
    # core.PWS("# Transcripts with exactly one CDS:    " + str(just_one), logfile);
    # core.PWS("# Transcripts with no CDS:             " + str(none), logfile);
    # sys.exit();

    mcore.PWS("# " + mcore.getDateTime() + " Retrieving mouse exon, CDS, and transcript seqs...", logfile);
    i = 0;
    for tid in mouse_transcripts:
        if i % 500 == 0:
            print("Read " + str(i) + " / " + str(num_transcripts) + " transcripts")
        i += 1;

        outline = tid;

        #print(tid);

        t_chrome, t_start, t_end = mouse_transcripts[tid]['chrome'], mouse_transcripts[tid]['start'], mouse_transcripts[tid]['end'];
        t_start_codon = mouse_transcripts[tid]['start-codon'];
        t_stop_codon = mouse_transcripts[tid]['stop-codon'];
        
        transcript_outfile = os.path.join(outdir, tid + ".fa");
        cds_outfile = os.path.join(outdir, tid + "-cds.fa");
        exon_outdir = os.path.join(outdir, tid + "-exons");
        if not os.path.isdir(exon_outdir):
            os.system("mkdir " + exon_outdir);

        e_files = [];
        exon_ids = [];
        for eid in mouse_transcripts[tid]['exons']:
            exon_ids.append(eid);
            e_chrome, e_num = mouse_transcripts[tid]['exons'][eid]['chrome'], mouse_transcripts[tid]['exons'][eid]['num'];
            e_start, e_end = mouse_transcripts[tid]['exons'][eid]['start'], mouse_transcripts[tid]['exons'][eid]['end'];
            e_strand = mouse_transcripts[tid]['exons'][eid]['strand'];

            if len(e_num) == 1:
                e_num = "0" + e_num;

            if t_start_codon != "" and e_start < t_start_codon and e_end > t_start_codon:
                suffix = "-start";
            elif t_stop_codon != "" and e_start < t_stop_codon and e_end > t_stop_codon:
                suffix = "-stop";
            else:
                suffix = "";

            exon_outfile = os.path.join(exon_outdir, e_num + "-" + eid + suffix + ".fa");
            e_files.append(exon_outfile);

            exon_cmd = "samtools faidx " + ref + " " + e_chrome + ":" + str(e_start) + "-" + str(e_end);
            if e_strand == "-":
                exon_cmd += " -i ";
            exon_cmd += " > " + exon_outfile;
            #print(exon_cmd);
            os.system(exon_cmd);

        mcore.filePrep(cds_outfile);
        cds_title = ">" + tid + " CDS";
        cds_seq = "";
        for cds in mouse_transcripts[tid]['cds']:
            c_chrome, c_start, c_end, c_strand = cds[0], cds[1], cds[2], cds[4];
            cds_cmd = "samtools faidx " + ref + " " + c_chrome + ":" + str(c_start) + "-" + str(c_end)
            if c_strand == "-":
                cds_cmd += " -i ";            
            cds_cmd += " > tmp.fa";
            #print(cds_cmd);
            os.system(cds_cmd);
            
            titles, seqs = mseq.fastaGetLists("tmp.fa");
            # print(titles);
            # print(seqs);
            # sys.exit();
            cds_seq += seqs[0];
        mseq.writeSeq(cds_outfile, cds_seq, cds_title);

        transcript_cmd = "samtools faidx " + ref + " " + t_chrome + ":" + t_start + "-" + t_end
        if mouse_transcripts[tid]['strand'] == "-":
            transcript_cmd += " -i ";
        transcript_cmd += " > " + transcript_outfile;
        #print(transcript_cmd);
        os.system(transcript_cmd);

        logfile.write(tid + "\t" + ";".join(exon_ids) + "\n");

        #sys.exit();

































    

