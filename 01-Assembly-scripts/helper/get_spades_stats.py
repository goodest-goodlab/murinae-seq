#!/usr/bin/python3
############################################################
# For rodent exomes, 09.05.2019
# Compiles stats from all the spades assemblies
############################################################

import sys
sys.path.append("../../lib/");
# Add the repo's lib dir to the path.

import sys, os, argparse, mcore, globs, gzip, mfiles, multiprocessing as mp, subprocess
from collections import defaultdict

############################################################
def runCMD(cmd_str):
    cmd_result = subprocess.run(cmd_str, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE);
    cmd_stdout = cmd_result.stdout.decode();
    cmd_stderr = cmd_result.stderr.decode();
    cmd_output = cmd_stdout + "\n\n" + cmd_stderr;

    if any(ecode in cmd_output for ecode in ['error', 'Error', 'ERROR', 'Exception', 'Could not build fai index', 
                                                'AssertionError', "Can't read file", "Killed", "No such file or directory", 
                                                "Symbolic alleles other than <DEL> are currently not supported",
                                                "Failed to open", "The index file is older than the data file",
                                                "tabix: command not found"]):
        sys.exit("* THE FOLLOWING COMMAND RETURNED AN ERROR: " + cmd_str + "\n* COMMAND OUTPUT: " + cmd_output);

    else:
        return [float(result) for result in cmd_stdout.split("\n")[:-1]];

############################################################

def readFlag(flag_file):
    flag_lines = open(flag_file, "r").read().split("\n");
    assert len(flag_lines) == 14, "\nINCORRECT NUMBER OF LINES IN FILE: " + flag_file;
    reads_line = flag_lines[4].split(" ");
    reads_mapped = reads_line[0]
    perc_reads_mapped  = reads_line[4].replace("(", "").replace("%", "");
    paired_line = flag_lines[8].split(" ");
    paired_reads_mapped = paired_line[0]
    perc_paired_reads_mapped  = paired_line[5].replace("(", "").replace("%", "");
    diff_line = flag_lines[11].split(" ");
    paired_reads_mapped_diff_chr = diff_line[0];
    single_line = flag_lines[10].split(" ");
    single_reads_mapped = single_line[0]
    perc_single_reads_mapped  = single_line[4].replace("(", "").replace("%", "");
    # Get number of reads mapped from flagstat file   

    return reads_mapped, perc_reads_mapped, paired_reads_mapped, perc_paired_reads_mapped, paired_reads_mapped_diff_chr, single_reads_mapped, perc_single_reads_mapped;

#########################

def parallelParse(spec, targ_len):
    s_mod = spec.replace(" ", "-");
    outline = {'num-scaffs' : "NA", 'avg-scaff-len' : "NA", 'asm-len' : "NA", 'asm-n50' : "NA", 'asm-l50' : "NA",
                'asm-reads-mapped' : "NA", 'asm-perc-reads-mapped' : "NA",
                'asm-paired-mapped' : "NA", 'asm-perc-paired-mapped' : "NA", 'asm-pair-mapped-diff-chr' : "NA",
                'asm-single-mapped' : "NA", 'asm-perc-single-mapped' : "NA",
                'asm-duplicate-reads' : "NA",
                'asm-avg-depth' : "NA", 'asm-avg-start-depth' : "NA", 'asm-avg-mid-depth' : "NA", 'asm-avg-end-depth' : "NA",
                'mouse-reads-mapped' : "NA", 'mouse-perc-reads-mapped' : "NA",
                'mouse-paired-mapped' : "NA", 'mouse-perc-paired-mapped' : "NA", 'mouse-pair-mapped-diff-chr' : "NA",
                'mouse-single-mapped' : "NA", 'mouse-perc-single-mapped' : "NA",
                'mouse-duplicate-reads' : "NA",
                'mouse-target-reads-mapped' : "NA", 'mouse-target-perc-reads-mapped' : "NA",
                'mouse-target-paired-mapped' : "NA", 'mouse-target-perc-paired-mapped' : "NA", 'mouse-target-pair-mapped-diff-chr' : "NA",
                'mouse-target-single-mapped' : "NA", 'mouse-target-perc-single-mapped' : "NA",
                'mouse-off-target-mapped' : "NA", 'mouse-perc-off-target-mapped' : "NA",
                'mouse-avg-depth' : "NA", 'mouse-target-avg-depth' : "NA",
                'referee-unmapped-pos' : "NA", 'referee-errors-corrected' : "NA", 'referee-error-rate' : "NA", 'referee-low-scores' : "NA",
                'referee-reads-mapped' : "NA", 'referee-perc-reads-mapped' : "NA", 'referee-duplicate-reads' : "NA", 
                'referee-avg-depth' : "NA", 'referee-avg-start-depth' : "NA", 'referee-avg-mid-depth' : "NA", 'referee-avg-end-depth' : "NA",
                'ins-removed' : "NA", 'dels-removed' : "NA", 'complex-removed' : "NA", 'total-snps' : "NA", 'filtered-snps' : "NA" };

    spec_files = {'asm' : os.path.join(assembly_dir, s_mod, s_mod + ".fa"), 'asm-index' : os.path.join(assembly_dir, s_mod, s_mod + ".fa.fai"), 
        'asm-depth' : os.path.join(map_dir, s_mod, s_mod + "-depth.tab"), 'asm-flag' : os.path.join(map_dir, s_mod, s_mod + "-flagstats.txt"), 
        'asm-bam' : os.path.join(map_dir, s_mod, s_mod + ".bam"),
        'mouse-depth' : os.path.join(map_dir, s_mod + "-mouse", s_mod + "-depth.tab"), 'mouse-flag' : os.path.join(map_dir, s_mod + "-mouse", s_mod + "-flagstats.txt"), 
        'mouse-bam' : os.path.join(map_dir, s_mod + "-mouse", s_mod + ".bam"),
        'mouse-target-depth' : os.path.join(map_dir, s_mod + "-mouse", s_mod + "-bedcov.tab"), 'mouse-target-flag' : os.path.join(map_dir, s_mod + "-mouse", s_mod + "-targets-flagstats.txt"),
        'referee-summary' : os.path.join(ref_dir, s_mod, s_mod + "-referee-summary.txt"),
        'referee-bam' : os.path.join(ref_map_dir, s_mod, s_mod + ".bam"), 
        'referee-depth' : os.path.join(ref_map_dir, s_mod, s_mod + "-depth.tab"), 'referee-flag' : os.path.join(ref_map_dir, s_mod, s_mod + "-flagstats.txt"), 
        'unfiltered-vcf' : os.path.join(vcf_dir, s_mod, s_mod +".vcf"), 'filtered-vcf' : os.path.join(vcf_dir, s_mod, s_mod +".snps.filter.vcf")
    }
    spec_files['asm'] = spec_files['asm'].replace("..fa", ".fa");
    spec_files['asm-index'] = spec_files['asm-index'].replace("..fa.fai", ".fa.fai");
    spec_files['asm-bam'] = spec_files['asm-bam'].replace("..bam", ".bam");
    spec_files['mouse-bam'] = spec_files['mouse-bam'].replace("..bam", ".bam");

    for f in spec_files:
        assert os.path.isfile(spec_files[f]), "\nCANNOT FIND FILE: " + spec_files[f] + "\n";
    if args.file_check:
        return 0,0;

    # print(s_mod,1);
    scaff_lens, total_asm_len = {}, 0.0;
    for line in open(spec_files['asm-index']):
        line = line.strip().split("\t");
        scaff, scaff_len = line[0], int(line[1]);
        scaff_lens[scaff] = scaff_len;
        total_asm_len += scaff_len

    outline['num-scaffs'] = len(scaff_lens);
    outline['avg-scaff-len'] = float(sum(scaff_lens.values())) / float(len(scaff_lens));
    outline['asm-len'] = total_asm_len;
    # Scaffold counts and lengths

    # print(s_mod,2);
    len_sum, num_scaffs = 0.0, 0;
    seq_lens = sorted(list(scaff_lens.values()), reverse=True);
    for seq_len in seq_lens:
        len_sum += seq_len;
        num_scaffs += 1;
        if len_sum / total_asm_len >= 0.5:
            outline['asm-n50'] = seq_len;
            outline['asm-l50'] = num_scaffs;
            break;
    # Calculate N50 and L50

    # print(s_mod,3);
    flag_result = readFlag(spec_files['asm-flag']);
    outline['asm-reads-mapped'], outline['asm-perc-reads-mapped'], outline['asm-paired-mapped'], outline['asm-perc-paired-mapped'], outline['asm-pair-mapped-diff-chr'], outline['asm-single-mapped'], outline['asm-perc-single-mapped'] = flag_result;
    # Get number of reads mapped from flagstat file
    
    samtools_view_cmd = "samtools view -f 1024 -c " + spec_files['asm-bam'];
    outline['asm-duplicate-reads'] = runCMD(samtools_view_cmd);
    # Count the number of duplicate reads in the BAM file.    

    # print(s_mod,4);
    total_depth_sum, total_depth_sites = 0.0, 0.0;
    start_depth_sum, start_depth_sites = 0.0, 0.0;
    mid_depth_sum, mid_depth_sites = 0.0, 0.0;
    end_depth_sum, end_depth_sites = 0.0, 0.0;
    for line in open(spec_files['asm-depth']):
        line = line.strip().split("\t");
        scaff, pos, depth = line;
        pos, depth = int(pos), float(depth);
        total_depth_sum += depth;
        total_depth_sites += 1.0;

        pos_perc = pos / scaff_lens[scaff]

        if pos_perc <= 0.1:
            start_depth_sum += depth;
            start_depth_sites += 1.0;
        elif 1 - pos_perc <= 0.1:
            end_depth_sum += depth;
            end_depth_sites += 1.0;
        else:
            mid_depth_sum += depth;
            mid_depth_sites += 1.0;

    outline['asm-avg-depth'] = total_depth_sum / total_depth_sites;
    outline['asm-avg-start-depth'] = start_depth_sum / start_depth_sites;
    outline['asm-avg-mid-depth'] = mid_depth_sum / mid_depth_sites;
    outline['asm-avg-end-depth'] = end_depth_sum / end_depth_sites;
    # Get read depth from assembly

    # print(s_mod,5);
    flag_result = readFlag(spec_files['mouse-flag']);
    outline['mouse-reads-mapped'], outline['mouse-perc-reads-mapped'], outline['mouse-paired-mapped'], outline['mouse-perc-paired-mapped'], outline['mouse-pair-mapped-diff-chr'], outline['mouse-single-mapped'], outline['mouse-perc-single-mapped'] = flag_result;
    # Get number of reads mapped to mouse from flagstat file     

    samtools_view_cmd = "samtools view -f 1024 -c " + spec_files['mouse-bam'];
    outline['mouse-duplicate-reads'] = runCMD(samtools_view_cmd);
    # Count the number of duplicate reads in the mouse BAM file.    

    # print(s_mod,6);
    flag_result = readFlag(spec_files['mouse-target-flag']);
    outline['mouse-target-reads-mapped'], outline['mouse-target-perc-reads-mapped'], outline['mouse-target-paired-mapped'], outline['mouse-target-perc-paired-mapped'], outline['mouse-target-pair-mapped-diff-chr'], outline['mouse-target-single-mapped'], outline['mouse-target-perc-single-mapped'] = flag_result;
    # Get number of reads mapped to mouse targets from flagstat file  

    # print(s_mod,7);
    mouse_depth_sum, mouse_depth_sites = 0.0, 0.0;
    for line in open(spec_files['mouse-depth']):
        depth = float(line.strip().split("\t")[2]);
        mouse_depth_sum += depth;
        mouse_depth_sites += 1.0;
    outline['mouse-avg-depth'] = mouse_depth_sum / mouse_depth_sites;
    # Get depth for all mapped reads to mouse.

    # print(s_mod,8);
    target_depth_sum = sum( [ float(line.strip().split("\t")[3]) for line in open(spec_files['mouse-target-depth']) ] );
    outline['mouse-target-avg-depth'] = target_depth_sum / total_target_len;
    # print(s_mod,9);

    low_scores = 0;
    for line in open(spec_files['referee-summary']):
        line = line.strip().split("\t");
        if line[0] == "# UNMAPPED POSITIONS:":
            outline['referee-unmapped-pos'] = line[1];
        if line[0] == "# ERRORS CORRECTED:":
            outline['referee-errors-corrected'] = line[1];           
        if line[0] == "# ERROR RATE PER BASE:":
            outline['referee-error-rate'] = line[1];
        if line[0] in ['-1','-2','-3']:
            low_scores += int(line[1]);
        outline['referee-low-scores'] = str(low_scores);

    flag_result = readFlag(spec_files['referee-flag']);
    outline['referee-reads-mapped'], outline['referee-perc-reads-mapped'], null1, null2, null3, null4, null5 = flag_result;
    # Get number of reads mapped from flagstat file
    
    samtools_view_cmd = "samtools view -f 1024 -c " + spec_files['referee-bam'];
    outline['referee-duplicate-reads'] = runCMD(samtools_view_cmd);
    # Count the number of duplicate reads in the BAM file.    

    # print(s_mod,4);
    total_depth_sum, total_depth_sites = 0.0, 0.0;
    start_depth_sum, start_depth_sites = 0.0, 0.0;
    mid_depth_sum, mid_depth_sites = 0.0, 0.0;
    end_depth_sum, end_depth_sites = 0.0, 0.0;
    for line in open(spec_files['referee-depth']):
        line = line.strip().split("\t");
        scaff, pos, depth = line;
        pos, depth = int(pos), float(depth);
        total_depth_sum += depth;
        total_depth_sites += 1.0;

        pos_perc = pos / scaff_lens[scaff]

        if pos_perc <= 0.1:
            start_depth_sum += depth;
            start_depth_sites += 1.0;
        elif 1 - pos_perc <= 0.1:
            end_depth_sum += depth;
            end_depth_sites += 1.0;
        else:
            mid_depth_sum += depth;
            mid_depth_sites += 1.0;

    outline['referee-avg-depth'] = total_depth_sum / total_depth_sites;
    outline['referee-avg-start-depth'] = start_depth_sum / start_depth_sites;
    outline['referee-avg-mid-depth'] = mid_depth_sum / mid_depth_sites;
    outline['referee-avg-end-depth'] = end_depth_sum / end_depth_sites;
    # Get read depth from assembly


    total_ins, total_dels, total_complex = 0,0,0;
    for line in open(spec_files['unfiltered-vcf']):
        if line[0] == "#":
            continue;

        line = line.strip().split("\t");
        ref, alt = line[3], line[4];

        if len(ref) == 1 and len(alt) > 1:
            total_ins += 1;
        if len(ref) > 1 and len(alt) == 1:
            total_dels += 1;
        if len(ref) > 1 and len(alt) > 1:
            total_complex += 1;
    outline['ins-removed'] = total_ins;
    outline['dels-removed'] = total_dels;
    outline['complex-removed'] = total_complex;
    # Counting indels

    total_snps, filtered_snps = 0,0;
    for line in gzip.open(spec_files['filtered-vcf']):
        line = line.decode();
        if line[0] == "#":
            continue;
        total_snps += 1;
        if "Filter" in line:
            filtered_snps += 1;
    outline['total-snps'] = total_snps;
    outline['filtered-snps'] = filtered_snps;
    # Counting SNPs

    return s_mod, outline;

############################################################

parser = argparse.ArgumentParser(description="Gets stats from a bunch of spades assemblies.");
parser.add_argument("-s", dest="spec", help="A species to generate a command for. Default: all", default="all");
parser.add_argument("-r", dest="runtype", help="The sequencing run to generate commands for. Default: all.", default="all");
parser.add_argument("-p", dest="procs", help="The number of species to count at once. Default: 1", type=int, default=1);
parser.add_argument("--filecheck", dest="file_check", help="Set to simply check if all the files exist for each species.", action="store_true");
args = parser.parse_args();
# Input options.

if args.procs < 1:
    sys.exit("* ERROR: -p must be a postive integer.");

seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

assembly_dir = "../../01-Assembly-data/05-Scaffolds/";
map_dir = "../../01-Assembly-data/06-Map/";
ref_dir = "../../01-Assembly-data/08-Referee/";
ref_map_dir = "../../01-Assembly-data/09-Remap/";
vcf_dir = "../../01-Assembly-data/10-Varcall/";
target_file = os.path.abspath("../../Targets/targets-mm10-coords.bed");
outfilename = "spades-stats.csv";
pad = 30;

total_target_len = 0.0;
for line in open(target_file):
    line = line.strip().split("\t");
    total_target_len += (float(line[2]) - float(line[1]));

runtype, runstrs = mfiles.parseRuntypes(args.runtype, seq_run_ids);
# Parse the input run types.

specs = mfiles.parseSpecs(args.spec, specs_ordered)
specs = [ s for s in specs if "(no WGA)" not in s and "pos_ctrl" not in s ];
specs = [ s for s in specs if any(r in spec_ids[s] for r in runtype) ];
# Parse the input species.

with open(outfilename, "w") as outfile, mp.Pool(processes=args.procs) as pool:
    mcore.runTime("# Rodent assembly and mapping stats", outfile);
    mcore.PWS(mcore.spacedOut("# Total species:", pad) + str(len(specs)), outfile);
    mcore.PWS(mcore.spacedOut("# Total target length:", pad) + str(total_target_len), outfile);
    mcore.PWS(mcore.spacedOut("# Mapping directory:", pad) + map_dir, outfile);
    mcore.PWS(mcore.spacedOut("# Assembly directory:", pad) + assembly_dir, outfile);
    mcore.PWS(mcore.spacedOut("# Output file:", pad) + outfilename, outfile);
    mcore.PWS("# ----------", outfile);

    cols = [ 'num-scaffs', 'avg-scaff-len', 'asm-len', 'asm-n50', 'asm-l50',
                'asm-reads-mapped', 'asm-perc-reads-mapped',
                'asm-paired-mapped', 'asm-perc-paired-mapped', 'asm-pair-mapped-diff-chr',
                'asm-single-mapped', 'asm-perc-single-mapped',
                'asm-duplicate-reads',
                'asm-avg-depth', 'asm-avg-start-depth', 'asm-avg-mid-depth', 'asm-avg-end-depth',
                'mouse-reads-mapped', 'mouse-perc-reads-mapped',
                'mouse-paired-mapped', 'mouse-perc-paired-mapped', 'mouse-pair-mapped-diff-chr',
                'mouse-single-mapped', 'mouse-perc-single-mapped',
                'mouse-duplicate-reads',
                'mouse-target-reads-mapped', 'mouse-target-perc-reads-mapped',
                'mouse-target-paired-mapped', 'mouse-target-perc-paired-mapped', 'mouse-target-pair-mapped-diff-chr',
                'mouse-target-single-mapped', 'mouse-target-perc-single-mapped',
                'mouse-avg-depth', 'mouse-target-avg-depth',
                'referee-unmapped-pos', 'referee-errors-corrected', 'referee-error-rate', 'referee-low-scores',
                'referee-reads-mapped', 'referee-perc-reads-mapped', 'referee-duplicate-reads', 
                'referee-avg-depth', 'referee-avg-start-depth', 'referee-avg-mid-depth', 'referee-avg-end-depth',
                'ins-removed', 'dels-removed', 'complex-removed', 'total-snps', 'filtered-snps' ];
    # Long output headers

    outfile.write("species," + ",".join(cols) + "\n");

    outlines = {};
    chunk_num, spec_num = 1, 1;

    cur_specs = [];
    for spec in specs:
        print(str(chunk_num) + "-" + str(spec_num) + " " + spec);
        spec_num += 1;

        cur_specs.append(spec);
        if len(cur_specs) == args.procs:
            for result in pool.starmap(parallelParse, ((s, total_target_len) for s in cur_specs)):
                if not args.file_check:
                    outlines[result[0]] = result[1];
                else:
                    continue;
            chunk_num += 1;
            cur_specs = [];

    if cur_specs != []:
        for result in pool.starmap(parallelParse, ((s, total_target_len) for s in cur_specs)):
                if not args.file_check:
                    outlines[result[0]] = result[1];
                else:
                    continue;
    
    if args.file_check:
        sys.exit();

    for spec in specs_ordered:
        if spec in specs:
            s_mod = spec.replace(" ", "-")
            outline = s_mod + "," + ",".join([ str(outlines[s_mod][col]) for col in cols ]);
            mcore.PWS(outline, outfile);

    #print(spec, outlines[spec]);
# outline = [ str(outline[col]) for col in cols ];
# print(s_mod + "," + ",".join(outline));
# sys.exit();









# def faLens(fa_file, curline, seqtype, k, lenfile):
#     len_sum = 0;
#     seqs = core.fastaGetDict(fa_file);
#     for title in seqs:
#         curlen = len(seqs[title]);
#         if seqtype == "scaffold":
#             lenfile.write(k + "," + str(curlen) + "\n");
#         len_sum += curlen;

#     curline[seqtype + ' avg len'] = str(float(len_sum) / float(len(seqs)));

#     return curline;

# def getStats(sfile, spec, stype):
#     curline = [spec, stype];

#     seqs = core.fastaGetDict(sfile);
#     seq_lens = [ len(seqs[t]) for t in seqs ];

#     total_seqs = len(seq_lens);
#     total_seq_len = sum(seq_lens);

#     curline.append(total_seqs);
#     curline.append( float(total_seq_len) / float(total_seqs) );
    
#     len_sum = 0;
#     num_scaffs = 0;
#     #seq_lens = sorted(seq_lens.items(), key=lambda kv: kv[1], reverse=True);
#     seq_lens = sorted(seq_lens, reverse=True);
#     for seq_len in seq_lens:
#         num_scaffs += 1;
#         len_sum += seq_len;
#         if len_sum / total_seq_len >= 0.5:
#             n50 = seq_len;
#             l50 = num_scaffs;
#             break;

#     curline.append(n50);
#     curline.append(l50);

#     return(curline);
        # cur_line = [s_mod, s, "scaffolds" ];

        # spec_info = {};
        # seq_lens, mean_depths = [], [];
        # first = True;
        # for line in open(spec_mosdepth_scaff):
        #     if first:
        #         first = False;
        #         continue;

        #     if line.startswith("total"):
        #         continue;
        #     #print(line);

        #     line = line.strip().split("\t");
        #     scaff, length, bases, mean, mindepth, maxdepth = line;
        #     spec_info[scaff] = {'len' : float(length), 'bases' : int(bases), 'mean' : float(mean), 'min' : int(mindepth), 'max' : int(maxdepth) };
        #     seq_lens.append(float(length));
        #     mean_depths.append(float(mean));

        # total_seqs = len(spec_info);
        # total_seq_len = float(sum(seq_lens));
        # # Get total seqs and total length

        # cur_line.append(total_seqs);
        # cur_line.append(total_seq_len / total_seqs);
        # # Append num seqs and avg. length to output line
        


        # flag_lines = open(spec_flagstat, "r").read().split("\n");
        # reads_line = flag_lines[4].split(" ");
        # num_reads_mapped = reads_line[0]
        # perc_reads_mapped = reads_line[4].replace("(", "").replace("%", "");
        # cur_line.append(num_reads_mapped);
        # cur_line.append(perc_reads_mapped);
        # # Get number of reads mapped from flagstat file

        # depth_sum, num_bases = 0.0, 0.0;
        # for line in open(spec_samtools_depth):
        #     line = line.strip().split("\t");
        #     num_bases += 1;
        #     depth_sum += float(line[2]);
        # avg_depth = depth_sum / num_bases;
        # cur_line.append(avg_depth);
        # # Samtools per base depth to spades assembly

        # depth_sum, num_bases = 0.0, 0.0;
        # for line in gzip.open(spec_mosdepth_base):
        #     line = line.decode().strip().split("\t");
        #     cur_bases = float(line[2]) - float(line[1]);
        #     cur_depth = cur_bases * float(line[3]);
        #     num_bases += cur_bases;
        #     depth_sum += cur_depth;
        # avg_depth = depth_sum / num_bases;
        # cur_line.append(avg_depth);
        # # Mosdepth per base depth to spades assembly

        # avg_depth = float(sum(mean_depths)) / float(len(mean_depths));
        # cur_line.append(avg_depth);
        # # Mosdepth per scaffold depth (from reading scaffold file above) to spades assembly

        # flag_lines = open(spec_flagstat_mouse, "r").read().split("\n");
        # reads_line = flag_lines[4].split(" ");
        # num_reads_mapped = reads_line[0]
        # perc_reads_mapped = reads_line[4].replace("(", "").replace("%", "");
        # cur_line.append(num_reads_mapped);
        # cur_line.append(perc_reads_mapped);
        # # Get number of reads mapped to mouse targets from flagstat file.

        # depth_sum, num_bases = 0.0, 0.0;
        # for line in open(spec_samtools_depth_mouse):
        #     line = line.strip().split("\t");
        #     num_bases += 1;
        #     depth_sum += float(line[2]);
        # avg_depth = depth_sum / num_bases;
        # cur_line.append(avg_depth);
        # # Samtools per base depth to mouse targets

        # depth_sum, num_bases = 0.0, 0.0;
        # for line in gzip.open(spec_mosdepth_mouse):
        #     line = line.decode().strip().split("\t");
        #     cur_bases = float(line[2]) - float(line[1]);
        #     cur_depth = cur_bases * float(line[3]);
        #     num_bases += cur_bases;
        #     depth_sum += cur_depth;
        # avg_depth = depth_sum / num_bases;
        # cur_line.append(avg_depth);
        # # Mosdepth per target to mouse targets

        # outline = ",".join([ str(o) for o in cur_line ]);
        # print(outline);
        # outfile.write(outline + "\n");
        # #sys.exit();






