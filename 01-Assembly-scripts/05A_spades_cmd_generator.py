#!/usr/bin/python3
############################################################
# For rodent exomes, 12.2019
# Run SPADES on all read files from a given sample and 
# sequencing run.
############################################################

import sys, os, argparse, core, lib.globs as globs
from datetime import datetime

############################################################

def getFiles(s, r, run_string, library_num, prev_dir):
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
        seqfiles = pairUp(seqfiles, indir);
        for f in seqfiles:
            if ";" in f:
                merged_f = f.split(";")[0].replace("_R2_", "_R1_").replace("_R1_", "_").replace(".unmerged", ".merged");

                library_num += 1;
                cur_libs[library_num] = ['paired', [merged_f, f]];


    return cur_libs, library_num;

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

def genSpadesCmd(seqlibs, k, outdir, logfile):
    spades_cmd = "time -p spades.py -o " + outdir + " -k " + k + " --careful";

    for l in seqlibs:
        if seqlibs[l][0] == 'single':
            for f in seqlibs[l][1]:
                spades_cmd += " --s" + str(l) + " " + f;
        elif seqlibs[l][0] == 'paired':
            paired_f = seqlibs[l][1][1].split(";");
            spades_cmd += " --pe" + str(l) + "-m " + seqlibs[l][1][0];
            spades_cmd += " --pe" + str(l) + "-1 " + paired_f[0];
            spades_cmd += " --pe" + str(l) + "-2 " + paired_f[1];

    spades_cmd += " &> " + logfile;

    return spades_cmd;

    # pe, pe_count, pe_keys = {}, 0, [];
    # se, se_count, se_keys = {}, 0, [];

    # for f in sfiles:
    #     if ";" in f:
    #         f = f.split(";");
    #         pe_count += 1;
    #         pe_str = "pe" + str(pe_count) + "-";
    #         pe_key1 = pe_str + "1";
    #         pe_key2 = pe_str + "2";

    #         pe[pe_key1] = f[0];
    #         pe[pe_key2] = f[1];
    #         pe_keys += pe_key1, pe_key2;
           
    #     else:
    #         se_count += 1;
    #         se_key = "s" + str(se_count);
    #         se[se_key] = f;
    #         se_keys.append(se_key);
    # # Generate all the library strings

    # spades_cmd = "time -p /home/gregg_thomas/bin/spades/bin/spades.py -o " + outdir + " -k 21,33,55,77,99,127 --careful";
    # for pe_key in pe_keys:
    #     spades_cmd += " --" + pe_key + " " + pe[pe_key];
    # for se_key in se_keys:
    #     spades_cmd += " --" + se_key + " " + se[se_key];
    # # Make the command.
    
    # return spades_cmd;

############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for running SPADES for rodent exomes.");
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

step = "05A-Spades";
prev_step = "04A-Dedup";
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
    core.runTime(core.runTime("#!/bin/bash\n# Rodent Spades commands"), jobfile);
    core.PWS("# STEP INFO", jobfile);
    core.PWS(core.spacedOut("# Current step:", pad) + step, jobfile);
    core.PWS(core.spacedOut("# Previous step:", pad) + prev_step, jobfile);
    core.PWS("# ----------", jobfile);
    core.PWS("# I/O INFO", jobfile);
    core.PWS(core.spacedOut("# Input directory:", pad) + prev_step_dir, jobfile);
    core.PWS(core.spacedOut("# Output directory:", pad) + step_dir, jobfile);
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

    hoff_libs = {};
    exul_libs = {};

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

        logfile = os.path.join(logdir, s_mod + "-spades.log");
        # Make output directory and logfile

        for r in runtype:
            run_string = runstrs[r];
            cur_libs, library_num = getFiles(s_mod, r, run_string, library_num, prev_step_dir);
            if cur_libs:
                if r in [0,1,2,3,4]:
                    k = "21,33,55";
                else:
                    k = "21,33,55,77,99,127"
                libraries.update(cur_libs);

            if s_mod in ["Rattus-exulans", "Rattus-hoffmani"]:
                run_string += "-no-WGA"
                cur_libs, library_num = getFiles(s_mod, r, run_string, library_num, prev_step_dir);
                if cur_libs:
                    libraries.update(cur_libs);

        spades_cmd = genSpadesCmd(libraries, k, spec_dir, logfile);

        core.PWS(spades_cmd, jobfile);

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


