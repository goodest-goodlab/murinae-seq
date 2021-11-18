#!/usr/bin/python
############################################################
# A script to select random branches to compare against a test set
############################################################

import sys, os, core, random, treeparse as tp

############################################################

test_internals = ["192", "214", "232", "258", "364", "200", "215", "239", 
                    "262", "203", "230", "240", "354", "214" ];
test_tips = ["Crunomys_melanius_KU168558", "Pithecheir_melanurus_LSUMZ38198", "Rattus_hoffmanni_LSUMZ39187", 
                "Anonymomys_mindorensis_FMNH2222010", "Haeromys_minahassae_JAE4996", "Rattus_argentiventer_LSUMZ38199", 
                "Rattus_xanthurus_LSUMZ39196", "Berylmys_bowersi_ABTC116431", "Maxomys_surifer_JAE3632", 
                "Rattus_exulans_sample1"]
# Colonization branches to exclude

treefile = "full-coding-astral-r-labels.tre";
outdir = "random_branches_4";
overwrite = True;
if not os.path.isdir(outdir):
    os.system("mkdir " + outdir);
elif not overwrite:
    sys.exit("Outdir exists and overwrite not set. Exiting.");

tinfo, tree, root = tp.treeParse(open(treefile, "r").read());

tips = [ n.replace(":NaN", "") for n in tinfo if tinfo[n][2] == 'tip' and n.replace(":NaN", "") not in test_tips ];
random.shuffle(tips);
random_tips = tips[:len(test_tips)];

print(random_tips);

internals = [ tinfo[n][3] for n in tinfo if tinfo[n][2] == 'internal' and tinfo[n][3] not in test_internals ];
random.shuffle(internals);
random_internals = internals[:len(test_internals)];

random_nodes = random_tips + random_internals;
for node in random_nodes:
    if node in random_tips:
        continue;
        nw_cmd = "nw_prune -v " + treefile + " " + node + " | sed 's/;/);/; 's/^/(/' | head -n1 | > " + os.path.join(outdir, node);
        with open(os.path.join(outdir, node), "w") as tipfile:
            tipfile.write("(" + node + ");");
    else:
        nw_cmd = "nw_prune -v " + treefile + " " + node + " > " + os.path.join(outdir, node + "-RANDOM");
        print(nw_cmd);
        os.system(nw_cmd);