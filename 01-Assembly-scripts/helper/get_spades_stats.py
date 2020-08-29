#!/usr/bin/python3
############################################################
# For rodent exomes, 09.05.2019
# Compiles stats from all the spades assemblies
############################################################

import sys
sys.path.append("../../lib/");
# Add the repo's lib dir to the path.

import sys, os, argparse, core, globs, gzip
from collections import defaultdict

############################################################

assembled_specs = { "Apomys lubangensis" : 1, "Batomys salomonseni" : 1, "Bulimus bagobus" : 1, "Chrotomys mindorensis" : 1, "Phloeomys pallidus" : 1, "Rhynchomys isarogensis" : 1, "Sundamys meulleri" : 1, 
    "Taeromys punicans" : 1, "Hyorhinomys stuempkei" : 1, "Hybomys univittatus" : 1, "Colomys goslingi" : 1, "Malacomys longipes" : 1, "Hylomyscus vulcanorum" : 1, "Praomys degraaffi" : 1, "Grammomys sp" : 1, 
    "Lemniscomys striatus" : 1, "Berylymys bowersi" : 1, "Crunomys celebensis" : 1, "Echiothrix centrosa" : 1, "Gracillimus radix" : 1, "Leopoldomys sabanus" : 1, "Margaretamys parvus" : 1, "Melasmothrix naso" : 1, 
    "Paucidentomys vermidax" : 1, "Sommeromys macrorhinos" : 1, "Tateomys macrocercus" : 1, "Tateomys rhinogradoides" : 1, "Waiomys mamasae" : 1, "Chiropodomys gliroides" : 1, "Lorentzimys nouhuysi" : 1, 
    "Mastacomys fuscus" : 1, "Melomys rufescens" : 1, "Hydromys chrysogaster" : 1, "Apodemus sylvaticus" : 1, "Archboldomys luzonensis" : 1, "Bunomys chrysocomus" : 1, "Haeromys minahassae" : 1, 
    "Maxomys surifer" : 1, "Niviventer lepturus" : 1, "Paruromys dominator" : 1, "Bunomys andrewsi" : 2, "Rattus exulans" : 2, "Rattus hoffmanni" : 2, "Rattus leucopus" : 2, "Rattus lutreolus" : 2, 
    "Maxomys musschenbroekii" : 2, "Rattus praetor" : 2, "Rattus villosissimus" : 2, "Mus musculus reference" : 3, "Mus musculus musculus" : 3, "Mus musculus domesticus" : 3, "Mus musculus castaneus" : 3, 
    "Mus caroli" : 3, "Mus cervicolor" : 3, "Mus cookii" : 3, "Mus macedonicus" : 3, "Mus minutoides" : 3, "Mus molossinus" : 3, "Mus pahari" : 3, "Mus platythrix" : 3, "Mus spicilegus" : 3, "Mus spretus" : 3, 
    "Coccymys ruemmleri" : 4, "Grammomys dryas" : 4, "Carpomys melanurus" : 6, "Crateromys heaneyi" : 4, "Dasymys montanus" : 4, "Aethomys hindei" : 4, "Hylomyscus stella" : 4, "Anisomys imitator" : 4, 
    "Crunomys melanius" : 4, "Niviventer rapit" : 4, "Phloeomys cumingii" : 4, "Aethomys nyikae" : 4, "Hybomys planifrons" : 4, "Pogonomys macrourus" : 4, "Musseromys anacuao" : 4, "Limnomys sibuanus" : 4, 
    "Pithecheir melanurus" : 4, "Thamnomys sp." : 4, "Mammelomys lanosus" : 4, "Xenuromys barbatus" : 4, "Hydromys sp nov" : 4, "Xeromys myoides" : 6, "Pseudohydromys ellermani" : 4, "Leptomys elegans" : 4, 
    "Pelomys isseli" : 4, "Niviventer bukit" : 4, "Genus sp nov" : 4, "Saxatilomys paulinae" : 4, "Crunomys sp." : 4, "Microhydromys richardsoni" : 4, "Uromys caudimaculatus" : 4, "Mirzamys louiseae" : 4, 
    "Papagomys armandvillei" : 4, "Chiromyscus chiropus" : 4, "Pogonomelomys bruijni" : 4, "Paraleptomys sp" : 4, "Oenomys hypoxanthus" : 4, "Bandicota indica" : 4, "Rattus xanthurus" : 4, "Lenomys meyeri" : 4, 
    "Thamnomys kempi" : 4, "Parahydromys asper" : 4, "Rattus argentiventer" : 4, "Uromys sp nov" : 4, "Otomys tropicalis" : 6, "Niviventer cremoriventer" : 4, "Otomys denti" : 4, "Praomys jacksoni" : 4, 
    "Margaretamys christinae" : 4, "Dasymys incomtus" : 4, "Taeromys callitrichus" : 4, "Hybomys lunaris" : 4, "Sundamys annandalei" : 4, "Nesokia indica" : 4, "Macruromys major" : 4, "Mus musculoides" : 4, 
    "Pelomys minor" : 4, "Tarsomys apoensis" : 4, "Batomys russatus" : 4, "Halmaheramys bokimekot" : 4, "Chiruromys vates" : 4, "Chrotomys whiteheadi" : 4, "Abeomelomys sevia" : 6, "Berylmys mackenzii" : 4, 
    "Solomys salebrosus" : 4, "Zelotomys woosnami" : 4, "Kadarsanomys sodyi" : 6, "Mallomys rothschildi" : 4, "Taeromys taerae" : 4, "Vandeleuria oleracea" : 4, "Conilurus albipes NMV c7585" : 5, 
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
    "Zyzomys woodwardi WAMM21724" : 5, "Rattus morotaiensis" : 6, "Hyomys goliath" : 6, "Mastomys natalensis" : 6, "Pithechaeir melanurus" : 6, "Crossomys moncktoni" : 6, "Eropeplus canus" : 6, "Bunomys torajae" : 6,
    "Taeromys celebensis" : 6, "Taeromys hamatus" : 6, "Thallomys paedulcus" : 6, "Anonymomys mindorensis" : 6, "Arvicanthus neumanni" : 6, "Arvicanthus niloticus" : 6, "Dephomys defua" : 6, "Heimyscus fumosus" : 6,
    "Lophiomys imhausi" : 6, "Lophuromys woosnami" : 6, "Micaelemys namaquensis" : 6, "Mylomys dybowskii" : 6, "Myomyscus verreauxii" : 6, "Rhabdomys pumilio" : 6, "Stochomys longicaudatus" : 6 };
# The ordered list of assembled species and their sequencing batch.

############################################################

def faLens(fa_file, curline, seqtype, k, lenfile):
    len_sum = 0;
    seqs = core.fastaGetDict(fa_file);
    for title in seqs:
        curlen = len(seqs[title]);
        if seqtype == "scaffold":
            lenfile.write(k + "," + str(curlen) + "\n");
        len_sum += curlen;

    curline[seqtype + ' avg len'] = str(float(len_sum) / float(len(seqs)));

    return curline;

def getStats(sfile, spec, stype):
    curline = [spec, stype];

    seqs = core.fastaGetDict(sfile);
    seq_lens = [ len(seqs[t]) for t in seqs ];

    total_seqs = len(seq_lens);
    total_seq_len = sum(seq_lens);

    curline.append(total_seqs);
    curline.append( float(total_seq_len) / float(total_seqs) );
    
    len_sum = 0;
    num_scaffs = 0;
    #seq_lens = sorted(seq_lens.items(), key=lambda kv: kv[1], reverse=True);
    seq_lens = sorted(seq_lens, reverse=True);
    for seq_len in seq_lens:
        num_scaffs += 1;
        len_sum += seq_len;
        if len_sum / total_seq_len >= 0.5:
            n50 = seq_len;
            l50 = num_scaffs;
            break;

    curline.append(n50);
    curline.append(l50);

    return(curline);

############################################################

core.runTime("# Spades stats");
parser = argparse.ArgumentParser(description="Gets stats from a bunch of spades assemblies.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
args = parser.parse_args();
# Input options.

if args.spec != "all":
    args.spec = args.spec.replace(", ", ",").split(",");
    if any(s not in assembled_specs for s in args.spec):
        sys.exit( " * ERROR 3: Invalid species entered with -s.");
else:
    args.spec = list(assembled_specs.keys());
if args.runtype != "all":
    args.runtype = [ int(r) for r in args.runtype.replace(", ", ",").split(",") ];
    if any(r not in [1,2,3,4,5,6] for r in args.runtype):
        sys.exit( " * ERROR 4: Invalid run type entered with -r.");
else:
    args.runtype = [1,2,3,4,5,6];

# parser = argparse.ArgumentParser(description="Gets stats from a bunch of spades assemblies.");
# parser.add_argument("-i", dest="indir", help="Main directory holding all the abyss subdirectories. Default: ../../01-Assembly-data/04A-Spades/", default="../../01-Assembly-data/04A-Spades/");
# parser.add_argument("-o", dest="outfile", help="Output csv file. Default: spades-stats-out.csv", default='spades-stats-out.csv');
# #parser.add_argument("--long", dest="long", help="Set this to output in long format.", action="store_true", default=False);
# args = parser.parse_args();
# # Input options.

assembly_dir = "../../01-Assembly-data/05-Scaffolds/";
map_dir = "../../01-Assembly-data/06-Map/";
outfilename = "spades-stats.csv";
pad = 30;

with open(outfilename, "w") as outfile:
    #if args.long:
    cols = ["Species","batch","type","count","avg len","N50","L50", "number reads mapped", "percent reads mapped", "avg depth per base (samtools)", "avg depth per base (mosdepth)", "avg depth per scaff (mosdepth)", "number reads mapped mouse targets", "percent reads mapped mouse targets", "avg depth per base to mouse targets (samtools)", "avg depth per target mouse targets (mosdepth)"];
    # Long output headers

    outfile.write(",".join(cols) + "\n");
    i = 1;
    for s in assembled_specs:
        if assembled_specs[s] not in args.runtype or s not in args.spec:
            continue;

        s_mod = s.replace(" ", "-");
        # if s_mod != "Xenuromys-barbatus":
        #     continue;

        if s_mod in ["Carpomys-melanurus","Xeromys-myoides", "Otomys-tropicalis", "Abeomelomys-sevia", "Kadarsanomys-sodyi", "Conilurus-albipes-NMV-c7585"]:
            continue;

        print(str(i) + " " + s);
        i += 1;

        spec_assembly = os.path.join(assembly_dir, s_mod, s_mod + ".fa");
        spec_assembly = spec_assembly.replace("..fa", ".fa");
        spec_samtools_depth = os.path.join(map_dir, s_mod, s_mod + "-depth.tab");
        spec_mosdepth_scaff = os.path.join(map_dir, s_mod, s_mod + ".mosdepth.summary.txt");
        spec_mosdepth_base = os.path.join(map_dir, s_mod, s_mod + ".per-base.bed.gz");
        spec_flagstat = os.path.join(map_dir, s_mod, s_mod + "-flagstats.txt");
        spec_samtools_depth_mouse = os.path.join(map_dir, s_mod + "-mouse", s_mod + "-depth.tab");
        spec_mosdepth_mouse = os.path.join(map_dir, s_mod + "-mouse", s_mod + ".regions.bed.gz"); 
        spec_flagstat_mouse = os.path.join(map_dir, s_mod + "-mouse", s_mod + "-flagstats.txt");
        
        assert os.path.isfile(spec_assembly), "\nCannot find assembly file: " + spec_assembly;
        assert os.path.isfile(spec_samtools_depth), "\nCannot find samtools depth file: " + spec_samtools_depth;
        assert os.path.isfile(spec_mosdepth_scaff), "\nCannot find mosdepth scaffold file: " + spec_mosdepth_scaff;
        assert os.path.isfile(spec_mosdepth_base), "\nCannot find mosdepth base file: " + spec_mosdepth_base;
        assert os.path.isfile(spec_flagstat), "\nCannot find flagstat file: " + spec_flagstat;
        assert os.path.isfile(spec_samtools_depth_mouse), "\nCannot find samtools mouse depth file: " + spec_samtools_depth_mouse;
        assert os.path.isfile(spec_mosdepth_mouse), "\nCannot find mosdepth mouse base file: " + spec_mosdepth_mouse;
        assert os.path.isfile(spec_flagstat_mouse), "\nCannot find mouse flagstat file: " + spec_flagstat_mouse;
        #continue;
    
        cur_line = [s_mod, assembled_specs[s], "scaffolds" ];

        spec_info = {};
        seq_lens, mean_depths = [], [];
        first = True;
        for line in open(spec_mosdepth_scaff):
            if first:
                first = False;
                continue;

            if line.startswith("total"):
                continue;
            #print(line);

            line = line.strip().split("\t");
            scaff, length, bases, mean, mindepth, maxdepth = line;
            spec_info[scaff] = {'len' : float(length), 'bases' : int(bases), 'mean' : float(mean), 'min' : int(mindepth), 'max' : int(maxdepth) };
            seq_lens.append(float(length));
            mean_depths.append(float(mean));

        total_seqs = len(spec_info);
        total_seq_len = float(sum(seq_lens));
        # Get total seqs and total length

        cur_line.append(total_seqs);
        cur_line.append(total_seq_len / total_seqs);
        # Append num seqs and avg. length to output line
        
        len_sum, num_scaffs = 0.0, 0.0;
        seq_lens = sorted(seq_lens, reverse=True);
        for seq_len in seq_lens:
            num_scaffs += 1;
            len_sum += seq_len;
            if len_sum / total_seq_len >= 0.5:
                n50 = seq_len;
                l50 = num_scaffs;
                break;
        cur_line.append(n50);
        cur_line.append(l50);
        # Calculate N50 and L50

        flag_lines = open(spec_flagstat, "r").read().split("\n");
        reads_line = flag_lines[4].split(" ");
        num_reads_mapped = reads_line[0]
        perc_reads_mapped = reads_line[4].replace("(", "").replace("%", "");
        cur_line.append(num_reads_mapped);
        cur_line.append(perc_reads_mapped);
        # Get number of reads mapped from flagstat file

        depth_sum, num_bases = 0.0, 0.0;
        for line in open(spec_samtools_depth):
            line = line.strip().split("\t");
            num_bases += 1;
            depth_sum += float(line[2]);
        avg_depth = depth_sum / num_bases;
        cur_line.append(avg_depth);
        # Samtools per base depth to spades assembly

        depth_sum, num_bases = 0.0, 0.0;
        for line in gzip.open(spec_mosdepth_base):
            line = line.decode().strip().split("\t");
            cur_bases = float(line[2]) - float(line[1]);
            cur_depth = cur_bases * float(line[3]);
            num_bases += cur_bases;
            depth_sum += cur_depth;
        avg_depth = depth_sum / num_bases;
        cur_line.append(avg_depth);
        # Mosdepth per base depth to spades assembly

        avg_depth = float(sum(mean_depths)) / float(len(mean_depths));
        cur_line.append(avg_depth);
        # Mosdepth per scaffold depth (from reading scaffold file above) to spades assembly

        flag_lines = open(spec_flagstat_mouse, "r").read().split("\n");
        reads_line = flag_lines[4].split(" ");
        num_reads_mapped = reads_line[0]
        perc_reads_mapped = reads_line[4].replace("(", "").replace("%", "");
        cur_line.append(num_reads_mapped);
        cur_line.append(perc_reads_mapped);
        # Get number of reads mapped to mouse targets from flagstat file.

        depth_sum, num_bases = 0.0, 0.0;
        for line in open(spec_samtools_depth_mouse):
            line = line.strip().split("\t");
            num_bases += 1;
            depth_sum += float(line[2]);
        avg_depth = depth_sum / num_bases;
        cur_line.append(avg_depth);
        # Samtools per base depth to mouse targets

        depth_sum, num_bases = 0.0, 0.0;
        for line in gzip.open(spec_mosdepth_mouse):
            line = line.decode().strip().split("\t");
            cur_bases = float(line[2]) - float(line[1]);
            cur_depth = cur_bases * float(line[3]);
            num_bases += cur_bases;
            depth_sum += cur_depth;
        avg_depth = depth_sum / num_bases;
        cur_line.append(avg_depth);
        # Mosdepth per target to mouse targets

        outline = ",".join([ str(o) for o in cur_line ]);
        print(outline);
        outfile.write(outline + "\n");
        #sys.exit();






