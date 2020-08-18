#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Run BWA on all read files from a given sample and 
# sequencing run.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, gzip, globs

############################################################
# Functions
def genBWACmd(bwa_path, sfiles, r, run_string, spec, outdir, baselogfile, ref):
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

            bwa_cmd = bwa_path + " mem -R '" + read_group + "' " + ref + " " + f + " | samtools view -bh - | samtools sort - -o " + bamfile; 

            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            bwa_cmd += " 2> " + logfile;
            cmd_list.append(bwa_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            basefile = os.path.splitext(os.path.basename(f))[0].replace("_R1_", "_").replace(".fastq", ".bam");
            bamfile = os.path.join(outdir, basefile);

            bwa_cmd = bwa_path + " mem -R '" + read_group + "' " + ref + " " + f_pair + " | samtools view -bh - | samtools sort - -o " + bamfile; 

            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            bwa_cmd += " 2> " + logfile;
            cmd_list.append(bwa_cmd);
        # Paired end runs 

    return cmd_list;
############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for mapping reads with BWA for rodent exomes. Dependencies: samtools, picard.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-ref", dest="ref", help="The reference genome to map to. Leave blank to map to exome assembly. Options: mouse, rat", default=False);
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to BWA. Default: bwa", default="bwa");
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

if args.ref and args.ref not in ["mouse", "rat"]:
    sys.exit( " * ERROR 1: Please specify either mouse or rat for reference, or leave blank to map to exome assembly.");
if not args.ref:
    args.ref = "";
else:
    args.ref = "-" + args.ref;
# Check -ref option.

if not args.name:
    name = mcore.getRandStr();
else:
    name = args.name;
# Get the job name.

step = "06-Map";
prev_step = "03-Merged";
# Step vars

pad = 26
cwd = os.getcwd();
# Job vars

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
# Job files

base_outdir = os.path.abspath("../01-Assembly-data/");
step_dir = os.path.join(base_outdir, step);
prev_step_dir = os.path.join(base_outdir, prev_step);
ref_dir = os.path.abspath("../01-Assembly-data/05-Scaffolds/");

if not args.part:
    sys.exit( " * ERROR 2: Please specify a SLURM partition (-part) or submit -part none to not generate the submit script.");

if (os.path.isfile(output_file) or os.path.isfile(submit_file)) and not args.overwrite:
    sys.exit( " * ERROR 3: Job and submit files already exist! Explicity specify --overwrite to overwrite them.");

base_outdir = os.path.abspath("../01-Assembly-data/");
step_dir = os.path.join(base_outdir, step);
prev_step_dir = os.path.join(base_outdir, prev_step);

base_logdir = os.path.abspath("logs/");
logdir = os.path.join(base_logdir, step + "-logs");
# Step I/O info.

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
print(runtype, runstrs);
# Parse the input run types.

spec = mfiles.parseSpecs(args.spec, specs_ordered, spec_ids)
# Parse the input species.

with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent BWA commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + step, jobfile);
    mcore.PWS(mcore.spacedOut("# Previous step:", pad) + prev_step, jobfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + prev_step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Assembly directory:", pad) + ref_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# BWA path:", pad) + args.path, jobfile);
    mcore.PWS(mcore.spacedOut("# Species:", pad) + args.spec, jobfile);
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
    for s in spec:
        if "(no WGA)" in s or "pos_ctrl" in s:
            continue;
        s_mod = s.replace(" ", "-");
        #print(s_mod);

        spec_dir = os.path.join(step_dir, s_mod + args.ref);
        if not os.path.isdir(spec_dir):
            os.system("mkdir " + spec_dir);

        base_logfile = os.path.join(logdir, s_mod + "-bwa" + args.ref);
        # Make output directory and logfile

        bwa_cmds = [];
        if args.ref == "-mouse":
            ref = "/mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa";
        elif args.ref == "-rat":
            ref = "/mnt/beegfs/gt156213e/ref-genomes/rnor6/rn6.fa";
        else:
            ref = os.path.join(ref_dir, s_mod, s_mod + ".fa");
        ref = ref.replace("..fa", ".fa");
        assert os.path.isfile(ref), "\nAssembly file not found: " + ref;
        # Get reference

        for run_ind in range(len(runtype)):
            r = runtype[run_ind];
            run_string = runstrs[run_ind];
            #print(run_string);
            run_dir = os.path.join(spec_dir, run_string);

            seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir, unmerged_flag=True);
            if seqfiles:
                #print(seqfiles);
                #sys.exit();
                if not os.path.isdir(run_dir):
                    os.system("mkdir " + run_dir);
                bwa_cmds += genBWACmd(args.path, seqfiles, r, run_string, s_mod, run_dir, base_logfile, ref);

            if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
                run_string += "-no-WGA"

                seqfiles = mfiles.getFiles(s_mod, r, run_string, prev_step_dir, unmerged_flag=True);
                if seqfiles:
                    if not os.path.isdir(run_dir):
                        os.system("mkdir " + run_dir);
                    bwa_cmds += genBWACmd(args.path, seqfiles, r, run_string, s_mod, run_dir, base_logfile, ref);

        if bwa_cmds:
            for cmd in sorted(bwa_cmds):
                mcore.PWS(cmd, jobfile);
            #sys.exit();

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, 1, args.tasks, args.cpus, args.mem, output_file)
##########################