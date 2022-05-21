#!/usr/bin/python3
############################################################
# For rodent exomes, 09.2020
# There was a bug in the Referee that added a scaffold twice
# if the last position was mapped. This removes the 
# erroneously added scaffold.
############################################################

import sys
sys.path.append("../../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, gzip, globs, core
from collections import defaultdict

############################################################

seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

ref_dir = os.path.abspath("../../01-Assembly-data/08-Referee/");

specs = [ s for s in specs_ordered if "(no WGA)" not in s and "pos_ctrl" not in s ];
# Parse the input species.

num_fixed = 0;
i = 1;
for s in specs:
    s_mod = s.replace(" ", "-");
    print(i, " ", s_mod);
    i += 1;
    ref = os.path.join(ref_dir, s_mod, s_mod + "-referee-corrected.fa");
    assert os.path.isfile(ref), "\nAssembly file not found: " + ref;
    # Get reference

    new_ref = os.path.join(ref_dir, s_mod, s_mod + "-referee-corrected-RMSCAFF.fa");

    print("reading ref: " + ref);
    seqs = core.fastaGetDict(ref);
    print("scaffolds read ", len(seqs));

    print("counting scaffolds");
    title_counts = defaultdict(int);
    exclude = [];
    for title in seqs:
        t = title.split(" ")[0];
        title_counts[t] += 1;
        if title_counts[t] > 1:
            exclude.append(title);

    if exclude != []:
        print("duplicate scaffold found. writing new output: " + new_ref);
        with open(new_ref, "w") as outfile:
            for title in seqs:
                if title in exclude:
                    print(title);
                else:
                    split_seq = '\n'.join([seqs[title][i:i+60] for i in range(0, len(seqs[title]), 60)])
                    outfile.write(title + "\n");
                    outfile.write(split_seq + "\n");
        num_fixed += 1;
    else:
        print("no duplicate scaffolds found");

print("num fixed: ", num_fixed);
