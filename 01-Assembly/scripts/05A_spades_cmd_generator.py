#!/usr/bin/python3
############################################################
# For rodent exomes, 12.2019
# Run SPADES on all read files from a given sample and 
# sequencing run.
############################################################

import sys, os, argparse, core, lib.globs as globs
from datetime import datetime

############################################################

def getFiles(s, r, run_string, library_num):
    indir = os.path.join("/mnt/beegfs/gt156213e/Murinae-exomes/04A-Dedup/", s, run_string);
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

core.runTime("#!/bin/bash\n# Rodent dedup commands");

parser = argparse.ArgumentParser(description="Generates commands for read dedup with bbmap for 48 exomes.");
parser.add_argument("-s", dest="spec", help="A species to lookup", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to lookup. One of: 'nextseq single 1', 'nextseq single 2', 'all'", default="all");
parser.add_argument("--c", dest="carnation", help="Set this option if running on Carnation.", action="store_true", default=False);
args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, spec_abbr, basedirs = globs.get();

if args.carnation:
    basedirs = ["/nfs/musculus" + d for d in basedirs];

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
            sys.exit(core.errorOut("SF1", "Cannot find specified sequencing run: " + str(r)));
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
            sys.exit(core.errorOut("SF2", "Cannot find specified species: " + s));
# Parse the input species.

hoff_libs = {};
exul_libs = {};

i = 1;
for s in spec:
    if "(no WGA)" in s:
        continue;

    libraries = {};
    library_num = 0;
    s_mod = s.replace(" ", "-");
    logfile = "/mnt/beegfs/gt156213e/Murinae-exomes/scripts/logs/05A-Spades-logs/" + s_mod + "-spades.log";
    #print(s_mod);
    outdir = os.path.join("/mnt/beegfs/gt156213e/Murinae-exomes/05A-Spades/" + s_mod);
    if not os.path.isdir(outdir):
        os.system("mkdir " + outdir);

    for r in runtype:
        run_string = runstrs[r];
        cur_libs, library_num = getFiles(s_mod, r, run_string, library_num);
        if cur_libs:
            if r in [0,1,2,3,4]:
                k = "21,33,55";
            else:
                k = "21,33,55,77,99,127"
            libraries.update(cur_libs);

        if s_mod in ["Rattus-exulans", "Rattus-hoffmani"]:
            run_string += "-no-WGA"
            cur_libs, library_num = getFiles(s_mod, r, run_string, library_num);
            if cur_libs:
                libraries.update(cur_libs);

    #print(libraries);
    
    spades_cmd = genSpadesCmd(libraries, k, outdir, logfile);

    print(spades_cmd);




