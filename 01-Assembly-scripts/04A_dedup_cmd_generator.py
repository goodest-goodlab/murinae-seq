#!/usr/bin/python3
############################################################
# For rodent exomes, 12.2019
# Run dedup.sh on all read files from a given sample and 
# sequencing run.
############################################################

import sys, os, argparse, core, lib.globs as globs
from datetime import datetime

############################################################

def getFiles(s, run_string, prev_dir):
# Get all files for a sequencing run for a given species.
    indir = os.path.join(prev_dir, s, run_string);

    if not os.path.isdir(indir):
        return False;

    seqfiles = [ f for f in os.listdir(indir) if ".fastq.gz" in f ];

    if r in [0,1]:
        seqfiles = [ os.path.join(indir, f) for f in seqfiles ];

    elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
        seqfiles = pairUp(seqfiles, indir);

    return seqfiles;

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

def genDedupCmd(sfiles, r, baselogfile, step, prev_step):
    cmd_list = [];
    cmd_num = 0;
    #print(sfiles);
    for f in sfiles:
        #print(f);
        if r in [0,1]:
            fout = f.replace(prev_step, step).replace(".fastq.gz", ".dedup.fastq.gz");

            dedup_cmd = "dedupe.sh -Xmx30g t=1 in=" + f + " ordered=t overwrite=true minidentity=100 out=" + fout;
            cmd_num += 1;
            logfile = baselogfile + "-" + str(cmd_num) + ".log";
            dedup_cmd += " &> " + logfile;     
            cmd_list.append(dedup_cmd);
        # Single end runs

        elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
            if ".unmerged." in f:
                f = f.split(";");
                fint = f[0].replace("_R2_", "_R1_").replace("_R1_", "_").replace(prev_step, "04A-Reformat");

                dedup_cmd = "dedupe.sh -Xmx30g t=1 in1=" + f[0] + " in2=" + f[1] + " ordered=t overwrite=true minidentity=100 out=" + fint;
                cmd_num += 1;
                logfile = baselogfile + "-" + str(cmd_num) + ".log";
                dedup_cmd += " &> " + logfile;
                cmd_list.append(dedup_cmd);
            # Unmerged reads

            else:
                fout = f.replace(prev_step, step).replace(".fastq.gz", ".dedup.fastq.gz");

                dedup_cmd = "dedupe.sh -Xmx30g t=1 in=" + f + " ordered=t overwrite=true minidentity=100 out=" + fout;
                cmd_num += 1;
                logfile = baselogfile + "-" + str(cmd_num) + ".log";
                dedup_cmd += " &> " + logfile;
                cmd_list.append(dedup_cmd);     
            # Merged reads           
        # Paired end runs 

    return cmd_list;

############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for read reformatting after deduping with bbmap for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to dedup.sh. Default: dedup.sh", default="muscle");
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
    name = core.getRandStr();
else:
    name = args.name;
# Get the job name.

step = "04A-Dedup";
prev_step = "03A-Merged";
# Step vars

pad = 26
cwd = os.getcwd();
# Job vars

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
# Job files

if (os.path.isfile(output_file) or os.path.isfile(submit_file)) and not args.overwrite:
    sys.exit( " * ERROR 1: Job and submit files already exist! Explicity specify --overwrite to overwrite them.");

base_outdir = os.path.abspath("../01-Assembly-data/");
step_dir = os.path.join(base_outdir, step);
prev_step_dir = os.path.join(base_outdir, prev_step);
intermediate_dir = os.path.join(base_outdir, "04A-Reformat");

base_logdir = os.path.abspath("logs/");
logdir = os.path.join(base_logdir, step + "-logs");
# Step I/O info.

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
            sys.exit(" * ERROR SF1: Cannot find specified sequencing run: " + str(r));
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
            sys.exit(" * ERROR SF2: Cannot find specified species: " + s);
# Parse the input species.

##########################
# Reporting run-time info for records.

with open(output_file, "w") as jobfile:
    core.runTime(core.runTime("#!/bin/bash\n# Rodent dedup commands"), jobfile);
    core.PWS("# STEP INFO", jobfile);
    core.PWS(core.spacedOut("# Current step:", pad) + step, jobfile);
    core.PWS(core.spacedOut("# Previous step:", pad) + prev_step, jobfile);
    core.PWS("# ----------", jobfile);
    core.PWS("# I/O INFO", jobfile);
    core.PWS(core.spacedOut("# Input directory:", pad) + prev_step_dir, jobfile);
    core.PWS(core.spacedOut("# Output directory:", pad) + step_dir, jobfile);
    core.PWS(core.spacedOut("# Intermediate reformat directory:", pad) + intermediate_dir, jobfile);
    core.PWS(core.spacedOut("# Species:", pad) + args.spec, jobfile);
    core.PWS(core.spacedOut("# Seq runs:", pad) + args.runtype, jobfile);
    if not args.name:
        core.PWS("# -n not specified --> Generating random string for job name", jobfile);
    core.PWS(core.spacedOut("# Job name:", pad) + name, jobfile);
    core.PWS(core.spacedOut("# Logfile directory:", pad) + logdir, jobfile);
    if not os.path.isdir(logdir):
        core.PWS("# Creating logfile directory.", jobfile);
        os.system("mkdir " + logdir);
    core.PWS(core.spacedOut("# Job file:", pad) + output_file, jobfile);
    core.PWS("# ----------", jobfile);
    core.PWS("# SLURM OPTIONS", jobfile);
    core.PWS(core.spacedOut("# Submit file:", pad) + submit_file, jobfile);
    core.PWS(core.spacedOut("# SLURM partition:", pad) + args.part, jobfile);
    core.PWS(core.spacedOut("# SLURM ntasks:", pad) + str(args.tasks), jobfile);
    core.PWS(core.spacedOut("# SLURM cpus-per-task:", pad) + str(args.cpus), jobfile);
    core.PWS(core.spacedOut("# SLURM mem:", pad) + str(args.mem), jobfile);
    core.PWS("# ----------", jobfile);

##########################
# Generating the commands in the job file.

    i = 1;
    for s in spec:
        if "(no WGA)" in s:
            continue;

        s_mod = s.replace(" ", "-");
        #print(s_mod);

        spec_dir = os.path.join(step_dir, s_mod);
        if not os.path.isdir(spec_dir):
            os.system("mkdir " + spec_dir);

        spec_int_dir = os.path.join(intermediate_dir, s_mod);
        if not os.path.isdir(spec_int_dir):
            os.system("mkdir " + spec_int_dir);
        # Make the output and intermediate directories for this species.

        for r in runtype:
            dedup_cmds = [];
            run_string = runstrs[r];
            #print(run_string);

            base_logfile = os.path.join(logdir, s_mod + "-" + run_string + "-dedup");
            # Get the base logfile name for this run.

            seqfiles = getFiles(s_mod, run_string, prev_step_dir);
            if seqfiles:
                #print(seqfiles);
                run_dir = os.path.join(spec_dir, run_string);
                if not os.path.isdir(run_dir):
                    os.system("mkdir " + run_dir);

                run_int_dir = os.path.join(spec_int_dir, run_string);
                if not os.path.isdir(run_int_dir):
                    os.system("mkdir " + run_int_dir);
                # Make the output and intermediate directories for this run.

                dedup_cmds = genDedupCmd(seqfiles, r, base_logfile, step, prev_step); 

            if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
                run_string += "-no-WGA";
                seqfiles = getFiles(s_mod, run_string, prev_step_dir);
                if seqfiles:
                    run_dir = os.path.join(spec_dir, run_string);
                    if not os.path.isdir(run_dir):
                        os.system("mkdir " + run_dir);

                    run_int_dir = os.path.join(spec_int_dir, run_string);
                    if not os.path.isdir(run_int_dir):
                        os.system("mkdir " + run_int_dir);
                    # Make the output and intermediate directories for this run.

                    dedup_cmds_2 = genDedupCmd(seqfiles, r, base_logfile, step, prev_step);
                    dedup_cmds += dedup_cmds_2;            

            if dedup_cmds:
                for cmd in sorted(dedup_cmds):
                    core.PWS(cmd, jobfile);

##########################
# Generating the submit script.

with open(submit_file, "w") as sfile:
    submit = '''#!/bin/bash
#SBATCH --job-name={name}
#SBATCH --output={name}-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition={partition}
#SBATCH --nodes=1
#SBATCH --ntasks={tasks}
#SBATCH --cpus-per-task={cpus}
#SBATCH --mem={mem}

parallel -j {tasks} < {output_file}'''

    sfile.write(submit.format(name=name, partition=args.part, tasks=args.tasks, cpus=args.cpus, mem=args.mem, output_file=output_file));

##########################