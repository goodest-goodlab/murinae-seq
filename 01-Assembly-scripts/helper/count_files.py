#!/usr/bin/python3
############################################################
# For rodent exomes, 01.2020
# Count files by species to get expected number of outputs
############################################################

import sys, os, argparse, core, lib.globs as globs, lib.resort as resort
from datetime import datetime

############################################################

core.runTime("# Count read files");

parser = argparse.ArgumentParser(description="Count read files by species");
parser.add_argument("-i", dest="input", help="A directory structured as <genus-species>/<run-type>/<fastq files>", default=False);
args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, spec_abbr, basedirs = globs.get();
if not os.path.isdir(args.input):
    sys.exit(core.errorOut("RC1", "Cannot find specified input directory (-i)"));


specdirs = os.listdir(args.input);
spec_counts = { s : [0,0] for s in specdirs };

for spec in specdirs:
    count = 0;
    specdir = os.path.join(args.input, spec);
    rundirs = os.listdir(specdir);
    for run in rundirs:
        rundir = os.path.join(specdir, run);
        readfiles = os.listdir(rundir);

        if "single" in run:
            spec_counts[spec][0] += len(readfiles);
        else:
            spec_counts[spec][1] += len(readfiles);

resort.resortFile(f=False, i=spec_counts);