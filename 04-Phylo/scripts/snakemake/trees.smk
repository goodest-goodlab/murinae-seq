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

print("reading aln ids...");
aln_dir = config["aln_dir"];
pids = [ f.split(".fa")[0] for f in os.listdir(aln_dir) if f.endswith(".fa") ];
print(len(pids), "aln ids read");
# The directory containing nucleotide (CDS) alignments

bootstrap_reps = config["bootstrap_reps"];
print("bootstrap reps: " + str(bootstrap_reps));

base_out_dir = config["out_dir"];

#############################################################################
# Final rule - rule that depends on final expected output file and initiates all
# the other rules

localrules: all

rule all:
    input:
        expand(os.path.join(base_out_dir, "loci", "{pid}", "{pid}.treefile"), pid=pids),
        # Expected output from rule iqtree_loci

        #os.path.join(base_out_dir, "concat", dataset + ".treefile"),
        # Expected output from rule iqtree_concat

        #os.path.join(base_out_dir, dataset + "-loci.teefile"),
        # Expected output from rule cat_loci_trees

        #os.path.join(base_out_dir, "astral", dataset + "-astral.tre"),
        # Expected output from rule astral

        #os.path.join(base_out_dir, "astral-concord", dataset + ".cf.tree")
        # Expected output from rule iqtree_concordance

## The final expected outputs should be listed in this rule. Only necessary to list final output from final rule, but I found it useful to list them 
## for all rules for debugging (can comment out outputs for rules you don't want to run), though there's also probably a better way to do this

#############################################################################
# Pipeline rules

rule iqtree_loci:
    input:
        os.path.join(aln_dir, "{pid}.fa"),
    output:
        os.path.join(base_out_dir, "loci", "{pid}", "{pid}.treefile")
    params:
        prefix = os.path.join(base_out_dir, "loci", "{pid}", "{pid}"),
        bs = bootstrap_reps
    log:
        os.path.join(base_out_dir, "loci", "{pid}", "{pid}.log")
    resources:
        cpus = 1
    shell:
        """
        iqtree -s {input} --prefix {params.prefix} -B {params.bs} -T {resources.cpus} &> {log}
        """
# Run each locus through iqtree separately

#################

rule cat_loci_trees:
    input: 
        expand(os.path.join(base_out_dir, "loci", "{pid}", "{pid}.treefile"), pid=pids)
    output:
        os.path.join(base_out_dir, dataset + "-loci.teefile")
    params:
        tree_dir = os.path.join(base_out_dir, "loci")
    shell:
        """
        cat {params.tree_dir}/*/*.treefile > {output}
        """

#################

rule iqtree_concat:
    input:
        aln_dir
    output:
        os.path.join(base_out_dir, "concat", dataset + ".treefile")
    params:
        prefix = os.path.join(base_out_dir, "concat", dataset),
        bs = bootstrap_reps
    log:
        os.path.join(base_out_dir, "concat", dataset + ".log")
    resources:
        cpus = 72,
        mem = "500g"
    shell:
        """
        iqtree -s {input} --prefix {params.prefix} -B {params.bs} -T {resources.cpus} &> {log}
        """
# Run each locus through iqtree concatenated

#################

rule astral:
    input:
        os.path.join(base_out_dir, dataset + "-loci.teefile")
    output:
        os.path.join(base_out_dir, "astral", dataset + "-astral.tre")
    params:
        outdir = os.path.join(base_out_dir, "astral")
    log:
        os.path.join(base_out_dir, "astral", dataset + "-astral.log")
    resources:
        time='200:00:00',
        mem = "32g"
    shell:
        """
        java -jar /home/gt156213e/bin/ASTRAL-5.7.1/Astral/astral.5.7.1.jar -i {input} -o {output} &> {log}
        """

#################

rule iqtree_concordance:
    input:
        loci_trees = os.path.join(base_out_dir, dataset + "-loci.teefile"),
        astral_tree = os.path.join(base_out_dir, "astral", dataset + "-astral.tre"),
        aligns = aln_dir
    output:
        os.path.join(base_out_dir, "astral-concord", dataset + ".cf.tree")
    params:
        prefix = os.path.join(base_out_dir, "astral-concord", dataset),
    log:
        os.path.join(base_out_dir, "astral-concord", dataset + ".log")
    resources:
        cpus = 1,
        mem = "32g"
    shell:
        """
        iqtree -t {input.astral_tree} --gcf {input.loci_trees} -s {input.aligns} --scf 100 --cf-verbose --prefix {params.prefix} -T {resources.cpus} &> {log}
        """
# Run each iqtree concordance analysis