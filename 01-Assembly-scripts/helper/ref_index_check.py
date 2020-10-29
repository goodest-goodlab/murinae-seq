#!/usr/bin/python3
############################################################
# For rodent exomes, 09.2019
# Compare the indices from referee to the originals to make
# sure there's no funny business goin on here, see.
############################################################

import sys
sys.path.append("../../lib/");
# Add the repo's lib dir to the path.

import sys, os, argparse, mcore, globs, mfiles, subprocess

############################################################

parser = argparse.ArgumentParser(description="Gets stats from a bunch of spades assemblies.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
#parser.add_argument("-p", dest="procs", help="The number of species to count at once. Default: 1", type=int, default=1);
#parser.add_argument("--filecheck", dest="file_check", help="Set to simply check if all the files exist for each species.", action="store_true");
args = parser.parse_args();
# Input options.

# if args.procs < 1:
#     sys.exit("* ERROR: -p must be a postive integer.");

seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

assembly_dir = "../../01-Assembly-data/05-Scaffolds/";
# map_dir = "../../01-Assembly-data/06-Map/";
ref_dir = "../../01-Assembly-data/08-Referee/";
# target_file = os.path.abspath("../../Targets/targets-mm10-coords.bed");
# outfilename = "spades-stats.csv";
# pad = 30;

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
# Parse the input run types.

specs = mfiles.parseSpecs(args.spec, specs_ordered)
specs = [ s for s in specs if "(no WGA)" not in s and "pos_ctrl" not in s ];
specs = [ s for s in specs if any(r in spec_ids[s] for r in runtype) ];
# Parse the input species.

i = 1;
for spec in specs:
    print(str(i) + " " + spec);
    i += 1;
    s_mod = spec.replace(" ", "-");

    orig_ind = os.path.join(assembly_dir, s_mod, s_mod + ".fa.fai");
    orig_ind = orig_ind.replace("..fa.fai", ".fa.fai");
    assert os.path.isfile(orig_ind), "\nCANNOT FIND FILE: " + orig_ind + "\n";
    ref_ind = os.path.join(ref_dir, s_mod, s_mod + "-referee-corrected.fa.fai");
    ref_ind = ref_ind.replace("..fa.fai", ".fa.fai");
    assert os.path.isfile(ref_ind), "\nCANNOT FIND FILE: " + ref_ind + "\n";

    orig_scaffs = {};
    for line in open(orig_ind):
        line = line.strip().split("\t");
        orig_scaffs[line[0]] = line[1];
    
    ref_scaffs = {};
    for line in open(ref_ind):
        line = line.strip().split("\t");
        ref_scaffs[line[0]] = line[1];

    for scaff in orig_scaffs:
        if scaff not in ref_scaffs:
            print(">>" + scaff + " IN ORIGINAL BUT NOT REFEREE");

    for scaff in ref_scaffs:
        if scaff not in orig_scaffs:
            print(">>" + scaff + " IN REFEREE BUT NOT ORIGINAL");

    for scaff in orig_scaffs:
        orig_len = orig_scaffs[scaff];
        ref_len = ref_scaffs[scaff];

        if orig_len != ref_len:
            print(">>" + scaff + " " + orig_len + " IN ORIGINAL BUT " + ref_len + " IN REFEREE");


