#!/bin/bash
# Rodent read cat commands
# PYTHON VERSION: 3.6.10
# Script call:    04AB_cat_fastq_cmd_generator.py -s Zyzomys argurus,Zyzomys maini,Zyzomys palatalis,Zyzomys pedunculatus,Zyzomys woodwardi -n 04AB_exome_cat_sample -part good_lab_reincarnation -tasks 15 -cpus 1 --overwrite
# Runtime:        06/09/2020 14:17:58
# ----------------
# STEP INFO
# Current step:           04AB-Merged-fastq
# Previous step:          03A-Merged
# ----------
# I/O INFO
# Input directory:        /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged
# Output directory:       /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq
# Species:                Zyzomys argurus,Zyzomys maini,Zyzomys palatalis,Zyzomys pedunculatus,Zyzomys woodwardi
# Seq runs:               seq-run-4
# Job name:               04AB_exome_cat_sample
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04AB-Merged-fastq-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/04AB_exome_cat_sample.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/04AB_exome_cat_sample_submit.sh
# SLURM partition:        good_lab_reincarnation
# SLURM ntasks:           15
# SLURM cpus-per-task:    1
# SLURM mem:              0
# ----------
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_R1_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-argurus/Zyzomys-argurus-paired-1.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_R2_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-argurus/Zyzomys-argurus-paired-2.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_001.fastp.decon.merged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-argurus/Zyzomys-argurus-merged.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_R1_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-maini/Zyzomys-maini-paired-1.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_R2_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-maini/Zyzomys-maini-paired-2.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_001.fastp.decon.merged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-maini/Zyzomys-maini-merged.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_R1_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-palatalis/Zyzomys-palatalis-paired-1.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_R2_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-palatalis/Zyzomys-palatalis-paired-2.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_001.fastp.decon.merged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-palatalis/Zyzomys-palatalis-merged.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_R1_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-pedunculatus/Zyzomys-pedunculatus-paired-1.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_R2_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-pedunculatus/Zyzomys-pedunculatus-paired-2.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_001.fastp.decon.merged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-pedunculatus/Zyzomys-pedunculatus-merged.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_R1_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_R1_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-woodwardi/Zyzomys-woodwardi-paired-1.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_R2_001.fastp.decon.unmerged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_R2_001.fastp.decon.unmerged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-woodwardi/Zyzomys-woodwardi-paired-2.fq.gz
zcat /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_001.fastp.decon.merged.fastq.gz /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03A-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_001.fastp.decon.merged.fastq.gz | gzip > /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04AB-Merged-fastq/Zyzomys-woodwardi/Zyzomys-woodwardi-merged.fq.gz
