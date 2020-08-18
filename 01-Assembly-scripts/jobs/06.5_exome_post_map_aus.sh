#!/bin/bash
# Rodent mapping commands
# PYTHON VERSION: 3.6.10
# Script call:    06.5_postmap_cmd_generator.py -r 11,12,13,14 -n 06.5_exome_post_map_aus -part good_lab_cpu -tasks 20 -cpus 1 --overwrite
# Runtime:        08/18/2020 10:09:12
# ----------------
# STEP INFO
# Current step:           BAM merging
# Input directory:        /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map
# Species job directory:  /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs
# Species:                all
# Job name:               06.5_exome_post_map_aus
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5_exome_post_map_aus.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/06.5_exome_post_map_aus_submit.sh
# SLURM partition:        good_lab_cpu
# SLURM ntasks:           20
# SLURM cpus-per-task:    1
# SLURM mem:              0
# ----------
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Conilurus-albipes-NMV-c7585-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Conilurus-penicillatus-M14056-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Leggadina-forresti-WAMM62323-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Leggadina-lakedownensis-WAMM21623-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Leporillus-apicalis-C90-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Leporillus-conditor-ABTC13335-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mastacomys-fuscus-M13957-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mastacomys-fuscus-NMV-C37546-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mesembriomys-gouldii-ABTC7449-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mesembriomys-macrurus-ABTC7337-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-alexis-U1308-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-amplus-NMV-C512-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-aquilo-M-32455-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-cervinus-M22857-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-fuscus-M22830-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-longicaudatus-C6278-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-macrotis-ZD-1841-1167-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-mitchelli-ABTC94521-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Notomys-mitchellii-M21518-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-patrius-JM10865-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-pilligaensis-ABTC18120-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-shortridgei-M7890-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-shortridgei-M62127-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-shortridgei-Z25113-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-colletti-RAT25-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-tunneyi-RAT130-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Zyzomys-argurus-ABTC61630-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Zyzomys-maini-ABTC07900-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Zyzomys-palatalis-ABTC30744-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Zyzomys-pedunculatus-Z34925-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Zyzomys-woodwardi-WAMM21724-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-albocinereus-WAMM18855-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-apodemoides-M16672-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-auritus-1846-4-4-67-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-australis-M25541-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-bolami-ABTC08077-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-bolami-ABTC107389-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-calabyi-U4324-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-calabyi-WAMM56280-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-chapmani-WAMM29440-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-delicatulus-JM18363-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-delicatulus-M29247-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-delicatulus-U1509-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-delicatulus-WAMM29247-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-desertor-ABTC41464-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-fieldi-ABTC08164-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-fumeus-ABTC08168-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-gouldii-C955-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-gracilicaudatus-ABTC08163-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-hermannsburgensis-ABTC08067-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-higginsi-UC1421-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-johnsoni-ABTC08053-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-nanus-U1448-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-novaehollandiae-ABTC08140-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-novaehollandiae-NMV-C22127-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-occidentalis-ABTC08043-post-map.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudomys-oralis-RAT7-post-map.sh
