#!/usr/bin/python3
############################################################
# For rodent exomes, 05.2020
# cat all read files from a given sample
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, globs

############################################################
# Functions
def getLibs(s, r, run_string, library_num, prev_dir):
    indir = os.path.join(prev_dir, s, run_string);
    cur_libs = {}

    if not os.path.isdir(indir):
        return False, library_num;

    seqfiles = [ f for f in os.listdir(indir) if ".fastq.gz" in f ];

    if r in [0,1]:
        if s == "Praomys-degraaffi":
            return False, library_num;

        library_num += 1;
        seqfiles = [ os.path.join(indir, f) for f in seqfiles ];
        cur_libs[library_num] = ['single', seqfiles];

    elif r in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
        seqfiles = mfiles.pairUp(seqfiles, indir, unmerged_flag=True);
        for f in seqfiles:
            if ";" in f:
                merged_f = f.split(";")[0].replace("_R2_", "_R1_").replace("_R1_", "_").replace(".unmerged", ".merged");

                library_num += 1;
                cur_libs[library_num] = ['paired', [merged_f, f]];

    return cur_libs, library_num;

########################

def genCatCmds(seqlibs, single_out, paired1_out, paired2_out, merged_out):
    single_cmd = "zcat ";
    paired1_cmd = "zcat ";
    paired2_cmd = "zcat ";
    merged_cmd = "zcat ";

    single_flag = False;

    for l in seqlibs:
        print(seqlibs[l]);
        if seqlibs[l][0] == 'single':
            for f in seqlibs[l][1]:
                single_cmd += f + " ";
                single_flag = True;
        elif seqlibs[l][0] == 'paired':
            paired_f = seqlibs[l][1][1].split(";");
            paired1_cmd += paired_f[0] + " ";
            paired2_cmd += paired_f[1] + " ";
            merged_cmd += seqlibs[l][1][0] + " ";

    single_cmd += "| gzip > " + single_out;
    paired1_cmd += "| gzip > " + paired1_out;
    paired2_cmd += "| gzip > " + paired2_out;
    merged_cmd += "| gzip > " + merged_out;

    if single_flag:
        return [single_cmd, paired1_cmd, paired2_cmd, merged_cmd];
    else:
        return [paired1_cmd, paired2_cmd, merged_cmd];

############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates cat commands for merging fastq files for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
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

step = "04-Cat-fastq";
prev_step = "03-Merged";
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
    mcore.runTime("#!/bin/bash\n# Rodent read cat commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + step, jobfile);
    mcore.PWS(mcore.spacedOut("# Previous step:", pad) + prev_step, jobfile);
    mcore.PWS("# ----------", jobfile);
    mcore.PWS("# I/O INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + prev_step_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + step_dir, jobfile);
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

##########################
# Generating the commands in the job file.
    i = 1;
    for s in spec:
        if "(no WGA)" in s:
            continue;

        libraries = {};
        library_num = 0;
        s_mod = s.replace(" ", "-");
        #print(s_mod);

        spec_dir = os.path.join(step_dir, s_mod);
        if not os.path.isdir(spec_dir):
            os.system("mkdir " + spec_dir);

        logfile = os.path.join(logdir, s_mod + "-cat-fastq.log");
        # Make output directory and logfile

        single_out = os.path.join(spec_dir, s_mod + "-single.fq.gz");
        paired1_out = os.path.join(spec_dir, s_mod + "-paired-1.fq.gz");
        paired2_out = os.path.join(spec_dir, s_mod + "-paired-2.fq.gz");
        merged_out = os.path.join(spec_dir, s_mod + "-merged.fq.gz");

        for r in runtype:
            run_string = runstrs[r];
            #print(run_string);
            cur_libs, library_num = getLibs(s_mod, r, run_string, library_num, prev_step_dir);
            if cur_libs:
                libraries.update(cur_libs);

            if s_mod in ["Rattus-exulans", "Rattus-hoffmanni"]:
                run_string += "-no-WGA"
                cur_libs, library_num = getLibs(s_mod, r, run_string, library_num, prev_step_dir);
                if cur_libs:
                    libraries.update(cur_libs);

        if libraries:
            cat_cmds = genCatCmds(libraries, single_out, paired1_out, paired2_out, merged_out);

            for cmd in cat_cmds:
                mcore.PWS(cmd, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
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


