#!/usr/bin/python3
############################################################
# For rodent exomes, 11.2019
# Copies the raw reads for the 48 exomes to my scratch folder.
############################################################

import sys, os, argparse, core, lib.globs as globs, lib.seq_files as SF

############################################################

print();
print("\n###### Rodent read copier ######");
print("PYTHON VERSION: " + ".".join(map(str, sys.version_info[:3])))
print("# Script call: " + " ".join(sys.argv) + "\n----------");

parser = argparse.ArgumentParser(description="Copy read files to scratch dir.");
parser.add_argument("-s", dest="spec", help="A species to lookup", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to lookup. One of: 'nextseq single 1', 'nextseq single 2', 'all'", default="all");
parser.add_argument("--c", dest="carnation", help="Set this option if running on Carnation.", action="store_true", default=False);
args = parser.parse_args();
# Input options.

seq_run_ids, spec_ids, specs_ordered, spec_abbr, basedirs = globs.get();

if args.carnation:
    basedirs = ["/nfs/musculus" + d for d in basedirs];

if args.runtype == "all":
    runtype = [0,1,2,3,4,5,6,7,8,9,10];
else:
    runtype = [];
    args.runtype = args.runtype.replace(", ", ",").split(",");
    for r in args.runtype:
        if r in seq_run_ids:
            runtype.append(seq_run_ids[r]);
        elif r in ["0","1","2","3","4","5","6","7","8","9","10"]:
            runtype.append(int(r));
        else:
            sys.exit(core.errorOut("CP1", "Cannot find specified sequencing run: " + str(r)));
# Parse the input runtypes.

runstrs = {};
for r in runtype:
    for runstr, runind in seq_run_ids.items():
        if runind == r:
            runstrs[r] = runstr;
            #runstrs.append(runstr);
            args.runtype = runstr;
# Get the string run type if int is given as input.
#print(runstrs);
#print(runtype);

if args.spec == "all":
    spec = specs_ordered;
else:
    spec = args.spec.replace(", ", ",").split(",");
    for s in spec:
        if s not in spec_ids:
            sys.exit(core.errorOut("CP2", "Cannot find specified species: " + s));
# Parse the input species.



for r in runtype:
    #print("\n # " + runstrs[runtype.index(r)].title().replace("seq", "Seq") + ":");
    basedir = basedirs[r];

    run_label = runstrs[r].replace(" ", "-")#.replace("-1", "").replace("-2", "");
    #print(run_label)
    
    for s in spec:
        spec_label = s.replace(" ", "-").replace(")", "").replace("(", "");
        cur_run_label = run_label
        #print(spec_label);
        if "-no-WGA" in spec_label:
            if "-no-WGA" not in run_label:
                cur_run_label = run_label + "-no-WGA";
            spec_label = spec_label.replace("-no-WGA", "");
        #print(spec_label);
        baseout = "/scratch/gregg_thomas/Murinae-seq/00-RawReads/" + spec_label;
        #print(baseout);
        if not os.path.isdir(baseout):
            os.system("mkdir " + baseout);
        #rawdir = os.path.join(baseout, "raw");
        #if not os.path.isdir(rawdir):
        #    os.system("mkdir " + rawdir);
        #outdir = os.path.join(rawdir, run_label);

        outdir = os.path.join(baseout, cur_run_label);

        seqfiles_init = SF.getFilePaths(s, r, args.carnation);

        seqfiles = [];
        for f in seqfiles_init:
            if ";" in f:
                f = f.split(";");
                seqfiles.append(f[0]);
                seqfiles.append(f[1]);
            else:
                seqfiles.append(f);
        # Splits up the mate pair files if necessary.

        if seqfiles == []:
            continue;

        if not os.path.isdir(outdir):
            os.system("mkdir " + outdir);

        #print(outdir);

        for f in seqfiles:
            if ".txt.gz" in f:
                outfile = os.path.basename(f).replace("_1.txt.gz", "_R1_.fastq.gz");
                outfile = outfile.replace("_2.txt.gz", "_R2_.fastq.gz");
                cp_cmd = "cp " + f + " " + os.path.join(outdir, outfile);
            else:
                cp_cmd = "cp " + f + " " + outdir + "/.";
            print(cp_cmd);
            os.system(cp_cmd);

        #print(" ## " + s + "... (" + str(len(seqfiles)) + " files)");