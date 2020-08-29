#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Run bbsplit.sh on all read files from a given sample and 
# sequencing run for decontamination.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, globs

############################################################
# Functions
def genDeconCmd(decon_path, sfiles, r, baselogfile, step, prev_step):
    decondir = os.path.abspath("../01-Assembly-data/Contamination_Genomes/");
    cmd_list = [];
    cmd_num = 0;
    for f in sfiles:
        if not f.endswith(".fastq.gz"):
            sys.exit(" * ERROR: Invalid file extension: " + f);

        if r in [0,1]:
            outfile = f.replace(prev_step, step).replace(".fastq.gz", ".decon.fastq.gz");

            decon_cmd = decon_path + " -Xmx15g t=1 in=" + f + " ref=" + decondir + " path=" + decondir + " minid=0.99 outu=" + outfile;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            decon_cmd += " &> " + logfile;
            cmd_list.append(decon_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14,15]:
            f = f.split(";");
            outfile1 = f[0].replace(prev_step, step).replace(".fastq.gz", ".decon.fastq.gz");
            outfile2 = f[1].replace(prev_step, step).replace(".fastq.gz", ".decon.fastq.gz");

            decon_cmd = decon_path + " -Xmx15g t=1 in1=" + f[0] + " in2=" + f[1] + " ref=" + decondir + " path=" + decondir + " minid=0.99 outu1=" + outfile1 + " outu2=" + outfile2;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            decon_cmd += " &> " + logfile;
            cmd_list.append(decon_cmd);
        # Paired end runs 

    return cmd_list;
############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for read decontamination with bbsplit after decontamination for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to bbsplit.sh. Default: bbsplit.sh", default="bbsplit.sh");
parser.add_argument("--overwrite", dest="overwrite", help="If the job and submit files already exist and you wish to overwrite them, set this option.", action="store_true", default=False);
# IO options

parser.add_argument("-part", dest="part", help="SLURM partition option.", default=False);
parser.add_argument("-tasks", dest="tasks", help="SLURM --ntasks option.", type=int, default=1);
parser.add_argument("-cpus", dest="cpus", help="SLURM --cpus-per-task option.", type=int, default=1);
parser.add_argument("-mem", dest="mem", help="SLURM --mem option.", type=int, default=0);
# SLURM options

args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

if not args.name:
    name = mcore.getRandStr();
else:
    name = args.name;
# Get the job name.

step = "02-Decon";
prev_step = "01-Fastp";
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

spec = mfiles.parseSpecs(args.spec, specs_ordered)
# Parse the input species.

##########################
# Reporting run-time info for records.

with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent decon commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + step, jobfile);
    mcore.PWS(mcore.spacedOut("# Previous step:", pad) + prev_step, jobfile);
    mcore.PWS("# ----------", jobfile);
    mcore.PWS("# I/O INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + prev_step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# bbmerge.sh path:", pad) + args.path, jobfile);
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

        if any(runs in spec_ids[s] for runs in [11,12,13,14]):
            continue;
        # Skip the Australian samples

        #print(s_mod);

        spec_dir = os.path.join(step_dir, s_mod);
        if not os.path.isdir(spec_dir):
            os.system("mkdir " + spec_dir);
        # Make output directory

        decon_cmds = [];

        for run_ind in range(len(runtype)):
            r = runtype[run_ind];
            run_string = runstrs[run_ind];
            run_dir = os.path.join(spec_dir, run_string);

            base_logfile = os.path.join(logdir, s_mod + "-" + run_string + "-decon");
            # Get the base logfile name for this run.

            seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir);
            if seqfiles:
                if not os.path.isdir(run_dir):
                    os.system("mkdir " + run_dir);

                decon_cmds += genDeconCmd(args.path, seqfiles, r, base_logfile, step, prev_step);

            if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
                run_string += "-no-WGA";
                run_dir = os.path.join(spec_dir, run_string);

                seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir);
                if seqfiles:
                    if not os.path.isdir(run_dir):
                        os.system("mkdir " + run_dir);

                    decon_cmds += genDeconCmd(args.path, seqfiles, r, base_logfile, step, prev_step);

        if decon_cmds:
            for cmd in sorted(decon_cmds):
                mcore.PWS(cmd, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, 1, args.tasks, args.cpus, args.mem, output_file)
##########################           