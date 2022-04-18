#############################################################################
# Pipeline for read mapping simulations with varying divergence
#############################################################################

import os
import re

#############################################################################
# Example cmd

# snakemake -p -s selection.smk --dryrun --configfile coding-full-cfg.yaml --profile profiles/slurm_profile/

#############################################################################
# Input and output info

aln_dir = config["aln_dir"];
aln_ids = [ f.split("-")[0] for f in os.listdir(aln_dir) if f.endswith(".fa") ];
print(len(aln_ids), "aln ids read");
# The directory containing nucleotide (CDS) alignments

gene_tree_dir = config["gene_tree_dir"];
tree_suffix = config["tree_suffix"];

tree_dirs = os.listdir(gene_tree_dir);
tree_ids = [];
for tree_dir in tree_dirs:
    full_tree_dir = os.path.join(gene_tree_dir, tree_dir);
    cur_trees = [];
    for f in os.listdir(full_tree_dir):
        if f.endswith(tree_suffix):
            cur_trees.append(f);

    if len(cur_trees) > 1:
        sys.exit("ERROR: Too many trees: " + full_tree_dir);
    
    if cur_trees == []:
        print("No tree found:", tree_dir);
    else:
        tree_ids.append(cur_trees[0].split("-")[0]);
print(len(tree_ids), "tree ids read");
# The directory containing gene trees

prefix = config["out_prefix"];
# The prefix to add to the output directory for this run

base_out_dir = config["out_dir"];
# The base output directory for all selection tests run

print("get intersect");
pids = list(set(aln_ids).intersection(set(tree_ids)));
print(len(pids), "final ids ");

#############################################################################
# Final rule - rule that depends on final expected output file and initiates all
# the other rules

localrules: all

rule all:
    input:
        #expand(os.path.join(base_out_dir, prefix + "-absrel", "{pid}-mafft-cds.filter.json"), pid=pids),
        # Expected output from rule absrel
        #expand(os.path.join(base_out_dir, prefix + "-busted", "{pid}-mafft-cds.filter.json"), pid=pids)
        # Expected output from rule busted
        expand(os.path.join(base_out_dir, prefix + "-slac", "{pid}-mafft-cds.filter.json"), pid=pids)
        # Expected output from rule slac

## The final expected outputs should be listed in this rule. Only necessary to list final output from final rule, but I found it useful to list them 
## for all rules for debugging (can comment out outputs for rules you don't want to run), though there's also probably a better way to do this

#############################################################################
# Pipeline rules

rule absrel:
    input:
        aln = os.path.join(aln_dir, "{pid}-mafft-cds.filter.fa"),
        tree = os.path.join(gene_tree_dir, "{pid}-mafft-cds.filter", "{pid}" + tree_suffix)
    output:
        os.path.join(base_out_dir, prefix + "-absrel", "{pid}-mafft-cds.filter.json")
    log:
        os.path.join(base_out_dir, prefix + "-absrel", "logs", "{pid}-mafft-cds.filter.log")
    shell:
        """
        hyphy absrel --alignment {input.aln} --tree {input.tree} --output {output} &> {log}
        """
# Run each locus through absrel

#################

rule busted:
    input:
        aln = os.path.join(aln_dir, "{pid}-mafft-cds.filter.fa"),
        tree = os.path.join(gene_tree_dir, "{pid}-mafft-cds.filter", "{pid}" + tree_suffix)
    output:
        os.path.join(base_out_dir, prefix + "-busted", "{pid}-mafft-cds.filter.json")
    log:
        os.path.join(base_out_dir, prefix + "-busted", "logs", "{pid}-mafft-cds.filter.log")
    shell:
        """
        hyphy busted --alignment {input.aln} --tree {input.tree} --output {output} &> {log}
        """
# Run each locus through busted

#################

rule slac:
    input:
        aln = os.path.join(aln_dir, "{pid}-mafft-cds.filter.fa"),
        tree = os.path.join(gene_tree_dir, "{pid}-mafft-cds.filter", "{pid}" + tree_suffix)
    output:
        os.path.join(base_out_dir, prefix + "-slac", "{pid}-mafft-cds.filter.json")
    log:
        os.path.join(base_out_dir, prefix + "-slac", "logs", "{pid}-mafft-cds.filter.log")
    shell:
        """
        hyphy slac --alignment {input.aln} --tree {input.tree} --output {output} &> {log}
        """
# Run each locus through slac

#############################################################################