#!/bin/bash
# Rodent Spades commands
# PYTHON VERSION: 3.6.10
# Script call:    05_spades_cmd_generator.py -r 0,1,2,3,4,5,6,7,8,9,10 -n 05_exome_spades -part good_lab_large_cpu -nodes 12 -tasks 12 -cpus 16 --overwrite
# Runtime:        06/21/2020 21:16:49
# ----------------
# STEP INFO
# Current step:           05-Spades
# Previous step:          04-Cat-fastq
# ----------
# I/O INFO
# Input directory:        /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Cat-fastq
# Output directory:       /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05-Spades
# Spades path:            spades.py
# Species:                all
# Seq runs:               hiseq4000-paired-2
# Job name:               05_exome_spades
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/05-Spades-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/05_exome_spades.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/05_exome_spades_submit.sh
# SLURM partition:        good_lab_large_cpu
# SLURM nodes:            12
# SLURM ntasks:           12
# SLURM cpus-per-task:    16
# SLURM mem:              0
# ----------
# BEGIN CMDS
