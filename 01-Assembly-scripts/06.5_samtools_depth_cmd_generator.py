#!/usr/bin/python3
############################################################
# For rodent exomes, 07.2020
# Run mosdepth on mapped reads
############################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, argparse, mcore, mfiles, gzip, globs

assembled_specs = { "Apomys lubangensis" : 1, "Batomys salomonseni" : 1, "Bulimus bagobus" : 1, "Chrotomys mindorensis" : 1, "Phloeomys pallidus" : 1, "Rhynchomys isarogensis" : 1, "Sundamys meulleri" : 1, 
    "Taeromys punicans" : 1, "Hyorhinomys stuempkei" : 1, "Hybomys univittatus" : 1, "Colomys goslingi" : 1, "Malacomys longipes" : 1, "Hylomyscus vulcanorum" : 1, "Praomys degraaffi" : 1, "Grammomys sp" : 1, 
    "Lemniscomys striatus" : 1, "Berylymys bowersi" : 1, "Crunomys celebensis" : 1, "Echiothrix centrosa" : 1, "Gracillimus radix" : 1, "Leopoldomys sabanus" : 1, "Margaretamys parvus" : 1, "Melasmothrix naso" : 1, 
    "Paucidentomys vermidax" : 1, "Sommeromys macrorhinos" : 1, "Tateomys macrocercus" : 1, "Tateomys rhinogradoides" : 1, "Waiomys mamasae" : 1, "Chiropodomys gliroides" : 1, "Lorentzimys nouhuysi" : 1, 
    "Mastacomys fuscus" : 1, "Melomys rufescens" : 1, "Hydromys chrysogaster" : 1, "Apodemus sylvaticus" : 1, "Archboldomys luzonensis" : 1, "Bunomys chrysocomus" : 1, "Haeromys minahassae" : 1, 
    "Maxomys surifer" : 1, "Niviventer lepturus" : 1, "Paruromys dominator" : 1, "Bunomys andrewsi" : 2, "Rattus exulans" : 2, "Rattus hoffmanni" : 2, "Rattus leucopus" : 2, "Rattus lutreolus" : 2, 
    "Maxomys musschenbroekii" : 2, "Rattus praetor" : 2, "Rattus villosissimus" : 2, "Mus musculus reference" : 3, "Mus musculus musculus" : 3, "Mus musculus domesticus" : 3, "Mus musculus castaneus" : 3, 
    "Mus caroli" : 3, "Mus cervicolor" : 3, "Mus cookii" : 3, "Mus macedonicus" : 3, "Mus minutoides" : 3, "Mus molossinus" : 3, "Mus pahari" : 3, "Mus platythrix" : 3, "Mus spicilegus" : 3, "Mus spretus" : 3, 
    "Coccymys ruemmleri" : 4, "Grammomys dryas" : 4, "Carpomys melanurus" : 4, "Crateromys heaneyi" : 4, "Dasymys montanus" : 4, "Aethomys hindei" : 4, "Hylomyscus stella" : 4, "Anisomys imitator" : 4, 
    "Crunomys melanius" : 4, "Niviventer rapit" : 4, "Phloeomys cumingii" : 4, "Aethomys nyikae" : 4, "Hybomys planifrons" : 4, "Pogonomys macrourus" : 4, "Musseromys anacuao" : 4, "Limnomys sibuanus" : 4, 
    "Pithecheir melanurus" : 4, "Thamnomys sp." : 4, "Mammelomys lanosus" : 4, "Xenuromys barbatus" : 4, "Hydromys sp nov" : 4, "Xeromys myoides" : 4, "Pseudohydromys ellermani" : 4, "Leptomys elegans" : 4, 
    "Pelomys isseli" : 4, "Niviventer bukit" : 4, "Genus sp nov" : 4, "Saxatilomys paulinae" : 4, "Crunomys sp." : 4, "Microhydromys richardsoni" : 4, "Uromys caudimaculatus" : 4, "Mirzamys louiseae" : 4, 
    "Papagomys armandvillei" : 4, "Chiromyscus chiropus" : 4, "Pogonomelomys bruijni" : 4, "Paraleptomys sp" : 4, "Oenomys hypoxanthus" : 4, "Bandicota indica" : 4, "Rattus xanthurus" : 4, "Lenomys meyeri" : 4, 
    "Thamnomys kempi" : 4, "Parahydromys asper" : 4, "Rattus argentiventer" : 4, "Uromys sp nov" : 4, "Otomys tropicalis" : 4, "Niviventer cremoriventer" : 4, "Otomys denti" : 4, "Praomys jacksoni" : 4, 
    "Margaretamys christinae" : 4, "Dasymys incomtus" : 4, "Taeromys callitrichus" : 4, "Hybomys lunaris" : 4, "Sundamys annandalei" : 4, "Nesokia indica" : 4, "Macruromys major" : 4, "Mus musculoides" : 4, 
    "Pelomys minor" : 4, "Tarsomys apoensis" : 4, "Batomys russatus" : 4, "Halmaheramys bokimekot" : 4, "Chiruromys vates" : 4, "Chrotomys whiteheadi" : 4, "Abeomelomys sevia" : 4, "Berylmys mackenzii" : 4, 
    "Solomys salebrosus" : 4, "Zelotomys woosnami" : 4, "Kadarsanomys sodyi" : 4, "Mallomys rothschildi" : 4, "Taeromys taerae" : 4, "Vandeleuria oleracea" : 4, "Conilurus albipes NMV c7585" : 5, 
    "Conilurus penicillatus M14056" : 5, "Leggadina forresti WAMM62323" : 5, "Leggadina lakedownensis WAMM21623" : 5, "Leporillus apicalis C90" : 5, "Leporillus conditor ABTC13335" : 5, 
    "Mastacomys fuscus M13957" : 5, "Mastacomys fuscus NMV C37546" : 5, "Mesembriomys gouldii ABTC7449" : 5, "Mesembriomys macrurus ABTC7337" : 5, "Notomys alexis U1308" : 5, "Notomys amplus NMV C512" : 5, 
    "Notomys aquilo M 32455" : 5, "Notomys cervinus M22857" : 5, "Notomys fuscus M22830" : 5, "Notomys longicaudatus C6278" : 5, "Notomys macrotis ZD 1841 1167" : 5, "Notomys mitchelli ABTC94521" : 5, 
    "Notomys mitchellii M21518" : 5, "Pseudomys albocinereus WAMM18855" : 5, "Pseudomys apodemoides M16672" : 5, "Pseudomys auritus 1846 4 4 67" : 5, "Pseudomys australis M25541" : 5, 
    "Pseudomys bolami ABTC08077" : 5, "Pseudomys bolami ABTC107389" : 5, "Pseudomys calabyi U4324" : 5, "Pseudomys calabyi WAMM56280" : 5, "Pseudomys chapmani WAMM29440" : 5, "Pseudomys delicatulus JM18363" : 5, 
    "Pseudomys delicatulus M29247" : 5, "Pseudomys delicatulus U1509" : 5, "Pseudomys delicatulus WAMM29247" : 5, "Pseudomys desertor ABTC41464" : 5, "Pseudomys fieldi ABTC08164" : 5, 
    "Pseudomys fumeus ABTC08168" : 5, "Pseudomys gouldii C955" : 5, "Pseudomys gracilicaudatus ABTC08163" : 5, "Pseudomys hermannsburgensis ABTC08067" : 5, "Pseudomys higginsi UC1421" : 5, 
    "Pseudomys johnsoni ABTC08053" : 5, "Pseudomys nanus U1448" : 5, "Pseudomys novaehollandiae ABTC08140" : 5, "Pseudomys novaehollandiae NMV C22127" : 5, "Pseudomys occidentalis ABTC08043" : 5, 
    "Pseudomys oralis RAT7" : 5, "Pseudomys patrius JM10865" : 5, "Pseudomys pilligaensis ABTC18120" : 5, "Pseudomys shortridgei M62127" : 5, "Pseudomys shortridgei M7890" : 5, "Pseudomys shortridgei Z25113" : 5, 
    "Rattus colletti RAT25" : 5, "Rattus tunneyi RAT130" : 5, "Zyzomys argurus ABTC61630" : 5, "Zyzomys maini ABTC07900" : 5, "Zyzomys palatalis ABTC30744" : 5, "Zyzomys pedunculatus Z34925" : 5, 
    "Zyzomys woodwardi WAMM21724" : 5 };
# The ordered list of assembled species and their sequencing batch.

##########################
# Parsing input and output options.

parser = argparse.ArgumentParser(description="Generates commands for generating samtools depth files.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-ref", dest="ref", help="The reference genome to use. Either 'mouse' or 'rat' or left blank to map back to exome assembly.", default=False);
parser.add_argument("-n", dest="name", help="A short name for all files associated with this job.", default=False);
parser.add_argument("-p", dest="path", help="The path to samtools. Default: samtools", default="samtools");
parser.add_argument("--overwrite", dest="overwrite", help="If the job and submit files already exist and you wish to overwrite them, set this option.", action="store_true", default=False);
# IO options

parser.add_argument("-part", dest="part", help="SLURM partition option.", default=False);
parser.add_argument("-tasks", dest="tasks", help="SLURM --ntasks option.", type=int, default=1);
parser.add_argument("-cpus", dest="cpus", help="SLURM --cpus-per-task option.", type=int, default=1);
parser.add_argument("-mem", dest="mem", help="SLURM --mem option.", type=int, default=0);
# SLURM options

args = parser.parse_args();
# Input options.

if not args.name:
    name = mcore.getRandStr();
else:
    name = args.name;
# Get the job name.

if args.ref:
    if args.ref not in ['mouse', 'rat']:
        sys.exit(" * ERROR 1: Please make sure -ref is either 'mouse' or 'rat' or not specified to map back to exome assembly.");
    if args.ref == "mouse":
        tile_file = "/mnt/beegfs/gt156213e/murinae-seq/Targets/tiles-mm10-coords.bed";

base_outdir = os.path.abspath("../01-Assembly-data/");
bam_dir = os.path.join(base_outdir, "06-Map");
step = "06.5_Samtools_depth";

pad = 26
cwd = os.getcwd();
# Job vars

output_file = os.path.join(cwd, "jobs", name + ".sh");
submit_file = os.path.join(cwd, "submit", name + "_submit.sh");
# Job files

if not args.part:
    sys.exit( " * ERROR 1: Please specify a SLURM partition (-part) or submit -part none to not generate the submit script.");

if (os.path.isfile(output_file) or os.path.isfile(submit_file)) and not args.overwrite:
    sys.exit( " * ERROR 2: Job and submit files already exist! Explicity specify --overwrite to overwrite them.");

base_logdir = os.path.abspath("logs/");
logdir = os.path.join(base_logdir, step + "-logs");
# Step I/O info.

if args.spec != "all":
    args.spec = args.spec.replace(", ", ",").split(",");
    if any(s not in assembled_specs for s in args.spec):
        sys.exit( " * ERROR 3: Invalid species entered with -s.");
if args.runtype != "all":
    args.runtype = [ int(r) for r in args.runtype.replace(", ", ",").split(",") ];
    if any(r not in [1,2,3,4,5] for r in args.runtype):
        sys.exit( " * ERROR 4: Invalid run type entered with -r.");    

with open(output_file, "w") as jobfile:
    mcore.runTime("#!/bin/bash\n# Rodent BWA commands", jobfile);
    mcore.PWS("# STEP INFO", jobfile);
    mcore.PWS(mcore.spacedOut("# BAM directory:", pad) + bam_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Output directory:", pad) + bam_dir, jobfile);
    mcore.PWS(mcore.spacedOut("# Samtools path:", pad) + args.path, jobfile);
    mcore.PWS(mcore.spacedOut("# Species:", pad) + str(args.spec), jobfile);
    if args.ref:
        mcore.PWS(mcore.spacedOut("# Reference genome:", pad) + args.ref, jobfile);
    else:
        mcore.PWS(mcore.spacedOut("# Reference genome:", pad) + "Exome assemblies", jobfile);
    mcore.PWS(mcore.spacedOut("# Run types:", pad) + str(args.runtype), jobfile);
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

    if args.spec == "all":
        args.spec = list(assembled_specs.keys());
    if args.runtype == "all":
        args.runtype = [1,2,3,4,5];

##########################
# Generating the commands in the job file.
    for s in assembled_specs:
        #print(s, assembled_specs[s], s in args.spec, assembled_specs[s] in args.runtype);
        if s not in args.spec or assembled_specs[s] not in args.runtype:
            continue;
        s_mod = s.replace(" ", "-");

        if args.ref:
            spec_bam = os.path.join(bam_dir, s_mod + "-" + args.ref, "iter-01", "bam", "merged-rg-mkdup-iter-01.bam.gz");
            assert os.path.isfile(spec_bam), "\nCannot find BAM file: " + spec_bam;
            out_prefix = os.path.join(bam_dir, s_mod + "-" + args.ref, "iter-01", "bam", s_mod);
            logfile = os.path.join(logdir, s_mod + "-" + args.ref + "-samtools-depth.log");

        else:
            spec_bam = os.path.join(bam_dir, s_mod, "iter-01", "bam", "merged-rg-mkdup-iter-01.bam.gz");
            assert os.path.isfile(spec_bam), "\nCannot find BAM file: " + spec_bam;
            out_prefix = os.path.join(bam_dir, s_mod, "iter-01", "bam", s_mod);
            logfile = os.path.join(logdir, s_mod + "-samtools-depth.log");

        samtools_cmd = args.path + " depth "  + spec_bam + " &> " + logfile;
        mcore.PWS(samtools_cmd, jobfile);

##########################
# Generating the submit script.
if args.part != "none":
    mfiles.genSlurmSubmit(submit_file, name, args.part, 1, args.tasks, args.cpus, args.mem, output_file)
##########################