#!/usr/bin/python3
############################################################
# For rodent exomes, 12.2019
# Run SPADES on all read files from a given sample and 
# sequencing run.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, globs

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for running SPADES for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to spades. Default: spades.py", default="spades.py");
parser.add_argument("--overwrite", dest="overwrite", help="If the job and submit files already exist and you wish to overwrite them, set this option.", action="store_true", default=False);
# IO options

parser.add_argument("-part", dest="part", help="SLURM partition option.", default=False);
parser.add_argument("-nodes", dest="nodes", help="SLURM --ntasks option.", type=int, default=1);
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

step = "05-Spades";
prev_step = "04-Cat-fastq";
# Step vars

pad = 26
cwd = os.getcwd();
# Job vars

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
# Job files

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
    mcore.runTime("#!/bin/bash\n# Rodent Spades commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + step, jobfile);
    mcore.PWS(mcore.spacedOut("# Previous step:", pad) + prev_step, jobfile);
    mcore.PWS("# ----------", jobfile);
    mcore.PWS("# I/O INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + prev_step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Spades path:", pad) + args.path, jobfile);
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
    # mcore.PWS("# ----------", jobfile);
    # mcore.PWS("# SLURM OPTIONS", jobfile);
    # mcore.PWS(mcore.spacedOut("# Submit file:", pad) + submit_file, jobfile);
    # mcore.PWS(mcore.spacedOut("# SLURM partition:", pad) + args.part, jobfile);
    # mcore.PWS(mcore.spacedOut("# SLURM nodes:", pad) + str(args.nodes), jobfile);
    # mcore.PWS(mcore.spacedOut("# SLURM ntasks:", pad) + str(args.tasks), jobfile);
    # mcore.PWS(mcore.spacedOut("# SLURM cpus-per-task:", pad) + str(args.cpus), jobfile);
    # mcore.PWS(mcore.spacedOut("# SLURM mem:", pad) + str(args.mem), jobfile);
    mcore.PWS("# ----------", jobfile);
    mcore.PWS("# BEGIN CMDS", jobfile);

##########################
# Generating the commands in the job file.

    spades_cmds = [];

    i = 1;
    for s in spec:
        if "(no WGA)" in s:
            continue;

        if "pos_ctrl" in s:
            continue;

        s_mod = s.replace(" ", "-");
        #print(s_mod);

        # if any(runs in spec_ids[s] for runs in [11,12,13,14]):
        #     continue;
        # Skip the Australian samples

        if not any(runs in spec_ids[s] for runs in runtype):
            continue;
        # Skip samples that don't have reads for the specified run.

        #print(s_mod);

        spec_indir = os.path.join(prev_step_dir, s_mod);

        spec_outdir = os.path.join(step_dir, s_mod);
        if not os.path.isdir(spec_outdir):
            os.system("mkdir " + spec_outdir);

        logfile = os.path.join(logdir, s_mod + "-spades.log");
        # Make output directory and logfile

        merged, paired1, paired2, single = False,False,False,False;
        cur_files = os.listdir(spec_indir);
        for f in cur_files:
            #print(f);
            if "merged" in f:
                merged = os.path.join(spec_indir, f);
            if "paired-1" in f:
                paired1 = os.path.join(spec_indir, f);
            if "paired-2" in f:
                paired2 = os.path.join(spec_indir, f);
            if "single" in f:
                single = os.path.join(spec_indir, f);

        if any(lib for lib in [merged, paired1, paired2, single]):
            k = "21,33,55,77,99,127";

            spades_cmd = "time -p " + args.path + " -o " + spec_outdir + " -k " + k + " --careful";
            if single:
                spades_cmd += " --s1 " + single;
            if paired1:
                spades_cmd += " --pe1-1 " + paired1;
                spades_cmd += " --pe1-2 " + paired2;
            if merged:
                spades_cmd += " --pe1-m " + merged;

            spades_cmd += " &> " + logfile;

            spades_cmds.append(spades_cmd);
            #mcore.PWS(spades_cmd, jobfile);

reincar_cmds = spades_cmds[:6];
spades_cmds = spades_cmds[6:];
spades_cmds = list(mcore.chunks(spades_cmds, 3));
spades_cmds.insert(0, reincar_cmds);
#print(len(spades_cmds));

for i in range(len(spades_cmds)):
    file_num = str(i+1);
    cur_name = args.name + "_" + file_num;
    if i == 0:
        cur_jobfile = os.path.abspath("jobs/" + args.name + "_" + file_num + ".sh");
        cur_part = "good_lab_reincarnation";
        cur_tasks = "2";

        with open(cur_jobfile, "w") as cj:
            for cmd in spades_cmds[i]:
                cj.write(cmd + "\n");

        cur_cmd = "parallel -j 2 < " + cur_jobfile;
    else:
        cur_part = "good_lab_large_cpu";
        cur_tasks = "1";
        cur_cmd = "\n".join(spades_cmds[i]);

    cur_submitfile = "submit/" + args.name + "_submit_" + file_num + ".sh";
    
    with open(cur_submitfile, "w") as cs:
        submit = '''#!/bin/bash
#SBATCH --job-name={name}
#SBATCH --output={name}-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition={partition}
#SBATCH --nodes=1
#SBATCH --ntasks={tasks}
#SBATCH --cpus-per-task=16
#SBATCH --mem=0

{cmd}'''

        cs.write(submit.format(name=cur_name, partition=cur_part, tasks=cur_tasks, cmd=cur_cmd));

#########################
# Generating the submit script.
# if args.part != "none":
#     with open(submit_file, "w") as sfile:
#         submit = '''#!/bin/bash
# #SBATCH --job-name={name}
# #SBATCH --output={name}-%j.out
# #SBATCH --mail-type=ALL
# #SBATCH --mail-user=gregg.thomas@umontana.edu
# #SBATCH --partition={partition}
# #SBATCH --nodes={nodes}
# #SBATCH --ntasks={tasks}
# #SBATCH --cpus-per-task={cpus}
# #SBATCH --mem={mem}

# parallel -j {tasks} < {output_file}'''

        

#########################


