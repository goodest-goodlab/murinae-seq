#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Merge BAM files on all read files from a given sample and 
# sequencing run.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, globs

############################################################

script_template = '''#!/bin/bash
{merge_cmd}
{mkdup_cmd}
{target_depth_cmd}
{avg_target_depth_cmd}
{tile_depth_cmd}
{avg_tile_depth_cmd}
{flagstat_cmd}
'''

############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for merging many BAM files from BWA for rodent exomes. Dependencies: samtools, picard.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to spades. Default: spades.py", default="spades.py");
parser.add_argument("-ref", dest="ref", help="One of rat, mouse, or mouse-targets", default="mouse");
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

pad = 26
cwd = os.getcwd();
# Job vars

step = "03B-Mapped" + args.ref.title();

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
jobs_dir = os.path.join(cwd, "jobs", "post-map");
# Job files

if not args.part:
    sys.exit( " * ERROR 1: Please specify a SLURM partition (-part) or submit -part none to not generate the submit script.");

if (os.path.isfile(output_file) or os.path.isfile(submit_file)) and not args.overwrite:
    sys.exit( " * ERROR 2: Job and submit files already exist! Explicity specify --overwrite to overwrite them.");

args.ref = args.ref.lower();
if args.ref not in ['mouse', 'rat']:
    sys.exit("* Error 1: -ref must be one of mouse or rat.");
if args.ref == 'mouse':
    indir = "../01-Assembly-data/03B-MappedMouse/";
    logdir = "logs/03B-MappedMouse-post-logs/";
    target_file = "../Targets/targets-mm10-coords.bed";
    tile_file = "../Targets/tiles-mm10-coords.bed";
elif args.ref == 'rat':
    indir = "../01-Assembly-data/03B-MappedRat/";
    logdir = "logs/03B-MappedRat-post-logs/";
    target_file = "../Targets/targets-rnor6-coords.bed";
    tile_file = "../Targets/tiles-rnor6-coords.bed";
# Reference options

if args.spec == "all":
    spec = specs_ordered;
else:
    spec = args.spec.replace(", ", ",").split(",");
    for s in spec:
        if s not in spec_ids:
            sys.exit("SF2", "Cannot find specified species: " + s);
# Parse the input species.

with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent BAM commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + "BAM merging", jobfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + indir, jobfile);
    mcore.PWS(mcore.spacedOut("# Species job directory:", pad) + jobs_dir, jobfile);
    if not os.path.isdir(jobs_dir):
        mcore.PWS("# Creating jobs directory.", jobfile);
        os.system("mkdir " + jobs_dir);
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

    total_bam = 0;
    for s in spec:
        if "(no WGA)" in s:
            continue;
        # Skip those two.

        s_mod = s.replace(" ", "-");

        job_script = os.path.join(jobs_dir, s_mod + "-" + args.ref + ".sh");
        logfile = os.path.join(logdir, s_mod + "-" + args.ref + ".log");
        # Get base file names.

        specdir = os.path.join(indir, s_mod);
        bamfiles = [];
        for (dirpath, dirnames, filenames) in os.walk(specdir):
            if dirpath == specdir:
                continue;
            bamfiles += [os.path.join(dirpath, f) for f in filenames if f.endswith(".bam")];
        total_bam += len(bamfiles);
        # Get all .bam files in a species directory and sub-directories (all seq runs).
    
        merge_bam = os.path.join(specdir, s_mod + ".sorted.bam");
        #merge_cmd = "java -jar ~/bin/picard.jar MergeSamFiles " + " ".join([ "I=" + f for f in bamfiles ]) + " O=" + merge_bam;
        merge_cmd = "samtools merge -r " + merge_bam + " " + " ".join(bamfiles);  
        # Merge all BAM files.

        mkdup_bam = merge_bam.replace(".bam", ".mkdup.bam");
        mkdup_metrics = os.path.join(specdir, s_mod + "-mkdup-metrics.txt");
        mkdup_cmd = "java -jar ~/bin/picard.jar MarkDuplicates I=" + merge_bam + " O=" + mkdup_bam + " M=" + mkdup_metrics
        # Mark duplicates in merged BAM files.

        target_depth = os.path.join(specdir, s_mod + "-target-depth.tab");
        target_depth_cmd = "samtools depth -b " + target_file + " " + mkdup_bam + " > " + target_depth;

        avg_target_depth = os.path.join(specdir, s_mod + "-avg-target-depth.txt");
        avg_target_depth_cmd = "awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' " + target_depth + " > " + avg_target_depth;
        # Get depth of targets.

        tile_depth = os.path.join(specdir, s_mod + "-tile-depth.tab");
        tile_depth_cmd = "samtools depth -b " + tile_file + " " + mkdup_bam + " > " + tile_depth;

        avg_tile_depth = os.path.join(specdir, s_mod + "-avg-tile-depth.txt");
        avg_tile_depth_cmd = "awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' " + tile_depth + " > " + avg_tile_depth;
        # Get depth of tiles.

        flagstat_out = os.path.join(specdir, s_mod + "-flagstats.txt");
        flagstat_cmd = "samtools flagstat " + mkdup_bam + " > " + flagstat_out;
        # Calculate flagstats.

        with open(job_script, "w") as outfile:
            outfile.write(script_template.format(merge_cmd=merge_cmd, mkdup_cmd=mkdup_cmd, target_depth_cmd=target_depth_cmd, avg_target_depth_cmd=avg_target_depth_cmd, tile_depth_cmd=tile_depth_cmd, avg_tile_depth_cmd=avg_tile_depth_cmd, flagstat_cmd=flagstat_cmd));
        # Write the script for this species.

        os.system("chmod +x " + job_script);

        mcore.PWS("source " + job_script + " &> " + logfile, jobfile);

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