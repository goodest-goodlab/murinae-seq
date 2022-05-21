#!/bin/bash
# Rodent variant commands
# PYTHON VERSION: 3.6.10
# Script call:    10_varcall_cmd_generator.py -n 10_exome_genotyping -part good_lab_reincarnation -tasks 20 -cpus 4 --overwrite
# Runtime:        09/29/2020 09:43:46
# ----------------
# STEP INFO
# Current step:           Variant calling
# Assembly directory:     /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/08-Referee
# Map directory:          /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/09-Remap
# Output directory:       /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/10-Varcall
# Species job directory:  /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs
# Species:                all
# Job name:               10_exome_genotyping
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/10-Varcall-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10_exome_genotyping.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/10_exome_genotyping_submit.sh
# SLURM partition:        good_lab_reincarnation
# SLURM ntasks:           20
# SLURM cpus-per-task:    4
# SLURM mem:              0
# ----------
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Apomys-lubangensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Bullimus-salomonseni-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Bulimus-bagobus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Chrotomys-mindorensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Phloeomys-pallidus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rhynchomys-isarogensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Sundamys-muelleri-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Taeromys-punicans-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hyorhinomys-stuempkei-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hybomys-univittatus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Colomys-goslingi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Malacomys-longipes-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hylomyscus-vulcanorum-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Praomys-degraaffi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Grammomys-dryas-LSUMZ37717-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Lemniscomys-striatus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Berylmys-bowersi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Crunomys-celebensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Echiothrix-centrosa-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Gracilimus-radix-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Leopoldomys-sabanus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Margaretamys-parvus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Melasmothrix-naso-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Paucidentomys-vermidax-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Sommeromys-macrorhinos-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Tateomys-macrocercus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Tateomys-rhinogradoides-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Waiomys-mamasae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Chiropodomys-gliroides-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Lorentzimys-nouhuysi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mastacomys-fuscus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Melomys-rufescens-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hydromys-chrysogaster-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Apodemus-sylvaticus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Archboldomys-luzonensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Bunomys-chrysocomus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Haeromys-minahassae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Maxomys-surifer-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Niviventer-lepturus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Paruromys-dominator-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Bunomys-andrewsi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-exulans-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-hoffmanni-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-leucopus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-lutreolus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Maxomys-musschenbroekii-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-praetor-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-villosissimus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-musculus-reference-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-musculus-musculus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-musculus-domesticus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-musculus-castaneus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-caroli-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-cervicolor-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-cookii-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-macedonicus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-minutoides-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-molossinus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-pahari-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-platythrix-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-spicilegus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-spretus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Coccymys-ruemmleri-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Grammomys-dryas-LSUMZ37716-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Carpomys-melanurus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Crateromys-heaneyi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Dasymys-montanus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Aethomys-hindei-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hylomyscus-stella-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Anisomys-imitator-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Crunomys-melanius-KU168403-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Niviventer-rapit-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Phloeomys-cumingi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Aethomys-nyikae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hybomys-planifrons-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pogonomys-macrourus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Musseromys-anacuao-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Limnomys-sibuanus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pithecheir-melanurus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Thamnomys-venustus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mammelomys-lanosus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Xenuromys-barbatus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hydromys-sp-nov-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Xeromys-myoides-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudohydromys-pumehanae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Leptomys-elegans-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pelomys-isseli-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Niviventer-bukit-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Genus-sp-nov-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Saxatilomys-paulinae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Crunomys-melanius-KU168558-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Microhydromys-richardsoni-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Uromys-caudimaculatus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mirzamys-louiseae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Papagomys-armandvillei-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Chiromyscus-chiropus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pogonomelomys-mayeri-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Paraleptomys-wilhelmina-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Oenomys-hypoxanthus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Bandicota-indica-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-xanthurus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Lenomys-meyeri-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Thamnomys-kempi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Parahydromys-asper-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-argentiventer-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Uromys-sp-nov-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Otomys-tropicalis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Niviventer-cremoriventer-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Otomys-denti-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Praomys-jacksoni-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Margaretamys-christinae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Dasymys-incomtus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Taeromys-callitrichus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hybomys-lunaris-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Sundamys-annandalei-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Nesokia-indica-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Macruromys-major-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mus-musculoides-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pelomys-minor-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Tarsomys-apoensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Batomys-russatus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Halmaheramys-bokimekot-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Chiruromys-vates-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Chrotomys-whiteheadi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Abeomelomys-sevia-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Berylmys-mackenzii-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Solomys-salebrosus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Zelotomys-woosnami-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Kadarsanomys-sodyi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mallomys-rothschildi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Taeromys-taerae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Vandeleuria-oleracea-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Conilurus-albipes-NMV-c7585-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Conilurus-penicillatus-M14056-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Leggadina-forresti-WAMM62323-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Leggadina-lakedownensis-WAMM21623-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Leporillus-apicalis-C90-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Leporillus-conditor-ABTC13335-varcall.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mastacomys-fuscus-M13957-varcall.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mastacomys-fuscus-NMV-C37546-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mesembriomys-gouldii-ABTC7449-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mesembriomys-macrurus-ABTC7337-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-alexis-U1308-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-amplus-NMV-C512-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-aquilo-M-32455-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-cervinus-M22857-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-fuscus-M22830-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-longicaudatus-C6278-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-macrotis-ZD-1841-1167-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-alexis-ABTC94521-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Notomys-mitchellii-M21518-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-patrius-JM10865-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-pilligaensis-ABTC18120-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-hermmannsburgensis-M7890-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-shortridgei-M62127-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-shortridgei-Z25113-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-colletti-RAT25-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-tunneyi-RAT130-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Zyzomys-argurus-ABTC61630-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Zyzomys-maini-ABTC07900-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Zyzomys-palatalis-ABTC30744-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Zyzomys-pedunculatus-Z34925-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Zyzomys-woodwardi-WAMM21724-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-albocinereus-WAMM18855-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-apodemoides-M16672-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-auritus-1846-4-4-67-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-australis-M25541-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-bolami-ABTC08077-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-bolami-ABTC107389-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-calabyi-U4324-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-johnsoni-WAMM56280-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-chapmani-WAMM29440-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-delicatulus-JM18363-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-delicatulus-M29247-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-delicatulus-U1509-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-delicatulus-WAMM29247-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-desertor-ABTC41464-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-fieldi-ABTC08164-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-fumeus-ABTC08168-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-gouldii-C955-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-gracilicaudatus-ABTC08163-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-hermannsburgensis-ABTC08067-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-higginsi-UC1421-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-johnsoni-ABTC08053-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-nanus-U1448-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-novaehollandiae-ABTC08140-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-novaehollandiae-NMV-C22127-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-occidentalis-ABTC08043-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Pseudomys-oralis-RAT7-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rattus-morotaiensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Hyomys-goliath-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mastomys-natalensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Crossomys-moncktoni-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Eropeplus-canus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Bunomys-torajae-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Taeromys-celebensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Taeromys-hamatus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Thallomys-paedulcus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Anonymomys-mindorensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Arvicanthus-neumanni-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Arvicanthus-niloticus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Dephomys-defua-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Heimyscus-fumosus-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Lophiomys-imhausi-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Lophuromys-woosnami-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Micaelemys-namaquensis-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Mylomys-dybowskii-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Myomyscus-verreauxii-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Rhabdomys-pumilio-varcall.sh
# source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/10-Varcall-jobs/Stochomys-longicaudatus-varcall.sh
