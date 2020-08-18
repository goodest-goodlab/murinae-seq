#!/bin/bash
# Rodent mapping commands
# PYTHON VERSION: 3.6.10
# Script call:    06.5_postmap_cmd_generator.py -r 1,2,3,4,5,6,7,8,9,10 -n 06.5_exome_post_map -ref mouse -part good_lab_cpu -tasks 20 -cpus 1 --overwrite
# Runtime:        08/16/2020 15:19:28
# ----------------
# STEP INFO
# Current step:           BAM merging
# Input directory:        /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-data/06-Map
# Species job directory:  /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs
# Species:                all
# Job name:               06.5_exome_post_map
# Logfile directory:      /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/logs/06.5-Post-map-logs
# Job file:               /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5_exome_post_map-mouse.sh
# ----------
# SLURM OPTIONS
# Submit file:            /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/submit/06.5_exome_post_map-mouse_submit.sh
# SLURM partition:        good_lab_cpu
# SLURM ntasks:           20
# SLURM cpus-per-task:    1
# SLURM mem:              0
# ----------
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Apomys-lubangensis-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Batomys-salomonseni-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Bulimus-bagobus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Chrotomys-mindorensis-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Phloeomys-pallidus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rhynchomys-isarogensis-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Sundamys-meulleri-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Taeromys-punicans-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hyorhinomys-stuempkei-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hybomys-univittatus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Colomys-goslingi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Malacomys-longipes-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hylomyscus-vulcanorum-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Praomys-degraaffi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Grammomys-sp-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Lemniscomys-striatus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Berylymys-bowersi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Crunomys-celebensis-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Echiothrix-centrosa-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Gracillimus-radix-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Leopoldomys-sabanus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Margaretamys-parvus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Melasmothrix-naso-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Paucidentomys-vermidax-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Sommeromys-macrorhinos-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Tateomys-macrocercus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Tateomys-rhinogradoides-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Waiomys-mamasae-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Chiropodomys-gliroides-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Lorentzimys-nouhuysi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mastacomys-fuscus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Melomys-rufescens-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hydromys-chrysogaster-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Apodemus-sylvaticus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Archboldomys-luzonensis-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Bunomys-chrysocomus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Haeromys-minahassae-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Maxomys-surifer-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Niviventer-lepturus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Paruromys-dominator-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Bunomys-andrewsi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-exulans-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-hoffmanni-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-leucopus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-lutreolus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Maxomys-musschenbroekii-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-praetor-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-villosissimus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-musculus-reference-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-musculus-musculus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-musculus-domesticus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-musculus-castaneus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-caroli-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-cervicolor-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-cookii-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-macedonicus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-minutoides-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-molossinus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-pahari-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-platythrix-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-spicilegus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-spretus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Coccymys-ruemmleri-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Grammomys-dryas-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Carpomys-melanurus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Crateromys-heaneyi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Dasymys-montanus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Aethomys-hindei-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hylomyscus-stella-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Anisomys-imitator-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Crunomys-melanius-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Niviventer-rapit-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Phloeomys-cumingii-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Aethomys-nyikae-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hybomys-planifrons-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pogonomys-macrourus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Musseromys-anacuao-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Limnomys-sibuanus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pithecheir-melanurus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Thamnomys-sp.-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mammelomys-lanosus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Xenuromys-barbatus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hydromys-sp-nov-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Xeromys-myoides-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pseudohydromys-ellermani-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Leptomys-elegans-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pelomys-isseli-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Niviventer-bukit-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Genus-sp-nov-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Saxatilomys-paulinae-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Crunomys-sp.-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Microhydromys-richardsoni-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Uromys-caudimaculatus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mirzamys-louiseae-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Papagomys-armandvillei-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Chiromyscus-chiropus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pogonomelomys-bruijni-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Paraleptomys-sp-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Oenomys-hypoxanthus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Bandicota-indica-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-xanthurus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Lenomys-meyeri-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Thamnomys-kempi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Parahydromys-asper-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Rattus-argentiventer-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Uromys-sp-nov-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Otomys-tropicalis-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Niviventer-cremoriventer-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Otomys-denti-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Praomys-jacksoni-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Margaretamys-christinae-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Dasymys-incomtus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Taeromys-callitrichus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Hybomys-lunaris-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Sundamys-annandalei-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Nesokia-indica-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Macruromys-major-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mus-musculoides-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Pelomys-minor-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Tarsomys-apoensis-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Batomys-russatus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Halmaheramys-bokimekot-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Chiruromys-vates-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Chrotomys-whiteheadi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Abeomelomys-sevia-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Berylmys-mackenzii-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Solomys-salebrosus-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Zelotomys-woosnami-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Kadarsanomys-sodyi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Mallomys-rothschildi-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Taeromys-taerae-post-map-mouse.sh
source /mnt/beegfs/gt156213e/murinae-seq/01-Assembly-scripts/jobs/06.5-Post-map-jobs/Vandeleuria-oleracea-post-map-mouse.sh
