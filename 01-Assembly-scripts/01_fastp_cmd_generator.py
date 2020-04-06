#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Run FastP on all read files from a given sample and 
# sequencing run.
############################################################

import sys, os, argparse, core, lib.globs as globs
from datetime import datetime

############################################################

def getFiles(s, run_string):
    indir = os.path.join("/scratch/gregg_thomas/Murinae-seq/00-RawReads/", s, run_string);

    if not os.path.isdir(indir):
        return False, False;

    seqfiles = os.listdir(indir);

    if r in [0,1]:
        seqfiles = [ os.path.join(indir, f) for f in seqfiles ];

    elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
        seqfiles = pairUp(seqfiles, indir);

    specout = os.path.join("/scratch/gregg_thomas/Murinae-seq/01-Fastp/" + s_mod);
    if not os.path.isdir(specout):
        os.system("mkdir " + specout);
    outdir = os.path.join(specout, run_string);
    if not os.path.isdir(outdir):
        os.system("mkdir " + outdir);

    return seqfiles, outdir;

########################

def pairUp(sfiles, indir):
# Pairs up the paired end read files.
    paired_files = [];
    done = [];
    for f in sfiles:
        if "_R1_" in f:
            f2 = f.replace("_R1_", "_R2_");
        else:
            continue;

        f = os.path.join(indir, f);
        f2 = os.path.join(indir, f2);

        if not os.path.isfile(f) or not os.path.isfile(f2):
            sys.exit(" * File not found! " + "\n" + f + "\n" + f2 + "\n");

        if f in done or f2 in done:
            continue;

        done += f, f2;

        paired_files.append(f + ";" + f2);

    return paired_files;

########################

def genFastpCmd(sfiles, r, outdir, baselogfile):
    cmd_list = [];
    cmd_num = 0;
    for f in sfiles:
        if not f.endswith(".fastq.gz"):
            sys.exit(" * ERROR: Invalid file extension: " + f);

        if r in [0,1]:
            basefile = os.path.splitext(os.path.basename(f))[0].replace("fastq", "fastp");
            readfile = os.path.join(outdir, basefile + ".fastq.gz");
            htmlfile = os.path.join(outdir, basefile + ".fastp.html");
            jsonfile = os.path.join(outdir, basefile + ".fastp.json");   

            fastp_cmd = "fastp -i " + f + " --length_required 30 --low_complexity_filter --complexity_threshold 30 -o " + readfile  + " -h " + htmlfile + " -j " + jsonfile;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            fastp_cmd += " &> " + logfile;
            cmd_list.append(fastp_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            f = f.split(";");
            basefile1 = os.path.splitext(os.path.basename(f[0]))[0].replace("fastq", "fastp");
            readfile1 = os.path.join(outdir, basefile1 + ".fastq.gz");

            basefile2 = os.path.splitext(os.path.basename(f[1]))[0].replace("fastq", "fastp");
            readfile2 = os.path.join(outdir, basefile2 + ".fastq.gz");

            c = 0;
            baselogf = "";
            while basefile1[c] == basefile2[c]:
                baselogf += basefile1[c];
                c += 1;

            htmlfile = os.path.join(outdir, baselogf + ".fastp.html");
            jsonfile = os.path.join(outdir, baselogf + ".fastp.json");

            fastp_cmd = "fastp -i " + f[0] + " -I " + f[1] + " --detect_adapter_for_pe";
            fastp_cmd += " --length_required 30 --low_complexity_filter --complexity_threshold 30";
            fastp_cmd += " -o " + readfile1 + " -O " + readfile2  + " -h " + htmlfile + " -j " + jsonfile;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            fastp_cmd += " &> " + logfile;
            cmd_list.append(fastp_cmd);
        # Paired end runs 
    return cmd_list;
############################################################


core.runTime("#!/bin/bash\n# Rodent fastp commands");

parser = argparse.ArgumentParser(description="Generates commands for read filtering and trimming with fastp for 48 exomes.");
parser.add_argument("-s", dest="spec", help="A species to lookup", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to lookup. One of: 'nextseq single 1', 'nextseq single 2', 'all'", default="all");
parser.add_argument("--c", dest="carnation", help="Set this option if running on Carnation.", action="store_true", default=False);
args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, spec_abbr, basedirs = globs.get();

if args.carnation:
    basedirs = ["/nfs/musculus" + d for d in basedirs];

if args.runtype == "all":
    runtype = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14];
else:
    runtype = [];
    args.runtype = args.runtype.replace(", ", ",").split(",");
    for r in args.runtype:
        if r in seq_run_ids:
            runtype.append(seq_run_ids[r]);
        elif r in ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14"]:
            runtype.append(int(r));
        else:
            sys.exit(core.errorOut("FP1", "Cannot find specified sequencing run: " + str(r)));
# Parse the input runtypes.

runstrs = {};
for runstr, runind in seq_run_ids.items():
    runstrs[runind] = runstr;
# Get the string run type if int is given as input.

if args.spec == "all":
    spec = specs_ordered;
else:
    spec = args.spec.replace(", ", ",").split(","); 
    for s in spec:
        if s not in spec_ids:
            sys.exit(core.errorOut("FP2", "Cannot find specified species: " + s));
# Parse the input species.

i = 1;
for s in spec:
    s_mod = s.replace(" ", "-");
    
    if "(no-WGA)" in s_mod:
        continue;

    for r in runtype:
        run_string = runstrs[r];

        baselogfile = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/01-Fastp-logs/" + s_mod + "-" + run_string + "-fastp";

        seqfiles, outdir = getFiles(s_mod, run_string);

        if not seqfiles:
            continue;
            
        fastp_cmds = genFastpCmd(seqfiles, r, outdir, baselogfile);
        for cmd in fastp_cmds:
            print(cmd);

        if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
            run_string += "-no-WGA"

            seqfiles, outdir = getFiles(s_mod, run_string);
            if not seqfiles:
                continue;
            fastp_cmds = genFastpCmd(seqfiles, r, outdir, baselogfile);
            for cmd in fastp_cmds:
                print(cmd);


