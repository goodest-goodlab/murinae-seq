#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Call variants, filter, and generate consensus
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, globs

############################################################

script_template = '''#!/bin/bash
{var_cmd}
{select_cmd}
{filter_cmd}
{index_cmd}
{consensus_cmd}
'''

############################################################

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for merging many BAM files from BWA for rodent exomes. Dependencies: samtools, picard.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
# parser.add_argument("-ref", dest="ref", help="The reference genome to map to. Leave blank to map to exome assembly. Options: mouse, rat", default=False);
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to bwa. Default: bwa", default="bwa");
parser.add_argument("--overwrite", dest="overwrite", help="If the job and submit files already exist and you wish to overwrite them, set this option.", action="store_true", default=False);
# IO options

parser.add_argument("-part", dest="part", help="SLURM partition option.", default=False);
parser.add_argument("-nodes", dest="tasks", help="SLURM --nodes option.", type=int, default=1);
parser.add_argument("-tasks", dest="tasks", help="SLURM --ntasks option.", type=int, default=1);
parser.add_argument("-cpus", dest="cpus", help="SLURM --cpus-per-task option.", type=int, default=1);
parser.add_argument("-mem", dest="mem", help="SLURM --mem option.", type=int, default=0);
# SLURM options

args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

# if args.ref and args.ref not in ["mouse", "rat"]:
#     sys.exit( " * ERROR 1: Please specify either mouse or rat for reference, or leave blank to map to exome assembly.");
# if not args.ref:
#     args.ref = "";
# else:
#     args.ref = "-" + args.ref;
# Check -ref option.

if not args.name:
    name = mcore.getRandStr();
else:
    name = args.name;
# Get the job name.

pad = 26
cwd = os.getcwd();
# Job vars

step = "10-Varcall";

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
jobs_dir = os.path.join(cwd, "jobs", "10-Varcall-jobs");
# Job files

if not args.part:
    sys.exit( " * ERROR 1: Please specify a SLURM partition (-part) or submit -part none to not generate the submit script.");

if (os.path.isfile(output_file) or os.path.isfile(submit_file)) and not args.overwrite:
    sys.exit( " * ERROR 2: Job and submit files already exist! Explicity specify --overwrite to overwrite them.");

step_dir = os.path.abspath("../01-Assembly-data/10-Varcall/");
referee_dir = os.path.abspath("../01-Assembly-data/08-Referee/");
remap_dir = os.path.abspath("../01-Assembly-data/09-Remap/");
logdir = os.path.abspath("logs/10-Varcall-logs/");
# Reference options

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
#print(runtype, runstrs);
# Parse the input run types.

specs = mfiles.parseSpecs(args.spec, specs_ordered);
specs = [ s for s in specs if "(no WGA)" not in s and "pos_ctrl" not in s ];
specs = [ s for s in specs if any(r in spec_ids[s] for r in runtype) ];
# Parse the input species.

with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent variant commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# Current step:", pad) + "Variant calling", jobfile);
    mcore.PWS(mcore.spacedOut("# Assembly directory:", pad) + referee_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Map directory:", pad) + remap_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + step_dir, jobfile);
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


        spec_assembly = os.path.join(referee_dir, s_mod, s_mod + "-referee-corrected.fa");
        if ".." in spec_assembly:
            spec_assembly = spec_assembly.replace("..", ".");
        spec_bam = os.path.join(remap_dir, s_mod, s_mod + ".bam");
        if ".." in spec_assembly:
            spec_assembly = spec_assembly.replace("..", ".");

        assert os.path.isfile(spec_assembly), "\nCannot find assembly file: " + spec_assembly;
        assert os.path.isfile(spec_assembly), "\nCannot find BAM file: " + spec_bam;
        # Get base file names.

        spec_out_dir = os.path.join(step_dir, s_mod);
        if not os.path.isdir(spec_out_dir):
            os.system("mkdir " + spec_out_dir);
        #logfile = os.path.join(logdir, s_mod + "-pseudoit.log");

        job_script = os.path.join(jobs_dir, s_mod + "-varcall.sh");

        vcf_file = os.path.join(spec_out_dir, s_mod + ".vcf");
        gatk_log = os.path.join(logdir, s_mod + "-haplotypecaller.log");
        gatk_cmd = "gatk HaplotypeCaller -R " + spec_assembly + " -I " + spec_bam + " -stand-call-conf 30 --native-pair-hmm-threads " + str(args.cpus) + " -O " + vcf_file + " &> " + gatk_log;

        snps_file = os.path.join(spec_out_dir, s_mod + ".snps.vcf");
        snps_log = os.path.join(logdir, s_mod + "-selectsnps.log");
        snps_cmd = "gatk SelectVariants -V " + vcf_file + " -O " + snps_file + " -select-type SNP -xl-select-type MIXED -xl-select-type SYMBOLIC &> " + snps_log;

        filter_file = os.path.join(spec_out_dir, s_mod + ".snps.filter.vcf");
        filter_log = os.path.join(logdir, s_mod + "-filter.log");
        filter_cmd = "bcftools filter -m+ -e \"MQ < 30.0 || DP < 5 || DP > 60\" -e 'ALT=\"*\"' -s Filter --threads " + str(args.cpus) + " -Oz -o " + filter_file + " " + snps_file + " &> " + filter_log;

        index_cmd = "tabix " + filter_file;

        consensus_file = os.path.join(spec_out_dir, s_mod + "-iupac-consensus.fa");
        consensus_log = os.path.join(logdir, s_mod + "-consensus.log");
        consensus_cmd = "bcftools consensus -f " + spec_assembly + " -o " + consensus_file + " -I -e \"FILTER='Filter'\" " + filter_file + " &> " + consensus_log;

        with open(job_script, "w") as outfile:
            outfile.write(script_template.format(var_cmd=gatk_cmd, select_cmd=snps_cmd, filter_cmd=filter_cmd, index_cmd=index_cmd, consensus_cmd=consensus_cmd));
        # Write the script for this species.

        os.system("chmod +x " + job_script);

        mcore.PWS("source " + job_script, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, 1, args.tasks, args.cpus, args.mem, output_file)
##########################