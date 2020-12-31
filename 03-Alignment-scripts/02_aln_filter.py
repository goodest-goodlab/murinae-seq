#!/usr/bin/python
############################################################
# For Penn genomes, 06.2020
# Takes a log file from a clipkit run on amino acid sequence
# and removes corresponding sites from codon alignment.
############################################################

import sys, os, core, coreseq, argparse

############################################################
# Options

parser = argparse.ArgumentParser(description="Codon alignment check filter");
parser.add_argument("-i", dest="input", help="Directory of alignments.", default=False);
#parser.add_argument("-w", dest="wsize", help="Codon window size. Default: 3", type=int, default=3);
parser.add_argument("-o", dest="output", help="Desired output directory for filtered CDS alignments.", default=False);
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
# parser.add_argument("-e", dest="expected", help="The expected number of species in each alignment file. Check for one-to-one alignments to only align sequences that retained all species after trimming.", default=False);
parser.add_argument("--noncoding", dest="noncoding", help="Set this option to check non-coding data. Will not check for stop codons.", action="store_true", default=False);
parser.add_argument("--protein", dest="protein", help="Set this option to check amino acid data.", action="store_true", default=False);
parser.add_argument("--count", dest="count_only", help="Set this option to just provide the log file with counts/stats. Will not write new sequences", action="store_true", default=False);
parser.add_argument("--overwrite", dest="overwrite", help="If the output directory already exists and you wish to overwrite it, set this option.", action="store_true", default=False);
# IO options
args = parser.parse_args();

if not args.input or not os.path.isdir(args.input):
    sys.exit( " * Error 1: An input directory with aligned CDS sequences must be defined with -i.");
args.input = os.path.abspath(args.input);

# if args.wsize < 1:
#     sys.exit(" * Error 2: Window size (-w) must be a positive integer.");

if not args.name:
    name = core.getRandStr();
else:
    name = args.name;

if not args.count_only and not args.output:
    sys.exit( " * Error 2: An output directory must be defined with -o.");

if not args.count_only:
    args.output = os.path.abspath(args.output);
    if os.path.isdir(args.output) and not args.overwrite:
        sys.exit( " * Error 3: Output directory (-o) already exists! Explicity specify --overwrite to overwrite it.");

if args.noncoding and args.protein:
    sys.exit(" * Error 4: Please specify only one of --noncoding or --protein.");
elif args.noncoding:
    mode = "nt";
elif args.protein:
    mode = "aa";
else:
    mode = "codon";

# expected = False;
# if args.expected:
#     eflag = False;
#     try:
#         expected = int(args.expected);
#     except:
#         eflag = True;
#     if eflag or expected < 1:
#         sys.exit(" * Error 4: -e must be a positive integer.");
# IO option error checking

pad = 26
cwd = os.getcwd();
# Job vars

log_file = os.path.join("logs", name + ".log");
# Job files

##########################
# Reporting run-time info for records.

with open(log_file, "w") as logfile:
    core.runTime("# CDS alignment filter", logfile);
    core.PWS("# IO OPTIONS", logfile);
    core.PWS(core.spacedOut("# Input CDS directory:", pad) + args.input, logfile);
    core.PWS(core.spacedOut("# Input sequence type:", pad) + mode, logfile);
    #core.PWS(core.spacedOut("# Codon window size:", pad) + str(args.wsize), logfile);
    if not args.name:
        core.PWS("# -n not specified --> Generating random string for job name", logfile);
    core.PWS(core.spacedOut("# Job name:", pad) + name, logfile);
    if not args.count_only:
        core.PWS(core.spacedOut("# Output directory:", pad) + args.output, logfile);
        if args.overwrite:
            core.PWS(core.spacedOut("# --overwrite set:", pad) + "Overwriting previous files in output directory.", logfile);
        if not os.path.isdir(args.output):
            core.PWS("# Creating output directory.", logfile);
            os.system("mkdir " + args.output);
    else:
        core.PWS(core.spacedOut("# --count set:", pad) + "Will not output sequences, ignoring -o.", logfile);
    core.PWS(core.spacedOut("# Log file:", pad) + log_file, logfile);
    core.PWS("# ----------------", logfile);
    
##########################
# Filtering CDS aligns

    core.PWS("# " + core.getDateTime() + " Beginning filter...", logfile);
    if mode == "aa":
        headers = ["Align", "Num seqs", "Aln length", "Short seq", "Num uniq seqs", "Num ident seqs", "Percent ident seqs", "Percent ident seqs high", ">20% gap seqs", "Percent >20% gap seqs", "Percent >20% gap seqs high", "No info sites", "Percent no info sites", "Percent no info sites high"];
    if mode == "nt":
        headers = ["Align", "Num seqs", "Aln length", "Short seq", "Num uniq seqs", "Num ident seqs", "Percent ident seqs", "Percent ident seqs high", ">20% gap seqs", "Percent >20% gap seqs", "Percent >20% gap seqs high", "No info sites", "Percent no info sites", "Percent no info sites high"];
    else:
        headers = ["Align", "Num seqs", "Aln length", "Codon length", "Short seq", "Num uniq seqs", "Num ident seqs", "Percent ident seqs", "Percent ident seqs high", ">20% gap seqs", "Percent >20% gap seqs", "Percent >20% gap seqs high", "No info sites", "Percent no info sites", "Percent no info sites high", "Num seq premature stop codons", "Percent seq premature stop codons", "Premature stop percent high"];
    core.PWS("\t".join(headers), logfile);
    # The global headers
    
    fa_files = [ f for f in os.listdir(args.input) if f.endswith(".fa") ];
    num_alns = len(fa_files);
    num_alns_str = str(num_alns);
    num_alns_len = len(num_alns_str);
    # Read align file names from input directory

    written, num_short, num_high_ident, num_gappy, aln_prem_stop, num_no_info, num_stoppy = 0.0,0.0,0.0,0.0,0.0,0.0,0.0;
    # Some count variables for all aligns

    # spec_high = {};
    # The dictionary to keep track of species count variables

    first_aln, counter, skipped = True, 0, 0;
    # Loop tracking variables

    for f in fa_files:
        if counter % 500 == 0:
            counter_str = str(counter);
            while len(counter_str) != num_alns_len:
                counter_str = "0" + counter_str;
            print ("> " + core.getDateTime() + " " + counter_str + " / " + num_alns_str);
        counter += 1;
        # Loop progress   

        cur_out = { h : "NA" for h in headers };
        cur_out["Align"] = f;
        cur_out[">20% gap seqs"] = 0.0;
        # Initialize the current output dictionary.

        cur_infile = os.path.join(args.input, f);
        if not args.count_only:
            cur_outfile = os.path.join(args.output, f.replace(".fa", ".filter.fa"));
        # Get the current in and output files

        # Make sure all files exist
        #print(f);
        #print(cur_outfile);
        #sys.exit();

        seqs_orig = core.fastaGetDict(cur_infile);
        seqs = { t : seqs_orig[t].upper() for t in seqs_orig };
        num_seqs = float(len(seqs));
        cur_out["Num seqs"] = str(num_seqs);
        # Read the sequences

        # if expected and num_seqs != expected:
        #     print("# Expected number of species not found... skipping: " + cur_infile + "\n");
        #     skipped += 1;
        #     continue;

        # if first_aln:
        # # Initialize some things on the first alignment
        #     spec_headers_order = [];
        #     for title in seqs:
        #         short_title = title.split(" ")[0];
        #         headers.append(short_title + " gaps/Ns");
        #         headers.append(short_title + " percent gaps/Ns");
        #         headers.append(short_title + " high percent gaps/Ns");
        #         if mode == "codon":
        #             headers.append(short_title + " prem stop");
        #         spec_headers_order.append(short_title);
        #         # For output, the species headers should retain an order set here

        #         spec_high[short_title] = { 'high-gaps' : 0, 'prem-stop' : 0 };
        #         # Initialize the overall counts for each species 

        #     logfile.write("\t".join(headers) + "\n");
        #     first_aln = False;
            # Write the headers and set the first flag to false

        num_high_gap, num_prem_stop = 0.0, 0.0;
        codon_seqs, spec_out = {}, {};
        seq_prem_stop = 0;
        first_seq, prem_stop_flag, short_seq, high_ident = True, False, "FALSE", "FALSE";
        # Variables for the current alignment

        for title in seqs:
            short_title = title.split(" ")[0];
            spec_out[short_title] = { 'gaps' : 0.0, 'perc-gaps' : 0.0, 'high-gaps' : "FALSE", 'prem-stop' : "FALSE" };
            # Initialize the species variables for this alignment

            if first_seq:
                seq_len = float(len(seqs[title]));
                cur_out["Aln length"] = str(seq_len);

                cur_out["Short seq"] = "FALSE";
                if seq_len < 100:
                    num_short += 1;
                    cur_out["Short seq"] = "TRUE";
                # Get the length of the alignment

                if mode == "codon":
                    codon_len = float(len(seqs[title]) / 3);
                    cur_out["Codon length"] = str(codon_len);
                #last_codon_ind = codon_len - 2;
                # Get the total number of codons in the alignment
                first_seq = False;
            # Get the length of the alignment from the first seq only

            seqs[title] = seqs[title].replace("!", "N");
            # Replace MACSE's frameshift ! char with N

            num_gaps = float(seqs[title].count("-") + seqs[title].count("N"));
            perc_gaps = round((num_gaps / seq_len) * 100, 2);
            if perc_gaps > 20:
                cur_out[">20% gap seqs"] += 1.0;
            # Count the number of gappy/uncalled sites for this sequence

            if mode == "codon":
                stop, seqs[title] = coreseq.premStopCheck(seqs[title], allowlastcodon=True, rmlast=True);
                if stop:
                    num_prem_stop += 1.0;
                    prem_stop_flag = True;
            # Check for premature stop codons and remove last codon if it is a stop
        # End sequence loop

        cur_out["Percent >20% gap seqs"] = round((cur_out[">20% gap seqs"] / num_seqs) * 100, 2);
        cur_out["Percent >20% gap seqs high"] = "FALSE";
        if cur_out["Percent >20% gap seqs"] > 50:
            cur_out["Percent >20% gap seqs high"] = "TRUE";
            num_gappy += 1;            

        all_seqs = list(seqs.values());
        ident_seqs = [];
        uniq_seqs = [];
        for t in seqs:
            seq_count = all_seqs.count(seqs[t]);
            if seq_count > 1 and seqs[t] not in ident_seqs:
                for i in range(seq_count):
                    ident_seqs.append(seqs[t]);
            elif seq_count == 1:
                uniq_seqs.append(seqs[t]);

        cur_out["Num uniq seqs"] = len(uniq_seqs) + len((set(ident_seqs)));
        cur_out["Num ident seqs"] = len(ident_seqs)

        cur_out["Percent ident seqs"] = round((cur_out["Num ident seqs"] / num_seqs) * 100, 2);
        cur_out["Percent ident seqs high"] = "FALSE";
        if cur_out["Percent ident seqs"] > 50:
            cur_out["Percent ident seqs high"] = "TRUE";
            num_high_ident += 1;
        # Check for identical sequences. This has to be done after the loop above because it changes sequences.

        if mode == "codon":
            if prem_stop_flag:
                aln_prem_stop += 1;
            # If any of the sequences in this alignment had a premature stop, add it to the count here

            cur_out["Num seq premature stop codons"] = num_prem_stop;
            cur_out["Percent seq premature stop codons"] = round((num_prem_stop / num_seqs) * 100, 2);
            cur_out["Percent seq premature stop codons high"] = "FALSE";
            if cur_out["Percent seq premature stop codons"] > 20:
                num_stoppy += 1;
                cur_out["Percent seq premature stop codons high"] = "TRUE";
            # Check if a high percentage of sequences contain premature stop codons
            
        cur_out["No info sites"] = 0.0;
        for i in range(int(seq_len)):
            num_gaps = 0.0;
            for title in seqs:
                if seqs[title][i] in ["-", "N"]:
                    num_gaps += 1.0;
            if num_gaps == num_seqs:
                num_no_info += 1;
                cur_out["No info sites"] += 1.0;
        # Count the number of columns that are all gaps or Ns

        cur_out["Percent no info sites"] = round((cur_out["No info sites"] / seq_len) * 100, 2);
        cur_out["Percent no info sites high"] = "FALSE";
        if cur_out["Percent no info sites"] > 20:
            num_gappy += 1;
            cur_out["Percent no info sites high"] = "TRUE";
        # Check if the number of columns that are all gaps or Ns is high

        outline = [ str(cur_out[h]) for h in headers ];
        logfile.write("\t".join(outline) + "\n");
        #core.PWS(("\t".join(outline)), logfile);
        # Write the log output line with counts for the current alignment

        if not args.count_only and not prem_stop_flag and cur_out["Short seq"] == "FALSE" and cur_out["Percent ident seqs high"] == "FALSE" and cur_out["Percent no info sites high"] == "FALSE":
            with open(cur_outfile, "w") as outfile:
                for title in seqs_orig:
                    outfile.write(title + "\n");
                    outfile.write(seqs_orig[title] + "\n");
                written += 1;
        # Write the edited sequence to the output file if there are no premature stop codons

    core.PWS("# ----------------", logfile);
    core.PWS(core.spacedOut("# Total aligns", 55) + str(num_alns), logfile);
    core.PWS(core.spacedOut("# Files skipped: ", pad) + str(skipped), logfile);
    core.PWS(core.spacedOut("# Aligns written", 55) + str(written), logfile);
    core.PWS(core.spacedOut("# Aligns shorter than 100bp", 55) + str(num_short), logfile);
    core.PWS(core.spacedOut("# Aligns with >50% identical sequences", 55) + str(num_high_ident), logfile);
    core.PWS(core.spacedOut("# Aligns with >20% of gappy/Ny sites", 55) + str(num_gappy), logfile);
    core.PWS(core.spacedOut("# Aligns with at least one premature stop:", 55) + str(aln_prem_stop), logfile); 
    if not args.noncoding:
        core.PWS(core.spacedOut("# Aligns with >20% of seqs with premature stops", 55) + str(num_stoppy), logfile);           
    core.PWS("# ----------------", logfile);
    # Write overall summary data

    # if args.noncoding:
    #     spec_headers = "Spec\tNumber >20% gappy"
    # else:
    #     spec_headers = "Spec\tNumber >20% gappy\tNumber premature stop"
    
    # core.PWS(spec_headers, logfile);
    # for title in spec_high:
    #     if mode == "codon":
    #         outline = [title, str(spec_high[title]['high-gaps']), str(spec_high[title]['prem-stop'])];
    #     else:
    #         outline = [title, str(spec_high[title]['high-gaps'])];
    #     core.PWS("\t".join(outline), logfile);
    # core.PWS("# ----------------", logfile);
    # Write species summary data

