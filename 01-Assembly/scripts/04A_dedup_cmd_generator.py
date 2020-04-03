#!/usr/bin/python3
############################################################
# For rodent exomes, 12.2019
# Run dedup.sh on all read files from a given sample and 
# sequencing run.
############################################################

import sys, os, argparse, core, lib.globs as globs
from datetime import datetime

############################################################

def getFiles(s, run_string):
    indir = os.path.join("/scratch/gregg_thomas/Murinae-seq/03A-Merged/", s, run_string);

    if not os.path.isdir(indir):
        return False, False;

    seqfiles = [ f for f in os.listdir(indir) if ".fastq.gz" in f ];

    if r in [0,1]:
        seqfiles = [ os.path.join(indir, f) for f in seqfiles ];

    elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
        seqfiles = pairUp(seqfiles, indir);

    specout = os.path.join("/scratch/gregg_thomas/Murinae-seq/04A-Dedup/" + s_mod);
    if not os.path.isdir(specout):
        os.system("mkdir " + specout);
    outdir = os.path.join(specout, run_string);
    if not os.path.isdir(outdir):
        os.system("mkdir " + outdir);

    intdir = os.path.join("/scratch/gregg_thomas/Murinae-seq/04A-intermediate/" + s_mod);
    if not os.path.isdir(intdir):
        os.system("mkdir " + intdir);

    return seqfiles, outdir;

########################

def pairUp(sfiles, indir):
# Pairs up the paired end read files.
    paired_files = [];
    done = [];
    for f in sfiles:
        if ".unmerged." in f:
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
        else:
            paired_files.append(os.path.join(indir, f));

    return paired_files;

########################

def genDedupCmd(sfiles, r, outdir, baselogfile):
    cmd_list = [];
    cmd_num = 0;
    #print(sfiles);
    for f in sfiles:
        #print(f);
        if r in [0,1]:
            #basefile = os.path.splitext(os.path.basename(f))[0].replace("fastq", "decon");
            #readfile = os.path.join(outdir, basefile + ".fastq.gz");
            fout = f.replace("03A-Merged", "04A-Dedup").replace(".fastq.gz", ".dedup.fastq.gz");

            dedup_cmd = "dedupe.sh -Xmx30g t=1 in=" + f + " ordered=t overwrite=true minidentity=100 out=" + fout;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            dedup_cmd += " &> " + logfile;     
            cmd_list.append(dedup_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            if ".unmerged." in f:
                f = f.split(";");
                fint = f[0].replace("_R2_", "_R1_").replace("_R1_", "_").replace("03A-Merged", "04A-intermediate");

                dedup_cmd = "dedupe.sh -Xmx30g t=1 in1=" + f[0] + " in2=" + f[1] + " ordered=t overwrite=true minidentity=100 out=" + fint;
                cmd_num += 1;
                logfile = baselogfile + "-" + str(cmd_num) + ".log";
                dedup_cmd += " &> " + logfile;
                cmd_list.append(dedup_cmd);
            # Unmerged reads

            else:
                fout = f.replace("03A-Merged", "04A-Dedup").replace(".fastq.gz", ".dedup.fastq.gz");

                dedup_cmd = "dedupe.sh -Xmx30g t=1 in=" + f + " ordered=t overwrite=true minidentity=100 out=" + fout;
                cmd_num += 1;
                logfile = baselogfile + "-" + str(cmd_num) + ".log";
                dedup_cmd += " &> " + logfile;
                cmd_list.append(dedup_cmd);     
            # Merged reads           
        # Paired end runs 

    return cmd_list;

############################################################

core.runTime("#!/bin/bash\n# Rodent dedup commands");

parser = argparse.ArgumentParser(description="Generates commands for read deduping with bbmap for 48 exomes.");
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
    if "(no WGA)" in s:
        continue;

    s_mod = s.replace(" ", "-");
    #print(s_mod);

    outdir = os.path.join("/scratch/gregg_thomas/Murinae-seq/04A-Dedup/" + s_mod);
    if not os.path.isdir(outdir):
        os.system("mkdir " + outdir);

    for r in runtype:
        dedup_cmds = [];
        run_string = runstrs[r];
        #print(str(r) + " " + run_string);
        baselogfile = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/04A-Dedup-logs/" + s_mod + "-" + run_string + "-dedup";

        seqfiles, outdir = getFiles(s_mod, run_string);
        if seqfiles:
            dedup_cmds = genDedupCmd(seqfiles, r, outdir, baselogfile); 

        if s_mod in ["Rattus-exulans", "Rattus-hoffmani"]:
            run_string += "-no-WGA";
            seqfiles, outdir = getFiles(s_mod, run_string);
            if seqfiles:
                dedup_cmds_2 = genDedupCmd(seqfiles, r, outdir, baselogfile);
                dedup_cmds += dedup_cmds_2;            

        if dedup_cmds:
            for cmd in sorted(dedup_cmds):
                print(cmd);