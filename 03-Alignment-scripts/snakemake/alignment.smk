#############################################################################
# Pipeline for read mapping simulations with varying divergence
#############################################################################

import os
import re

#############################################################################
# Example cmd

# snakemake -p -s alignment.smk --configfile coding-morphofacial-cfg.yaml --profile profiles/slurm_profile/ --keep-going --dryrun

#############################################################################
# Input and output info

work_dir = os.path.dirname(__file__);
print("working dir: " + work_dir);

dataset = config["dataset"];
print("dataset: " + dataset)

print("reading seq ids...");
seq_base_dir = config["seq_dir"];
nt_seq_dir = os.path.join(seq_base_dir, "nt");
aa_seq_dir = os.path.join(seq_base_dir, "aa");
pids = [ f.split(".")[0] for f in os.listdir(aa_seq_dir) if f.endswith(".fa") ];
print(len(pids), "seq ids read");
# The directory containing nucleotide (CDS) alignments

base_out_dir = config["out_dir"];

backtranslate_path = os.path.join(os.path.dirname(work_dir), "05_backtranslate.py");

#############################################################################
# Final rule - rule that depends on final expected output file and initiates all
# the other rules

localrules: all

rule all:
    input:
        expand(os.path.join(base_out_dir, "nt", "{pid}-mafft.fa"), pid=pids)
        # Expected output from rule backtranslate

        #expand(os.path.join(base_out_dir, "aa", "{pid}-mafft.fa"), pid=pids)
        # Expected output from rule mafft

## The final expected outputs should be listed in this rule. Only necessary to list final output from final rule, but I found it useful to list them 
## for all rules for debugging (can comment out outputs for rules you don't want to run), though there's also probably a better way to do this

#############################################################################
# Pipeline rules

rule mafft:
    input:
        os.path.join(aa_seq_dir, "{pid}.fa"),
    output:
        os.path.join(base_out_dir, "aa", "{pid}-mafft.fa")
    log:
        os.path.join(base_out_dir, "logs", "{pid}-mafft.log")
    shell:
        """
        mafft --adjustdirection --preservecase {input} 2> {log} 1> {output}
        """
# Run each locus through absrel

#################

rule backtranslate:
    input:
        aa_alns = os.path.join(base_out_dir, "aa", "{pid}-mafft.fa"),
        nt_seqs = os.path.join(nt_seq_dir, "{pid}.fa"),
    output:
        nt_alns = os.path.join(base_out_dir, "nt", "{pid}-mafft.fa")
    params:
        script = backtranslate_path,
        aa_aln_dir = os.path.join(base_out_dir, "aa"),
        nt_seq_dir = nt_seq_dir,
        nt_aln_dir = os.path.join(base_out_dir, "nt"),
        log = os.path.join(base_out_dir, "logs", dataset + "-backtranslate.log")
    shell:
        """
        python {params.script} -aa {params.aa_aln_dir} -nt {params.nt_seq_dir} -o {params.nt_aln_dir} --overwrite &> {params.log}
        """