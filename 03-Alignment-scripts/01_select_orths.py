#!/usr/bin/python3
############################################################
# For rat exomes, 10.2020
# Selects orthologs from specified species.
############################################################

import sys
sys.path.append("../../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mseq, mfiles, globs

############################################################

def readSeqs(infile, selected_transcripts, tid_convert):
# This function takes an Ensembl FASTA file and reads the sequences into a dictionary in the format <gene ID> : <sequence>. Gene IDs
# are for that species.
# Also checks to make sure the transcript is included in the selected_transcripts, otherwise it skips.
    seqs, err_flag = mcore.fastaReader(infile);
    if err_flag:
        sys.exit("Couldn't read file: " + infile);
    seq_dict = {};
    for title in seqs:
        gid = title[title.index("gene:")+len("gene:"):title.index(".", title.index("gene:"))];
        tid = title[1:title.index(".")];
        if tid not in tid_convert:
            continue;
        mtid = tid_convert[tid];
        if mtid in selected_transcripts:
            seq_dict[gid] = seqs[title];
    return(seq_dict);

############################################################
print("# ----------------");
print("# " + mcore.getDateTime() + " Reading options...");
parser = argparse.ArgumentParser(description="Rat orth selector and seq retriever");
parser.add_argument("-i", dest="input", help="Input FASTA file.", default=False);
parser.add_argument("-o", dest="outdir", help="Desired output directory for sequence files.", default=False);
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-e", dest="exclude", help="A comma delmited list of species to exclude.", default=False);
parser.add_argument("--overwrite", dest="overwrite", help="If the output directory already exists and you wish to overwrite it, set this option.", action="store_true", default=False);
parser.add_argument("--count", dest="count", help="Only count the number of orths, do not write seqs.", action="store_true", default=False);
# IO options
args = parser.parse_args();

if not args.input or not os.path.isfile(args.input):
    sys.exit(" * ERROR 1: Please provide a valid input file with -i.");

if not args.outdir:
    sys.exit(" * ERROR 2: Please provide a valid output directory with -o."); 

if not args.name:
    sys.exit(" * ERROR 3: please provide a name for this run with -n");
# Check that a name has been provided

print("# " + mcore.getDateTime() + " Reading species info...");
seq_run_ids, spec_ids, specs_ordered = globs.get();
specs = { s : True for s in specs_ordered };
# Get all the meta info for the species and sequencing runs.

if args.exclude:
    exclude = args.exclude.replace(", ", ",").split(",");
else:
    exclude = [];
#exclude = [ spec for spec in s if s[spec]['dataset'] in ['phodopus', 'penn'] ];

#exclude = ['hall', 'pdel', 'mnat', 'gdol', 'rdil', 'rsor', 'jjac', 'ngal', 'moch', 'pman', 'mung', 'mspi', 'mpah', 'mcar', 'mpwk', 'mwsb', 'mcas'];
#'hall,pdel,mnat,gdol,rdil,rsor,jjac,ngal,moch,pman,mung,mspi,mpah,mcar,mpwk,mwsb,mcas'
#name = "phodopus-9spec";
# For phodopus 9 spec

#'hall,pdel,mnat,gdol,rdil,rsor,jjac,ngal,moch,pman,mung,mspi,mpah,mcar,mpwk,mwsb,mcas,maur'
# For phodopus 8 spec

#'hall,pdel,mnat,gdol,rdil,rsor,itri,jjac,ngal,maur,cgri,moch,pman,mung,rnor,mspi,mpah,mcar,mspr,mpwk,mwsb,mcas,mmus'
# For phodopus 3 spec

#'hall,pdel,mnat,gdol,rdil,rsor,psun,pcam,prob,itri,jjac,ngal,maur,cgri,moch,pman,mung,rnor,mspi,mpah,mcar,mcas,mmus'
# For mus 3 spec

#'psun,pcam,prob,itri,jjac,ngal,maur,cgri,moch,pman,mung,rnor,mspi,mpah,mcar,mcas,mspr,mpwk,mwsb'
# For penn 7 spec

# 'pcam,mpwk,mwsb,mcas,mspr,mspi'
# For penn selection tests, 20spec

num_spec = len(specs);
for e in exclude:
    if e not in specs_ordered:
        sys.exit(" * ERROR: excluded species not in databse: " + e);
    specs[e] = False;
    num_spec -= 1;
# Check and flag the excluded species
# Species to exclude;

if os.path.exists(args.outdir) and not args.overwrite:
    sys.exit(" * ERROR: Output directory already exists: " + args.outdir + "\n * Specify --overwrite explicitly to overwrite this directory and the files in it.");
if not os.path.isdir(args.outdir):
    os.system("mkdir " + args.outdir);
logfilename = os.path.join(args.outdir, "select-orths-" + args.name + ".log");
# Output info

pad = 30;

############################################################

with open(logfilename, "w") as logfile:
    mcore.runTime("# Exomes -- select CDS orths", logfile);
    mcore.PWS("# INPUT FASTA file:            " + args.input, logfile);
    mcore.PWS("# INFO Number species:         " + str(num_spec), logfile);
    mcore.PWS("# OUTPUT Sequence output dir:  " + args.outdir, logfile);
    mcore.PWS("# OUTPUT Log file:             " + logfilename, logfile);
    if exclude:
        mcore.PWS("# INPUT Excluded speces:       " + ",".join(exclude), logfile);
    mcore.PWS("# ----------------", logfile);
    if args.count:
        mcore.PWS("# Counting orths only.");
    else:
        mcore.PWS("# Counting orths and writing sequences.")
    # Log info

    mcore.PWS("# " + mcore.getDateTime() + " Reading sequences...", logfile);
    seqs = mseq.fastaGetDict(args.input);
    mcore.PWS(mcore.spacedOut("# Total sequences read:", pad) + str(len(seqs)), logfile);               
    mcore.PWS("# ----------------", logfile);

    mcore.PWS("# " + mcore.getDateTime() + " Parsing transcripts...", logfile);
    transcripts = {};
    for title in seqs:
        tid, sid = title.split("_|_");
        if tid not in transcripts:
            transcripts[tid] = {  };
        transcripts[tid][sid] = seqs[title];
    mcore.PWS(mcore.spacedOut("# Total transcripts read:", pad) + str(len(transcripts)), logfile);               
    mcore.PWS("# ----------------", logfile);       



