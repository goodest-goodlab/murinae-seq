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
    indir = os.path.join("/scratch/gregg_thomas/Murinae-seq/02-Decon/", s, run_string);

    if not os.path.isdir(indir):
        return False, False;

    seqfiles = [ f for f in os.listdir(indir) if ".fastq.gz" in f ];

    if r in [0,1]:
        seqfiles = [ os.path.join(indir, f) for f in seqfiles ];

    elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
        seqfiles = pairUp(seqfiles, indir);

    specout = os.path.join("/scratch/gregg_thomas/Murinae-seq/03A-Merged/" + s_mod);
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

def genMergeCmd(sfiles, r, outdir, baselogfile):
    cmd_list = [];
    cmd_num = 0;
    for f in sfiles:
        if r in [0,1]:
            #basefile = os.path.splitext(os.path.basename(f))[0].replace("fastq", "decon");
            #readfile = os.path.join(outdir, basefile + ".fastq.gz");
            fout = f.replace("02-Decon", "03A-Merged");

            cp_cmd = "cp " + f + " " + fout;
            #decon_cmd = "bbmerge.sh -Xmx10g t=1 in=" + f + " ref=" + decondir + " path=" + decondir + " minid=0.95 outu=" + readfile;
            cmd_num += 1;
            logfile = baselogfile.replace("-merge", "-cp") + "-" + str(cmd_num) + ".log";
            cp_cmd += " &> " + logfile;     
            cmd_list.append(cp_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            f = f.split(";");
            outdir = os.path.dirname(f[0]).replace("02-Decon", "03A-Merged");
            basefile = os.path.splitext(os.path.basename(f[0]))[0].replace("fastq","");
            mergefile = os.path.join(outdir, basefile.replace("_R1_", "_") + "merged.fastq.gz");
            unmerged1 = os.path.join(outdir, basefile + "unmerged.fastq.gz");
            unmerged2 = os.path.join(outdir, basefile.replace("_R1_", "_R2_") + "unmerged.fastq.gz");

            merge_cmd = "bbmerge.sh -Xmx15g t=1 in1=" + f[0] + " in2=" + f[1] + " verystrict=t rem k=40 extend2=40 ecct outu1=" + unmerged1 + " outu2=" + unmerged2 + " out=" + mergefile;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            merge_cmd += " &> " + logfile;
            cmd_list.append(merge_cmd);
        # Paired end runs 

    return cmd_list;

############################################################

core.runTime("#!/bin/bash\n# Rodent decon commands");

parser = argparse.ArgumentParser(description="Generates commands for read merging with bbmap for 48 exomes.");
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
            sys.exit(core.errorOut("SF1", "Cannot find specified sequencing run: " + str(r)));
# Parse the input runtypes.

runstrs = [];
for r in runtype:
    for runstr, runind in seq_run_ids.items():
        if runind == r:
            runstrs.append(runstr);
            args.runtype = runstr;
# Get the string run type if int is given as input.

if args.spec == "all":
    spec = specs_ordered;
else:
    spec = args.spec.replace(", ", ",").split(",");
    for s in spec:
        if s not in spec_ids:
            sys.exit(core.errorOut("SF2", "Cannot find specified species: " + s));
# Parse the input species.

i = 1;
for s in spec:
    s_mod = s.replace(" ", "-");

    if "(no-WGA)" in s_mod:
        continue;

    for r in runtype:
        run_string = runstrs[r]

        baselogfile = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/03A-Merged-logs/" + s_mod + "-" + run_string + "-merge";

        seqfiles, outdir = getFiles(s_mod, run_string);

        if not seqfiles:
            continue;
            
        merge_cmds = genMergeCmd(seqfiles, r, outdir, baselogfile);
        for cmd in merge_cmds:
            print(cmd);


        if s_mod in ["Rattus-exulans", "Rattus-hoffmani"]:
            run_string += "-no-WGA"

            seqfiles, outdir = getFiles(s_mod, run_string);
            if not seqfiles:
                continue;
            merge_cmds = genMergeCmd(seqfiles, r, outdir, baselogfile);
            for cmd in merge_cmds:
                print(cmd);
            