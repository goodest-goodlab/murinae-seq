#!/usr/bin/python3
############################################################
# For rodent exomes, 07.2020
# Run pseudo-it on base corrected exomes
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, gzip, globs

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for generating pileup files.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to pseudo-it. Default: /mnt/beegfs/gt156213e/pseudo-it/pseudo_it.py", default="/mnt/beegfs/gt156213e/pseudo-it/pseudo_it.py");
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

seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

if not args.name:
    name = mcore.getRandStr();
else:
    name = args.name;
# Get the job name.

base_outdir = os.path.abspath("../01-Assembly-data/");
step = "10-Pseudoit";
referee_dir = os.path.join(base_outdir, "08-Referee");
remap_dir = = os.path.join(base_outdir, "09-Remap");
pseudoit_dir = os.path.join(base_outdir, "10-Pseudoit");

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

base_logdir = os.path.abspath("logs/");
logdir = os.path.join(base_logdir, step + "-logs");
# Step I/O info.

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
#print(runtype, runstrs);
# Parse the input run types.

specs = mfiles.parseSpecs(args.spec, specs_ordered);
specs = [ s for s in specs if "(no WGA)" not in s and "pos_ctrl" not in s ];
specs = [ s for s in specs if any(r in spec_ids[s] for r in runtype) ];
# Parse the input species.

with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent Referee commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Assembly directory:", pad) + referee_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Map directory:", pad) + remap_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + pseudoit_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Pseudo-it path:", pad) + args.path, jobfile);
    mcore.PWS(mcore.spacedOut("# Species:", pad) + str(args.spec), jobfile);
    mcore.PWS(mcore.spacedOut("# Run types:", pad) + str(args.runtype), jobfile);
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

##########################
# Generating the commands in the job file.
    for s in specs:
        s_mod = s.replace(" ", "-");

        spec_assembly = os.path.join(referee_dir, s_mod, s_mod + "-referee-corrected.fa");
        if ".." in spec_assembly:
            spec_assembly = spec_assembly.replace("..", ".");
        spec_bam = os.path.join(remap_dir, s_mod, s_mod + ".bam");
        if ".." in spec_assembly:
            spec_assembly = spec_assembly.replace("..", ".");

        assert os.path.isfile(spec_assembly), "\nCannot find assembly file: " + spec_assembly;
        assert os.path.isfile(spec_assembly), "\nCannot find BAM file: " + spec_bam;

        spec_out_dir = os.path.join(pseudoit_dir, s_mod);
        if not os.path.isdir(spec_out_dir):
            os.system("mkdir " + spec_out_dir);
        spec_prefix = s_mod + "-referee";
        logfile = os.path.join(logdir, s_mod + "-pseudoit.log");

        #pileup_cmd = args.path + " mpileup -d 999999999 -f " + spec_assembly + " -Q 0 -s -B -o " + spec_out + " " + spec_bam + " &> " + logfile;

        pi_cmd = "python " + args.path + " -ref " + spec_assembly + " -bam " + spec_bam + " --diploid -i 1 -p 32 -o " + spec_out_dir + " -tmp 'tmp-pi-out' &> " + logfile;

        mcore.PWS(pi_cmd, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, args.nodes, args.tasks, args.cpus, args.mem, output_file)
##########################