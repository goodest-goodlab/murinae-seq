#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Run FastP on all read files from a given sample and 
# sequencing run.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, globs

############################################################
# Functions
def genFastpCmd(fastp_path, sfiles, r, baselogfile, step, prev_step):
    cmd_list = [];
    cmd_num = 0;
    for f in sfiles:
        if not f.endswith(".fastq.gz"):
            sys.exit(" * ERROR: Invalid file extension: " + f);

        if r in [0,1]:
            outfile = f.replace(prev_step, step).replace(".fastq.gz", ".fastp.fastq.gz");
            htmlfile = outfile.replace(prev_step, step).replace(".fastq.gz", ".fastp.html");
            jsonfile = outfile.replace(prev_step, step).replace(".fastq.gz", ".fastp.json");

            fastp_cmd = fastp_path + " -i " + f + " --length_required 30 --low_complexity_filter --complexity_threshold 30 -o " + outfile  + " -h " + htmlfile + " -j " + jsonfile;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            fastp_cmd += " &> " + logfile;
            cmd_list.append(fastp_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            f = f.split(";");
            outfile1 = f[0].replace(prev_step, step).replace(".fastq.gz", ".fastp.fastq.gz");
            outfile2 = f[1].replace(prev_step, step).replace(".fastq.gz", ".fastp.fastq.gz");

            c = 0;
            supp_file = "";
            while outfile1[c] == outfile2[c]:
                supp_file += outfile1[c];
                c += 1;
            # Weird way to get the common file string between the two output files.

            htmlfile = supp_file + ".fastp.html";
            jsonfile = supp_file + ".fastp.json";

            fastp_cmd = "fastp -i " + f[0] + " -I " + f[1] + " --detect_adapter_for_pe";
            fastp_cmd += " --length_required 30 --low_complexity_filter --complexity_threshold 30";
            fastp_cmd += " -o " + outfile1 + " -O " + outfile2  + " -h " + htmlfile + " -j " + jsonfile;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            fastp_cmd += " &> " + logfile;
            cmd_list.append(fastp_cmd);
        # Paired end runs 
    return cmd_list;
############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for Fastp on rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to fastp. Default: fastq", default="fastp");
parser.add_argument("--overwrite", dest="overwrite", help="If the job and submit files already exist and you wish to overwrite them, set this option.", action="store_true", default=False);
# IO options

parser.add_argument("-part", dest="part", help="SLURM partition option.", default=False);
parser.add_argument("-tasks", dest="tasks", help="SLURM --ntasks option.", type=int, default=1);
parser.add_argument("-cpus", dest="cpus", help="SLURM --cpus-per-task option.", type=int, default=1);
parser.add_argument("-mem", dest="mem", help="SLURM --mem option.", type=int, default=0);
# SLURM options

args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, spec_abbr, basedirs = globs.get();
# Get all the meta info for the species and sequencing runs.

if not args.name:
    name = mcore.getRandStr();
else:
    name = args.name;
# Get the job name.

step = "01-Fastp";
prev_step = "00-RawReads";
# Step vars

pad = 26
cwd = os.getcwd();
# Job vars

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
# Job files

if not args.part:
    sys.exit( " * ERROR 1: Please specify a SLURM partition (-part) or submit -part none to not generate the submit script.");

if (os.path.isfile(output_file) or os.path.isfile(submit_file)) and not args.overwrite:
    sys.exit( " * ERROR 2: Job and submit files already exist! Explicity specify --overwrite to overwrite them.");

base_outdir = os.path.abspath("../01-Assembly-data/");
step_dir = os.path.join(base_outdir, step);
prev_step_dir = os.path.join(base_outdir, prev_step);

base_logdir = os.path.abspath("logs/");
logdir = os.path.join(base_logdir, step + "-logs");
# Step I/O info.

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
# Parse the input run types.

spec = mfiles.parseSpecs(args.spec, specs_ordered, spec_ids)
# Parse the input species.

##########################
# Reporting run-time info for records.
with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent fastp commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + step, jobfile);
    mcore.PWS(mcore.spacedOut("# Previous step:", pad) + prev_step, jobfile);
    mcore.PWS("# ----------", jobfile);
    mcore.PWS("# I/O INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + prev_step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# fastp path:", pad) + args.path, jobfile);
    mcore.PWS(mcore.spacedOut("# Species:", pad) + args.spec, jobfile);
    mcore.PWS(mcore.spacedOut("# Seq runs:", pad) + args.runtype, jobfile);
    if not args.name:
        mcore.PWS("# -n not specified --> Generating random string for job name", jobfile);
    mcore.PWS(mcore.spacedOut("# Job name:", pad) + name, jobfile);
    mcore.PWS(mcore.spacedOut("# Logfile directory:", pad) + logdir, jobfile);
    if not os.path.isdir(logdir):
        mcore.PWS("# Creating logfile directory.", jobfile);
        os.system("mkdir " + logdir);
    mcore.PWS(mcore.spacedOut("# Job file:", pad) + output_file, jobfile);
    mcore.PWS("# ----------", jobfile);
    mcore.PWS("# SLURM OPTIONS", jobfile);
    mcore.PWS(mcore.spacedOut("# Submit file:", pad) + submit_file, jobfile);
    mcore.PWS(mcore.spacedOut("# SLURM partition:", pad) + args.part, jobfile);
    mcore.PWS(mcore.spacedOut("# SLURM ntasks:", pad) + str(args.tasks), jobfile);
    mcore.PWS(mcore.spacedOut("# SLURM cpus-per-task:", pad) + str(args.cpus), jobfile);
    mcore.PWS(mcore.spacedOut("# SLURM mem:", pad) + str(args.mem), jobfile);
    mcore.PWS("# ----------", jobfile);
    mcore.PWS("# BEGIN CMDS", jobfile);

##########################
# Generating the commands in the job file.
    for s in spec:
        if "(no WGA)" in s:
            continue;
        s_mod = s.replace(" ", "-");

        spec_dir = os.path.join(step_dir, s_mod);
        if not os.path.isdir(spec_dir):
            os.system("mkdir " + spec_dir);
        # Make output directory

        fastp_cmds = [];

        for r in runtype:
            run_string = runstrs[r];
            run_dir = os.path.join(spec_dir, run_string);

            base_logfile = os.path.join(logdir, s_mod + "-" + run_string + "-fastp");
            # Get the base logfile name for this run.

            seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir);
            if seqfiles:
                if not os.path.isdir(run_dir):
                    os.system("mkdir " + run_dir);

                fastp_cmds += genFastpCmd(args.path, seqfiles, r, base_logfile, step, prev_step);

            if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
                run_string += "-no-WGA";
                run_dir = os.path.join(spec_dir, run_string);

                seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir);
                if seqfiles:
                    if not os.path.isdir(run_dir):
                        os.system("mkdir " + run_dir);
                    
                    fastp_cmds += genFastpCmd(args.path, seqfiles, r, base_logfile, step, prev_step);

        if fastp_cmds:
            for cmd in sorted(fastp_cmds):
                mcore.PWS(cmd, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, 1, args.tasks, args.cpus, args.mem, output_file)
##########################           