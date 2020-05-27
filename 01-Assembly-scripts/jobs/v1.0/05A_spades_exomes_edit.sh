# PYTHON VERSION: 3.6.6
# Script call: 05A_spades_cmd_generator.py -n 05A_spades_exomes -part good_lab_small_cpu -tasks 2 -cpus 3 -mem 0
# Runtime: 04/06/2020 11:14:46
# ----------
# STEP INFO
# Current step:           05A-Spades
# Previous step:          04A-Dedup
# ----------
# I/O INFO
# Input directory:        /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup
# Output directory:       /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05A-Spades
# Species:                all
# Seq runs:               seq-run-4
# Job name:               05A_spades_exomes
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/05A-Spades-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/05A_spades_exomes.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/05A_spades_exomes_submit.sh
# SLURM partition:        good_lab_small_cpu
# SLURM ntasks:           2
# SLURM cpus-per-task:    16
# SLURM mem:              0
# ----------
# THIS FILE CONTAINS THE EDITED COMMANDS FOR THE THREE SPECIES THAT ERRORED OUT.
# THESE COMMANDS USE ONLY THE HISEQ4000 LIBRARIES FOR ASSEMBLY
time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05A-Spades/Rattus-hoffmanni -k 21,33,55,77,99,127 --careful --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Rattus-hoffmanni/hiseq4000-paired-2/SM074_CKDL190143345-1a-D709-AK1682_H7275BBXX_L4_.fastp.decon.merged.dedup.fastq.gz --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Rattus-hoffmanni/hiseq4000-paired-2/SM074_CKDL190143345-1a-D709-AK1682_H7275BBXX_L4_R1_.fastp.decon.unmerged.dedup.fastq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Rattus-hoffmanni/hiseq4000-paired-2/SM074_CKDL190143345-1a-D709-AK1682_H7275BBXX_L4_R2_.fastp.decon.unmerged.dedup.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/05A-Spades-logs/Rattus-hoffmanni-spades.log
time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05A-Spades/Taeromys-punicans -k 21,33,55,77,99,127 --careful --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Taeromys-punicans/hiseq4000-paired-1/SM077_CKDL190143344-1a-D706-AK1780_H7275BBXX_L3_.fastp.decon.merged.dedup.fastq.gz --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Taeromys-punicans/hiseq4000-paired-1/SM077_CKDL190143344-1a-D706-AK1780_H7275BBXX_L3_R1_.fastp.decon.unmerged.dedup.fastq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Taeromys-punicans/hiseq4000-paired-1/SM077_CKDL190143344-1a-D706-AK1780_H7275BBXX_L3_R2_.fastp.decon.unmerged.dedup.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/05A-Spades-logs/Taeromys-punicans-spades.log
#time -p spades.py -o /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/05A-Spades/Margaretamys-parvus -k 21,33,55,77,99,127 --careful --pe1-m /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Margaretamys-parvus/hiseq4000-paired-1/SM062_CKDL190143344-1a-DY0088-AK1780_H7275BBXX_L3_.fastp.decon.merged.dedup.fastq.gz --pe1-1 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Margaretamys-parvus/hiseq4000-paired-1/SM062_CKDL190143344-1a-DY0088-AK1780_H7275BBXX_L3_R1_.fastp.decon.unmerged.dedup.fastq.gz --pe1-2 /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/04A-Dedup/Margaretamys-parvus/hiseq4000-paired-1/SM062_CKDL190143344-1a-DY0088-AK1780_H7275BBXX_L3_R2_.fastp.decon.unmerged.dedup.fastq.gz &> /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/05A-Spades-logs/Margaretamys-parvus-spades.log
