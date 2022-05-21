#!/usr/bin/python3
############################################################
# For rodent exomes, 08.2020
# A script to count the number of reads after each step.
############################################################

import sys
sys.path.append("../../lib/");
# Add the repo's lib dir to the path.

import os, subprocess, argparse, mcore, mfiles, globs, multiprocessing as mp

############################################################
def runCMD(cmd_str):
    cmd_result = subprocess.run(cmd_str, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE);
    cmd_stdout = cmd_result.stdout.decode();
    cmd_stderr = cmd_result.stderr.decode();
    cmd_output = cmd_stdout + "\n\n" + cmd_stderr;

    if any(ecode in cmd_output for ecode in ['error', 'Error', 'ERROR', 'Exception', 'Could not build fai index', 
                                                'AssertionError', "Can't read file", "Killed", "No such file or directory", 
                                                "Symbolic alleles other than <DEL> are currently not supported",
                                                "Failed to open", "The index file is older than the data file",
                                                "tabix: command not found"]):
        sys.exit("* THE FOLLOWING COMMAND RETURNED AN ERROR: " + cmd_str + "\n* COMMAND OUTPUT: " + cmd_output);

    else:
        print(cmd_stdout);
        return [float(result) for result in cmd_stdout.split("\n")[:-1]];

############################################################
def countReads(sfiles, r):
    cur_bases, cur_reads = 0, 0;
    print(sfiles);
    for f in sfiles:
        print(f);
        if not f.endswith(".fastq.gz"):
            sys.exit(" * ERROR: Invalid file extension: " + f);

        if r in [0,1]:
            cmd = "zcat " + f + " | awk '{ if(NR%4==2) { reads++; bases += length } } END{ print bases; print reads; print bases/reads; }'";
            cur_bases, cur_reads, cur_avg_read_len = runCMD(cmd);

            #reads_cmd = "zcat " + f + " | echo $((`wc -l`/4))";
            #cur_reads += runCMD(reads_cmd);

            #bases_cmd = "zcat " + f + " | paste - - - - | cut -f 2 | tr -d '\n' | wc -c";
            #cur_bases += runCMD(bases_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14,15]:
            f = f.split(";");
            cmd = "zcat " + f[0] + " | awk '{ if(NR%4==2) { reads++; bases += length } } END{ print bases; print reads; print bases/reads; }'";
            paired_bases_1, paired_reads_1, cur_avg_read_len_1 = runCMD(cmd);

            cmd = "zcat " + f[1] + " | awk '{ if(NR%4==2) { reads++; bases += length } } END{ print bases; print reads; print bases/reads; }'";
            paired_bases_2, paired_reads_2, cur_avg_read_len_2 = runCMD(cmd);

            #assert paired_bases_1 == paired_bases_2, "\nUNEVEN NUMBER OF BASES IN READ PAIR:\n" + f[0] + "\t" + str(paired_bases_1) + "\n" + f[1] + "\t" + str(paired_bases_2);
            #assert paired_reads_1 == paired_reads_2, "\nUNEVEN NUMBER OF READ PAIRS:\n" + f[0] + "\t" + str(paired_reads_1) + "\n" + f[1] + "\t" + str(paired_reads_2);
            
            cur_bases += paired_bases_1 + paired_bases_2;
            cur_reads += paired_reads_1 + paired_reads_2;
        # Paired end runs 
            
        print(cur_bases);
        print(cur_reads);
    return cur_bases, cur_reads;

#########################

def parallelParse(spec, indir, run_types, run_strings):
    s_mod = spec.replace(" ", "-");
    spec_dir = os.path.join(args.indir, s_mod);
    assert os.path.isdir(spec_dir), "\nCANNOT FIND DIRECTORY: " + spec_dir;
    if args.file_check:
        return "", "";
    # Check output directory

    outline = {"Total bases" : 0, "Total reads" : 0};

    for run_ind in range(len(run_types)):
        r = run_types[run_ind];
        run_string = run_strings[run_ind];
        run_dir = os.path.join(spec_dir, run_string);

        seqfiles = mfiles.getFiles(s_mod, r, run_string, indir);
        if seqfiles:
            bases, reads = countReads(seqfiles, r);
            outline['Total bases'] += bases;
            outline['Total reads'] += reads;

            print(outline);

        if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
            run_string += "-no-WGA";
            run_dir = os.path.join(spec_dir, run_string);
            seqfiles = mfiles.getFiles(s_mod, r, run_string, indir);
            if seqfiles:
                bases, reads = countReads(seqfiles, r);
                outline['Total bases'] += bases;
                outline['Total reads'] += reads;

    return s_mod, outline;

############################################################
##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Counts reads.");
parser.add_argument("-i", dest="indir", help="The input directory containing many directories full of reads (i.e. 00-RawReads).", default=False);
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-p", dest="procs", help="The number of species to count at once. Default: 1", type=int, default=1);
# parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("--filecheck", dest="file_check", help="Set to simply check if all the files exist for each species.", action="store_true");
parser.add_argument("--overwrite", dest="overwrite", help="If the job and submit files already exist and you wish to overwrite them, set this option.", action="store_true", default=False);
# IO options
args = parser.parse_args();
# Input options.

if not args.indir:
    sys.exit("* ERROR: Please specify an input directory with -i.");
elif not os.path.isdir(args.indir):
    sys.exit("* ERROR: Cannot find input directory: " + args.indir);
# Check input directory.

if args.procs < 1:
    sys.exit("* ERROR: -p must be a postive integer.");

seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

pad = 26
cwd = os.getcwd();
# Job vars

#output_file = os.path.join(args.indir, "count-reads.csv");
output_file = os.path.join("count-reads.csv");
# Job files

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
# Parse the input run types.

specs = mfiles.parseSpecs(args.spec, specs_ordered);
specs = [ s for s in specs if "(no WGA)" not in s and "pos_ctrl" not in s ];
specs = [ s for s in specs if any(r in spec_ids[s] for r in runtype) ];
# Parse the input species.

##########################
# Reporting run-time info for records.
with open(output_file, "w") as outfile, mp.Pool(processes=args.procs) as pool:
    mcore.runTime("# Rodent read counting", outfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + args.indir, outfile);
    mcore.PWS(mcore.spacedOut("# Output file:", pad) + output_file, outfile);
    mcore.PWS(mcore.spacedOut("# Species:", pad) + args.spec, outfile);
    mcore.PWS(mcore.spacedOut("# Seq runs:", pad) + args.runtype, outfile);
    mcore.PWS(mcore.spacedOut("# Job file:", pad) + output_file, outfile);
    mcore.PWS("# ----------", outfile);
    mcore.PWS("# BEGIN OUTPUT", outfile);

##########################
    headers = ["Total bases", "Total reads"];
    mcore.PWS("Species" + "," + ",".join(headers));

    outlines = {};
    chunk_num, spec_num = 1, 1;
    cur_specs = [];

    for spec in specs:
        print(str(chunk_num) + "-" + str(spec_num) + " " + spec);
        spec_num += 1;

        cur_specs.append(spec);
        if len(cur_specs) == args.procs:
            for result in pool.starmap(parallelParse, ((s, args.indir, runtype, runstrs) for s in cur_specs)):
                if not args.file_check:
                    outlines[result[0]] = result[1];
                else:
                    continue;
            chunk_num += 1;
            cur_specs = [];

    if cur_specs != []:
        for result in pool.starmap(parallelParse, ((s, args.indir, runtype, runstrs) for s in cur_specs)):
                if not args.file_check:
                    outlines[result[0]] = result[1];
                else:
                    continue;

    if args.file_check:
        sys.exit();

    for spec in specs_ordered:
        if spec in specs:
            s_mod = spec.replace(" ", "-")
            outline = s_mod + "," + ",".join([ str(outlines[s_mod][col]) for col in headers ]);
            mcore.PWS(outline, outfile);
            sys.exit();


