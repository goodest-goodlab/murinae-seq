#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Merge BAM files on all read files from a given sample and 
# sequencing run.
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, globs

############################################################

script_template = '''#!/bin/bash
{merge_cmds}
{mkdup_cmds}
{merge_cmd}
{index_cmd}
{depth_cmd}
{samtools_bedcov_cmd}
{stats_cmd}
{flagstat_cmd}
{mosdepth_cmd}
{view_cmd}
{flagstat_cmd_2}
'''

############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for merging many BAM files from BWA for rodent exomes. Dependencies: samtools, picard.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-ref", dest="ref", help="The reference genome to map to. Leave blank to map to exome assembly. Options: mouse, rat", default=False);
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to bwa. Default: bwa", default="bwa");
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

pad = 26
cwd = os.getcwd();
# Job vars

step = "09-Remap";

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
jobs_dir = os.path.join(cwd, "jobs", "09.5-Post-remap-jobs");
# Job files

if not args.part:
    sys.exit( " * ERROR 1: Please specify a SLURM partition (-part) or submit -part none to not generate the submit script.");

if (os.path.isfile(output_file) or os.path.isfile(submit_file)) and not args.overwrite:
    sys.exit( " * ERROR 2: Job and submit files already exist! Explicity specify --overwrite to overwrite them.");

step_dir = os.path.abspath("../01-Assembly-data/09-Remap/");
assembly_dir = os.path.abspath("../01-Assembly-data/08-Referee/");
logdir = os.path.abspath("logs/09.5-Post-remap-logs/");
target_file = os.path.abspath("../Targets/targets-mm10-coords.bed");
target_regions = os.path.abspath("../Targets/targets-mm10-coords.regions");
tile_file = os.path.abspath("../Targets/tiles-mm10-coords.bed");
# Reference options

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
#print(runtype, runstrs);
# Parse the input run types.

specs = mfiles.parseSpecs(args.spec, specs_ordered);
specs = [ s for s in specs if "(no WGA)" not in s and "pos_ctrl" not in s ];
specs = [ s for s in specs if any(r in spec_ids[s] for r in runtype) ];
# Parse the input species.

with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent mapping commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + "BAM merging", jobfile);
    mcore.PWS(mcore.spacedOut("# Input directory:", pad) + step_dir, jobfile);
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
    for s in specs:

        s_mod = s.replace(" ", "-");

        if not any(r in spec_ids[s] for r in runtype):
            continue

        if args.ref == "-mouse":
            ref = "/mnt/beegfs/gt156213e/ref-genomes/mm10/mm10.fa";
        elif args.ref == "-rat":
            ref = "/mnt/beegfs/gt156213e/ref-genomes/rnor6/rn6.fa";
        else:
            ref = os.path.join(assembly_dir, s_mod, s_mod + "-referee-corrected.fa");
        ref = ref.replace("..fa", ".fa");
        assert os.path.isfile(ref), "\nAssembly file not found: " + ref;
        # Get reference

        job_script = os.path.join(jobs_dir, s_mod + "-post-map" + args.ref + ".sh");
        #logfile = os.path.join(logdir, s_mod + "-" + args.ref + ".log");
        # Get base file names.

        specdir = os.path.join(step_dir, s_mod + args.ref);
        tmpdir = os.path.join(specdir, "tmp");
        if not os.path.isdir(tmpdir):
            os.system("mkdir " + tmpdir);

        merge_cmds, mkdup_cmds, i = [], [], 1;
        bamfiles = [];
        for (dirpath, dirnames, filenames) in os.walk(specdir):
            if dirpath == specdir:
                continue;
            run_name = os.path.basename(os.path.normpath(dirpath));
            if run_name == "tmp":
                continue;

            cur_bamfiles = [os.path.join(dirpath, f) for f in filenames if f.endswith(".bam") and ".mkdup." not in f];

            if len(cur_bamfiles) == 1:
                merge_bam = cur_bamfiles[0];
                merge_cmds.append("#");
            else:
                merge_bam = os.path.join(specdir, run_name + ".merge.bam");
                merge_bam = merge_bam.replace("..merge.bam", ".merge.bam");
                merge_log = os.path.join(logdir, s_mod + "-" + run_name + "-merge" + args.ref + ".log");
                merge_cmd = "samtools merge -f " + merge_bam + " " + " ".join(cur_bamfiles) + " &> " + merge_log;
                merge_cmds.append(merge_cmd);
            # Merge BAM files for this run

            mkdup_bam = merge_bam.replace(".bam", ".mkdup.bam");
            mkdup_log = os.path.join(logdir, s_mod + "-" + run_name + "-mkdup" + args.ref + ".log");
            mkdup_metrics = os.path.join(specdir, s_mod + "-" + run_name + "-mkdup-metrics.txt");
            mkdup_cmd = "picard -Xmx10g MarkDuplicates I=" + merge_bam + " TMP_DIR=" + tmpdir + " O=" + mkdup_bam + " M=" + mkdup_metrics + " CREATE_INDEX=true &> " + mkdup_log;
            mkdup_cmds.append(mkdup_cmd);
            # Mark duplicates for this run

            bamfiles.append(mkdup_bam);
            i += 1;

        merge_cmds = "\n".join(merge_cmds);
        mkdup_cmds = "\n".join(mkdup_cmds);

        total_bam += len(bamfiles);
        # Get all .bam files in a species directory and sub-directories (all seq runs).

        # mkdup_cmds, mkdup_bams, i = [], [], 1;
        # for bamfile in bamfiles:
        #     mkdup_bam = bamfile.replace(".bam", ".mkdup.bam");
        #     mkdup_bams.append(mkdup_bam);
        #     mkdup_log = os.path.join(logdir, s_mod + "mkdup-" + str(i) + ".log");
        #     mkdup_cmd = 
    
        #     mkdup_cmds.append(mkdup_cmd);
        #     i += 1;

        if total_bam == 1:
            merge_bam = bamfiles[0];
            merge_cmd = "#";
        else:
            merge_bam = os.path.join(specdir, s_mod + ".bam");
            #merge_bam = merge_bam.replace("..sorted.mkdup.bam", ".sorted.mkdup.bam");
            merge_bam = merge_bam.replace("..bam", ".bam");
            merge_log = os.path.join(logdir, s_mod + "-merge" + args.ref + ".log");
            merge_cmd = "samtools merge -f " + merge_bam + " " + " ".join(bamfiles) + " &> " + merge_log;  
        # Merge all BAM files.

        # mkdup_bam = merge_bam.replace(".bam", ".mkdup.bam");
        # mkdup_metrics = os.path.join(specdir, s_mod + "-mkdup-metrics.txt");
        # mkdup_log = os.path.join(logdir, s_mod + "-mkdup.log");
        # mkdup_cmd = "picard -Xmx10g MarkDuplicates I=" + merge_bam + " TMP_DIR=" + tmpdir + " O=" + mkdup_bam + " M=" + mkdup_metrics + " CREATE_INDEX=true &> " + mkdup_log;
        # Mark duplicates in merged BAM files.

        index_log = os.path.join(logdir, s_mod + "-index" + args.ref + ".log");
        index_cmd = "samtools index " + merge_bam;
        # Index BAM

        depth_file = os.path.join(specdir, s_mod + "-depth.tab");
        if args.ref == "":
            depth_cmd = "samtools depth " + merge_bam + " > " + depth_file;
        else:
            depth_cmd = "samtools depth -b " + target_file + " " + merge_bam + " > " + depth_file;
        # Samtools depth

        if args.ref != "":
            bedcov_file = os.path.join(specdir, s_mod + "-bedcov.tab");
            bedcov_cmd = "samtools bedcov " + target_file + " " + merge_bam + " > " + bedcov_file;
        else:
            bedcov_cmd = "#\n";

        # avg_target_depth = os.path.join(specdir, s_mod + "-avg-target-depth.txt");
        # avg_target_depth_cmd = "awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' " + target_depth + " > " + avg_target_depth;
        # # Get depth of targets.

        # tile_depth = os.path.join(specdir, s_mod + "-tile-depth.tab");
        # tile_depth_cmd = "samtools depth -b " + tile_file + " " + mkdup_bam + " > " + tile_depth;

        # avg_tile_depth = os.path.join(specdir, s_mod + "-avg-tile-depth.txt");
        # avg_tile_depth_cmd = "awk '{ sum += $3; n++ } END { if (n > 0) print sum / n; }' " + tile_depth + " > " + avg_tile_depth;
        # Get depth of tiles.

        stats_out = os.path.join(specdir, s_mod + "-stats.txt");
        
        stats_cmd = "samtools stats -d -r " + ref + " " + merge_bam + " > " + stats_out;
        # Calculate stats

        flagstat_out = os.path.join(specdir, s_mod + "-flagstats.txt");
        flagstat_cmd = "samtools flagstat " + merge_bam + " > " + flagstat_out;
        # Calculate flagstats.

        out_prefix = os.path.join(specdir, s_mod);
        mosdepth_log = os.path.join(logdir, s_mod + "-mosdepth" + args.ref + ".log");
        if args.ref == "":
            mosdepth_cmd = "mosdepth -x " + out_prefix + " " + merge_bam + " &> " + mosdepth_log;
        else:
            mosdepth_cmd = "mosdepth -x -b " + target_file + " " + out_prefix + " " + merge_bam + " &> " + mosdepth_log;
        # Mosdepth

        if args.ref != "":
            target_bam_file = os.path.join(specdir, s_mod + "-targets.bam");
            view_cmd = "samtools view -bh " + merge_bam + " -L " + target_file + " > " + target_bam_file;

            target_flagstat_out = os.path.join(specdir, s_mod + "-targets-flagstats.txt");
            flagstat_cmd_2 = "samtools flagstat " + target_bam_file + " > " + target_flagstat_out;
        else:
            view_cmd = "#\n";
            flagstat_cmd_2 = "#\n";


        with open(job_script, "w") as outfile:
            outfile.write(script_template.format(merge_cmds=merge_cmds, mkdup_cmds=mkdup_cmds, merge_cmd=merge_cmd, index_cmd=index_cmd, depth_cmd=depth_cmd, samtools_bedcov_cmd=bedcov_cmd, stats_cmd=stats_cmd, flagstat_cmd=flagstat_cmd, mosdepth_cmd=mosdepth_cmd, view_cmd=view_cmd, flagstat_cmd_2=flagstat_cmd_2));
        # Write the script for this species.

        os.system("chmod +x " + job_script);

        mcore.PWS("source " + job_script, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, 1, args.tasks, args.cpus, args.mem, output_file)
##########################