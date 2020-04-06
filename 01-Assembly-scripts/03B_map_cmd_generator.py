#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Run BWA on all read files from a given sample and 
# sequencing run.
############################################################

import sys, os, argparse, core, gzip, lib.globs as globs
from datetime import datetime

############################################################

def getFiles(s, run_string, ref_outdir):
    indir = os.path.join("/scratch/gregg_thomas/Murinae-seq/02-Decon/", s, run_string);

    if not os.path.isdir(indir):
        return False, False;

    seqfiles = [ f for f in os.listdir(indir) if ".fastq.gz" in f ];

    if r in [0,1]:
        seqfiles = [ os.path.join(indir, f) for f in seqfiles ];

    elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
        seqfiles = pairUp(seqfiles, indir);

    specout = os.path.join(ref_outdir + s_mod);
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

def genBWACmd(sfiles, r, run_string, spec, outdir, baselogfile, ref):
    cmd_list = [];
    cmd_num = 0;
    for f in sfiles:
        if not f.endswith(".fastq.gz"):
            sys.exit(" * ERROR: Invalid file extension: " + f);

        f_pair = f.replace(";", " ");
        f = f.split(";")[0];

        with gzip.open(f) as fo:
            fl = fo.readline().decode().strip()[1:].split(":");

        read_group = "@RG\\tID:" + ".".join([fl[0], fl[1], fl[2]]);
        read_group += "\\tPL:ILLUMINA";
        read_group += "\\tPU:" + ".".join([fl[0], fl[1], fl[2]]);
        read_group += "\\tLB:" + run_string;
        read_group += "\\tSM:" + spec;

        if r in [0,1]:
            basefile = os.path.splitext(os.path.basename(f))[0].replace(".fastq", ".bam");
            bamfile = os.path.join(outdir, basefile);

            bwa_cmd = "bwa mem -R '" + read_group + "' " + ref + " " + f + " | samtools view -bh - | samtools sort - -o " + bamfile; 

            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            bwa_cmd += " 2> " + logfile;
            cmd_list.append(bwa_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            basefile = os.path.splitext(os.path.basename(f))[0].replace("_R1_", "_").replace(".fastq", ".bam");
            bamfile = os.path.join(outdir, basefile);

            bwa_cmd = "bwa mem -R '" + read_group + "' " + ref + " " + f_pair + " | samtools view -bh - | samtools sort - -o " + bamfile; 

            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            bwa_cmd += " 2> " + logfile;
            cmd_list.append(bwa_cmd);
        # Paired end runs 

    return cmd_list;

############################################################

core.runTime("#!/bin/bash\n# Rodent BWA commands");

parser = argparse.ArgumentParser(description="Generates commands for BWA for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to lookup", default="all");
parser.add_argument("-ref", dest="ref", help="One of rat, mouse, or mouse-targets", default="mouse");
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
            sys.exit(core.errorOut("SF2", "Cannot find specified species: " + s));
# Parse the input species.

args.ref = args.ref.lower()
if args.ref not in ['rat','mouse']:
    sys.exit(core.errorOut("M1", "-ref must be one of either 'rat' or 'mouse'."));
if args.ref == 'mouse':
    ref = "/scratch/gregg_thomas/Rodent-ref-genomes/mm10/mm10.fa"
    ref_outdir = "/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/"
    log_outdir = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedMouse-logs/"    
elif args.ref == 'rat':
    ref = "/scratch/gregg_thomas/Rodent-ref-genomes/rnor6/rnor6.fa"
    ref_outdir = "/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/"
    log_outdir = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-logs/"
# Reference options

i = 1;
for s in spec:
    s_mod = s.replace(" ", "-");
    
    if "(no-WGA)" in s_mod:
        continue;

    for r in runtype:
        run_string = runstrs[r];

        baselogfile = os.path.join(log_outdir, s_mod + "-" + run_string + "-bwa");

        seqfiles, outdir = getFiles(s_mod, run_string, ref_outdir);

        if not seqfiles:
            continue;
            
        bwa_cmds = genBWACmd(seqfiles, r, run_string, s_mod, outdir, baselogfile, ref);
        for cmd in bwa_cmds:
            print(cmd);


        if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
            run_string += "-no-WGA"

            seqfiles, outdir = getFiles(s_mod, run_string, ref_outdir);
            if not seqfiles:
                continue;
            bwa_cmds = genBWACmd(seqfiles, r, run_string, s_mod, outdir, baselogfile, ref);
            for cmd in bwa_cmds:
                print(cmd);
