#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Run bbmerge.sh on all read files from a given sample and 
# sequencing run.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, globs

############################################################
# Functions
def genMergeCmd(merge_path, sfiles, r, baselogfile, step, prev_step, cmd_list):
    if r in [0,1,2,3,4]:
        k = "40";
    else:
        k = "60";

    for f in sfiles:
        if r in [0,1]:
            fout = f.replace(prev_step, step).replace(".fastq.gz", ".merged.fastq.gz");

            cmd_num = len(cmd_list) + 1;
            cp_cmd = "cp " + f + " " + fout;
            logfile = baselogfile.replace("-merge", "-cp") + "-" + str(cmd_num) + ".log";
            cp_cmd += " &> " + logfile;     
            cmd_list.append(cp_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14,15]:
            f = f.split(";");
            outdir = os.path.dirname(f[0]).replace(prev_step, step);
            basefile = os.path.splitext(os.path.basename(f[0]))[0].replace("fastq","");
            mergefile = os.path.join(outdir, basefile.replace("_R1_", "_") + "merged.fastq.gz");
            unmerged1 = os.path.join(outdir, basefile + "unmerged.fastq.gz");
            unmerged2 = os.path.join(outdir, basefile.replace("_R1_", "_R2_") + "unmerged.fastq.gz");

            merge_cmd = merge_path + " -Xmx15g t=1 in1=" + f[0] + " in2=" + f[1] + " verystrict=t rem k=" + k + " extend2=" + k +" ecct outu1=" + unmerged1 + " outu2=" + unmerged2 + " out=" + mergefile;
            cmd_num = len(cmd_list) + 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            merge_cmd += " &> " + logfile;
            cmd_list.append(merge_cmd);
        # Paired end runs 

    return cmd_list;
############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for read merging with bbmerge after decontamination for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run(s) to generate commands for. Default: all.", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to bbmerge.sh. Default: bbmerge.sh", default="bbmerge.sh");
parser.add_argument("--overwrite", dest="overwrite", help="If the job and submit files already exist and you wish to overwrite them, set this option.", action="store_true", default=False);
# IO options

parser.add_argument("-part", dest="part", help="SLURM partition option.", default=False);
parser.add_argument("-nodes", dest="nodes", help="SLURM --nodes option.", type=int, default=1);
parser.add_argument("-tasks", dest="tasks", help="SLURM --ntasks option.", type=int, default=1);
parser.add_argument("-cpus", dest="cpus", help="SLURM --cpus-per-task option.", type=int, default=1);
parser.add_argument("-mem", dest="mem", help="SLURM --mem option.", type=int, default=0);
# SLURM options

args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, = globs.get();
# Get all the meta info for the species and sequencing runs.

if not args.name:
    name = mcore.getRandStr();
else:
    name = args.name;
# Get the job name.

step = "03-Merged";
prev_step = "02-Decon";
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
    mcore.runTime("#!/bin/bash\n# Rodent merge commands", jobfile);
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

        spec_dir = os.path.join(step_dir, s_mod);
        if not os.path.isdir(spec_dir):
            os.system("mkdir " + spec_dir);

        base_logfile = os.path.join(logdir, s_mod + "-merge");
        # Make output directory and logfile

        merge_cmds = [];

        for run_ind in range(len(runtype)):
            r = runtype[run_ind];
            run_string = runstrs[run_ind];
            run_dir = os.path.join(spec_dir, run_string);

            seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir);
            if seqfiles:
                if not os.path.isdir(run_dir):
                    os.system("mkdir " + run_dir);

                merge_cmds = genMergeCmd(args.path, seqfiles, r, base_logfile, step, prev_step, merge_cmds);

            if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
                run_string += "-no-WGA"

                seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir);
                if seqfiles:
                    run_dir = os.path.join(spec_dir, run_string);
                    if not os.path.isdir(run_dir):
                        os.system("mkdir " + run_dir);

                    merge_cmds = genMergeCmd(args.path, seqfiles, r, base_logfile, step, prev_step, merge_cmds);

        if merge_cmds:
            for cmd in sorted(merge_cmds):
                mcore.PWS(cmd, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, args.nodes, args.tasks, args.cpus, args.mem, output_file)
##########################           