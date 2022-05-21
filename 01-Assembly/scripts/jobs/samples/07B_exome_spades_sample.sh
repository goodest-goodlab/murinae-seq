#!/bin/bash
# Rodent Spades commands
# PYTHON VERSION: 3.6.10
# Script call:    07B_spades_cmd_generator.py -s Zyzomys argurus,Zyzomys maini,Zyzomys palatalis,Zyzomys pedunculatus,Zyzomys woodwardi -n 07B_exome_spades_sample -part good_lab_cpu -tasks 3 -cpus 16 --overwrite
# Runtime:        06/14/2020 10:09:19
# ----------------
# STEP INFO
# Current step:           07B-Spades
# Previous step:          06B-Merged-fastq
# ----------
# I/O INFO
# Input directory:        /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq
# Output directory:       /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/07B-Spades
# Spades path:            spades.py
# Species:                Zyzomys argurus,Zyzomys maini,Zyzomys palatalis,Zyzomys pedunculatus,Zyzomys woodwardi
# Seq runs:               seq-run-4
# Job name:               07B_exome_spades_sample
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/07B-Spades-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/07B_exome_spades_sample.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/07B_exome_spades_sample_submit.sh
# SLURM partition:        good_lab_cpu
# SLURM ntasks:           3
# SLURM cpus-per-task:    16
# SLURM mem:              0
# ----------
# BEGIN CMDS
time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/07B-Spades/Zyzomys-argurus -k 21,33,55,77,99,127 --careful --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-argurus/Zyzomys-argurus-paired-1.fq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-argurus/Zyzomys-argurus-paired-2.fq.gz --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-argurus/Zyzomys-argurus-merged.fq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/07B-Spades-logs/Zyzomys-argurus-spades.log
time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/07B-Spades/Zyzomys-maini -k 21,33,55,77,99,127 --careful --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-maini/Zyzomys-maini-paired-1.fq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-maini/Zyzomys-maini-paired-2.fq.gz --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-maini/Zyzomys-maini-merged.fq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/07B-Spades-logs/Zyzomys-maini-spades.log
time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/07B-Spades/Zyzomys-palatalis -k 21,33,55,77,99,127 --careful --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-palatalis/Zyzomys-palatalis-paired-1.fq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-palatalis/Zyzomys-palatalis-paired-2.fq.gz --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-palatalis/Zyzomys-palatalis-merged.fq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/07B-Spades-logs/Zyzomys-palatalis-spades.log
time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/07B-Spades/Zyzomys-pedunculatus -k 21,33,55,77,99,127 --careful --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-pedunculatus/Zyzomys-pedunculatus-paired-1.fq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-pedunculatus/Zyzomys-pedunculatus-paired-2.fq.gz --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-pedunculatus/Zyzomys-pedunculatus-merged.fq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/07B-Spades-logs/Zyzomys-pedunculatus-spades.log
time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/07B-Spades/Zyzomys-woodwardi -k 21,33,55,77,99,127 --careful --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-woodwardi/Zyzomys-woodwardi-paired-1.fq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-woodwardi/Zyzomys-woodwardi-paired-2.fq.gz --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06B-Merged-fastq/Zyzomys-woodwardi/Zyzomys-woodwardi-merged.fq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/07B-Spades-logs/Zyzomys-woodwardi-spades.log
