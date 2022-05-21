#!/usr/bin/python3
############################################################
# For rodent exomes, 01.2020
# Compile the depth statistics
############################################################

import sys, os, argparse, core, lib.globs as globs, lib.resort as resort
from datetime import datetime

############################################################

core.runTime("# Rodent depth");

parser = argparse.ArgumentParser(description="Generates commands for BWA for rodent exomes.");
parser.add_argument("-s", dest="spec", help="A species to lookup", default="all");
parser.add_argument("-ref", dest="ref", help="One of rat, mouse, or mouse-targets", default="mouse");
args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, spec_abbr, basedirs = globs.get();

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
    targetfile = "/scratch/gregg_thomas/Murinae-seq/data/mouse-target-depth.csv"
    tilefile = "/scratch/gregg_thomas/Murinae-seq/data/mouse-tile-depth.csv"
    mapfile = "/scratch/gregg_thomas/Murinae-seq/data/mouse-mapped.csv"
elif args.ref == 'rat':
    indir = "/scratch/gregg_thomas/Murinae-seq/03B-MappedRat/";
    targetfile = "/scratch/gregg_thomas/Murinae-seq/data/rat-target-depth.csv"
    tilefile = "/scratch/gregg_thomas/Murinae-seq/data/rat-tile-depth.csv"
    mapfile = "/scratch/gregg_thomas/Murinae-seq/data/rat-mapped.csv"
# Reference options

with open(targetfile, "w") as otarg, open(tilefile, "w") as otile, open(mapfile, "w") as omap:
    for s in spec:
        s_mod = s.replace(" ", "-");
        
        if "(no-WGA)" in s_mod:
            continue;
        # Skip those two.

        specdir = os.path.join(indir, s_mod);
        intarg = os.path.join(specdir, s_mod + "-avg-target-depth.txt");
        if args.ref == 'mouse':
            intile = os.path.join(specdir, s_mod + "-avg-tile-depth.txt");
        flagfile = os.path.join(specdir, s_mod + "-flagstats.txt");

        otarg.write(s_mod + "," + open(intarg, "r").read());
        if args.ref == 'mouse':
            otile.write(s_mod + "," + open(intile, "r").read());
        omap.write(s_mod + "," + open(flagfile, "r").readlines()[3].strip().split(" ")[0] + "\n");


print("Resorting output...");
resort.resortFile(targetfile);
if args.ref == 'mouse':
    resort.resortFile(tilefile);
resort.resortFile(mapfile);

print("Done!");