#!/bin/bash
# Rodent merge commands
# PYTHON VERSION: 3.6.10
# Script call:    04_merge_cmd_generator.py -s Zyzomys argurus,Zyzomys maini,Zyzomys palatalis,Zyzomys pedunculatus,Zyzomys woodwardi -n 04_exome_merge_sample -part good_lab_reincarnation -tasks 5 -cpus 1 -mem 200000 --overwrite
# Runtime:        06/10/2020 13:03:51
# ----------------
# STEP INFO
# Current step:           04-Merged
# Previous step:          03-Dedup
# ----------
# I/O INFO
# Input directory:        /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup
# Output directory:       /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged
# bbmerge.sh path:        bbmerge.sh
# Species:                Zyzomys argurus,Zyzomys maini,Zyzomys palatalis,Zyzomys pedunculatus,Zyzomys woodwardi
# Seq runs:               all
# Job name:               04_exome_merge_sample
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/04_exome_merge_sample.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/04_exome_merge_sample_submit.sh
# SLURM partition:        good_lab_reincarnation
# SLURM ntasks:           5
# SLURM cpus-per-task:    1
# SLURM mem:              200000
# ----------
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-1/52946_BH7T33BCX2_AACGACC_S9_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-argurus-merge-1.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-argurus-merge-2.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-argurus/seq-run-2/52946_BH7T77BCX2_AACGACC_S9_L002_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-argurus-merge-3.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-1/52947_BH7T33BCX2_CCAGCGG_S10_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-maini-merge-1.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-maini-merge-2.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-maini/seq-run-2/52947_BH7T77BCX2_CCAGCGG_S10_L002_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-maini-merge-3.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-1/52949_BH7T33BCX2_TGGCAAT_S12_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-palatalis-merge-1.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-palatalis-merge-2.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-palatalis/seq-run-2/52949_BH7T77BCX2_TGGCAAT_S12_L002_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-palatalis-merge-3.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-1/52948_BH7T33BCX2_TAGTTCC_S11_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-pedunculatus-merge-1.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-pedunculatus-merge-2.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-pedunculatus/seq-run-2/52948_BH7T77BCX2_TAGTTCC_S11_L002_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-pedunculatus-merge-3.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-1/52950_BH7T33BCX2_CGTATAT_S13_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-woodwardi-merge-1.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L001_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-woodwardi-merge-2.log
bbmerge.sh -Xmx15g t=1 in1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_001_R1_.fastp.decon.fastq.gz in2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/03-Dedup/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_001_R2_.fastp.decon.fastq.gz verystrict=t rem k=60 extend2=60 ecct outu1=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_001_R1_.fastp.decon.unmerged.fastq.gz outu2=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_001_R2_.fastp.decon.unmerged.fastq.gz out=/mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04-Merged/Zyzomys-woodwardi/seq-run-2/52950_BH7T77BCX2_CGTATAT_S13_L002_001_.fastp.decon.merged.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/04-Merged-logs/Zyzomys-woodwardi-merge-3.log
