#!/usr/bin/python3
############################################################
# For rodent exomes, 07.2020
# Packages the draft assemblies for upload to box
############################################################

import sys, os, core

############################################################

indir = "../../01-Assembly-data/05-Spades/";
outdir = "../../01-Assembly-data/draft-contigs-132/";

count = 0;
for s in os.listdir(indir):
    specdir = os.path.join(indir, s);
    assembly = os.path.join(specdir, "contigs.fasta");
    if not os.path.isfile(assembly):
        continue;

    #assembly_outdir = os.path.join(outdir, s);
    #if not os.path.isdir(assembly_outdir);
    #    os.system("mkdir " + assembly_outdir);


    #outfile = os.path.join(assembly_outdir, s + ".fa");
    #checksum = os.path.join(assembly_outdir, "md5sum.txt");

    outfile = os.path.join(outdir, s + ".fa");

    cp_cmd = "cp " + assembly + " " + outfile;
    print(cp_cmd);
    os.system(cp_cmd);
    count += 1;

print(count);

# checksum = os.path.join(outdir, "checksums");
# md5_cmd = "md5sum " + " ".join(os.listdir(outdir)) + " > " + checksum;
# print(md5_cmd);
#os.system(md5_cmd);