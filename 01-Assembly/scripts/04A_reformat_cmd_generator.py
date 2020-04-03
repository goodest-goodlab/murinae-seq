#!/usr/bin/python3
############################################################
# For rodent exomes, 12.2019
# Run reformat.sh on all unmerged paired-end reads that have
# been interleaved by dedupe.sh
############################################################

import sys, os, argparse, core, lib.globs as globs
from datetime import datetime

############################################################

def getFiles(s, run_string):
    indir = os.path.join("/scratch/gregg_thomas/Murinae-seq/03A-Merged/", s, run_string);
    # indir is still merged folder to preseve paired file names -- output files will replace merged directory with dedup directory
    # even though input files are from intermediate directory.

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

def genReformatCmd(sfiles, r, outdir, baselogfile):
    cmd_list = [];
    cmd_num = 0;
    #print(sfiles);
    for f in sfiles:
        #print(f);
        if r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            if ".unmerged." in f:
               
                f = f.split(";");
                fint = f[0].replace("_R2_", "_R1_").replace("_R1_", "_").replace("03A-Merged", "04A-intermediate");

                fout1 = f[0].replace("03A-Merged", "04A-Dedup").replace(".fastq.gz", ".dedup.fastq.gz");
                fout2 = f[1].replace("03A-Merged", "04A-Dedup").replace(".fastq.gz", ".dedup.fastq.gz");

                reformat_cmd = "reformat.sh in=" + fint + " overwrite=true out1=" + fout1 + " out2=" + fout2;
                cmd_num += 1;
                logfile = baselogfile + "-" + str(cmd_num) + ".log";
                reformat_cmd += " &> " + logfile;
                #print(str(cmd_num) + "    " + reformat_cmd); 
                cmd_list.append(reformat_cmd);
            # Unmerged reads         
        # Paired end runs 

    return cmd_list;

############################################################

core.runTime("#!/bin/bash\n# Rodent reformat commands");

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
    # if(s_mod == "Pseudomys-oralis"):
    #     print(s_mod);
    #else:
    #    continue;

    outdir = os.path.join("/scratch/gregg_thomas/Murinae-seq/04A-Dedup/" + s_mod);

    for r in runtype:
        reformat_cmds = [];
        run_string = runstrs[r];
        #print(str(r) + " " + run_string);
        baselogfile = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/04A-Reformat-logs/" + s_mod + "-" + run_string + "-reformat";

        seqfiles, outdir = getFiles(s_mod, run_string);
        #print(seqfiles);
        if seqfiles:
            reformat_cmds = genReformatCmd(seqfiles, r, outdir, baselogfile); 

        if s_mod in ["Rattus-exulans", "Rattus-hoffmani"]:
            run_string += "-no-WGA";
            seqfiles, outdir = getFiles(s_mod, run_string);
            if seqfiles:
                reformat_cmds_2 = genReformatCmd(seqfiles, r, outdir, baselogfile);
                reformat_cmds += reformat_cmds_2;            
        
        if reformat_cmds:
            for cmd in sorted(reformat_cmds):
                print(cmd);


        #print("\n--------\n");