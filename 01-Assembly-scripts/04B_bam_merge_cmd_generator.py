#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Run BWA on all read files from a given sample and 
# sequencing run.
############################################################

import sys, os, argparse, core, lib.globs as globs
from datetime import datetime

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

core.runTime("#!/bin/bash\n# Rodent BWA commands");

parser = argparse.ArgumentParser(description="Generates commands for BWA for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to lookup", default="all");
parser.add_argument("-ref", dest="ref", help="One of rat, mouse, or mouse-targets", default="mouse");
parser.add_argument("--c", dest="carnation", help="Set this option if running on Carnation.", action="store_true", default=False);
args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, spec_abbr, basedirs = globs.get();

if args.carnation:
    basedirs = ["/nfs/musculus" + d for d in basedirs];

if args.spec == "all":
    spec = specs_ordered;
else:
    spec = args.spec.replace(", ", ",").split(",");
    for s in spec:
        if s not in spec_ids:
            sys.exit(core.errorOut("SF2", "Cannot find specified species: " + s));
# Parse the input species.

args.ref = args.ref.lower()
if args.ref not in ['rat','mouse']:
    sys.exit(core.errorOut("M1", "-ref must be one of either 'rat' or 'mouse'."));
if args.ref == 'mouse':
    indir = "/scratch/gregg_thomas/Murinae-seq/03B-MappedMouse/";
    log_outdir = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedMouse-post-logs/";
    target_file = "/scratch/gregg_thomas/Murinae-seq/Targets/targets-mm10-coords.bed";
    tile_file = "/scratch/gregg_thomas/Murinae-seq/Targets/tiles-mm10-coords.bed";
elif args.ref == 'rat':
    indir = "/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/";
    log_outdir = "/scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/";
    target_file = "/scratch/gregg_thomas/Murinae-seq/Targets/targets-rnor6-coords.bed";
    tile_file = "/scratch/gregg_thomas/Murinae-seq/Targets/tiles-rnor6-coords.bed";
# Reference options

total_bam = 0;
for s in spec:
    s_mod = s.replace(" ", "-");
    
    if "(no-WGA)" in s_mod:
        continue;
    # Skip those two.

    job_script = os.path.join("/scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/", s_mod + "-" + args.ref + ".sh");
    logfile = os.path.join(log_outdir, s_mod + "-" + args.ref + ".log");
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

    print("source " + job_script + " &> " + logfile);

    #sys.exit();