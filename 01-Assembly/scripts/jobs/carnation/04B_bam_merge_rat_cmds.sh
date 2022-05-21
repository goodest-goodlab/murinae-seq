#!/bin/bash
# Rodent BWA commands
# PYTHON VERSION: 3.5.2
# Script call: bam_merge_cmd_generator.py -ref rat
# Runtime: 01/27/2020 17:18:51
# ----------
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Apomys-lubangensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Apomys-lubangensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Batomys-salomonseni-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Batomys-salomonseni-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Bulimus-bagobus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Bulimus-bagobus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Chrotomys-mindorensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Chrotomys-mindorensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Phloeomys-pallidus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Phloeomys-pallidus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rhynchomys-isarogensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rhynchomys-isarogensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Sundamys-meulleri-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Sundamys-meulleri-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Taeromys-punicans-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Taeromys-punicans-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hyorhinomys-stuempkei-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hyorhinomys-stuempkei-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hybomys-univittatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hybomys-univittatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Colomys-goslingi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Colomys-goslingi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Malacomys-longipes-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Malacomys-longipes-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hylomyscus-vulcanorum-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hylomyscus-vulcanorum-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Praomys-degraaffi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Praomys-degraaffi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Grammomys-sp-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Grammomys-sp-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Lemniscomys-striatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Lemniscomys-striatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Berylymys-bowersi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Berylymys-bowersi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Crunomys-celebensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Crunomys-celebensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Echiothrix-centrosa-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Echiothrix-centrosa-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Gracillimus-radix-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Gracillimus-radix-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Leopoldomys-sabanus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Leopoldomys-sabanus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Margaretamys-parvus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Margaretamys-parvus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Melasmothrix-naso-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Melasmothrix-naso-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Paucidentomys-vermidax-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Paucidentomys-vermidax-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Sommeromys-macrorhinos-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Sommeromys-macrorhinos-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Tateomys-macrocercus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Tateomys-macrocercus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Tateomys-rhinogradoides-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Tateomys-rhinogradoides-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Waiomys-mamasae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Waiomys-mamasae-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Chiropodomys-gliroides-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Chiropodomys-gliroides-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Lorentzimys-nouhuysi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Lorentzimys-nouhuysi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mastacomys-fuscus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mastacomys-fuscus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Melomys-rufescens-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Melomys-rufescens-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hydromys-chrysogaster-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hydromys-chrysogaster-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Apodemus-sylvaticus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Apodemus-sylvaticus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Archboldomys-luzonensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Archboldomys-luzonensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Bunomys-chrysocomus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Bunomys-chrysocomus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Haeromys-minahassae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Haeromys-minahassae-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Maxomys-surifer-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Maxomys-surifer-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Niviventer-lepturus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Niviventer-lepturus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Paruromys-dominator-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Paruromys-dominator-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Bunomys-andrewsi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Bunomys-andrewsi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-exulans-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-exulans-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-hoffmanni-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-hoffmanni-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-leucopus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-leucopus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-lutreolus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-lutreolus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Maxomys-musschenbroekii-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Maxomys-musschenbroekii-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-praetor-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-praetor-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-villosissimus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-villosissimus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-musculus-reference-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-musculus-reference-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-musculus-musculus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-musculus-musculus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-musculus-domesticus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-musculus-domesticus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-musculus-castaneus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-musculus-castaneus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-caroli-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-caroli-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-cervicolor-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-cervicolor-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-cookii-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-cookii-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-macedonicus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-macedonicus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-minutoides-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-minutoides-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-molossinus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-molossinus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pahari-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pahari-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-platythrix-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-platythrix-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-spicilegus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-spicilegus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-spretus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-spretus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Coccymys-ruemmleri-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Coccymys-ruemmleri-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Grammomys-dryas-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Grammomys-dryas-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Carpomys-melanurus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Carpomys-melanurus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Crateromys-heaneyi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Crateromys-heaneyi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Dasymys-montanus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Dasymys-montanus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Aethomys-hindei-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Aethomys-hindei-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hylomyscus-stella-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hylomyscus-stella-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Anisomys-imitator-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Anisomys-imitator-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Crunomys-melanius-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Crunomys-melanius-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Niviventer-rapit-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Niviventer-rapit-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Phloeomys-cumingii-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Phloeomys-cumingii-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Aethomys-nyikae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Aethomys-nyikae-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hybomys-planifrons-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hybomys-planifrons-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pogonomys-macrourus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pogonomys-macrourus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Musseromys-anacuao-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Musseromys-anacuao-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Limnomys-sibuanus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Limnomys-sibuanus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pithecheir-melanurus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pithecheir-melanurus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Thamnomys-sp.-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Thamnomys-sp.-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mammelomys-lanosus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mammelomys-lanosus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Xenuromys-barbatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Xenuromys-barbatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hydromys-sp-nov-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hydromys-sp-nov-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Xeromys-myoides-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Xeromys-myoides-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudohydromys-ellermani-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudohydromys-ellermani-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Leptomys-elegans-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Leptomys-elegans-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pelomys-isseli-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pelomys-isseli-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_F-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_F-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_E-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_E-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Niviventer-bukit-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Niviventer-bukit-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Genus-sp-nov-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Genus-sp-nov-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Saxatilomys-paulinae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Saxatilomys-paulinae-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Crunomys-sp.-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Crunomys-sp.-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Microhydromys-richardsoni-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Microhydromys-richardsoni-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Uromys-caudimaculatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Uromys-caudimaculatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mirzamys-louiseae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mirzamys-louiseae-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Papagomys-armandvillei-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Papagomys-armandvillei-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Chiromyscus-chiropus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Chiromyscus-chiropus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pogonomelomys-bruijni-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pogonomelomys-bruijni-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Paraleptomys-sp-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Paraleptomys-sp-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Oenomys-hypoxanthus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Oenomys-hypoxanthus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Bandicota-indica-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Bandicota-indica-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-xanthurus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-xanthurus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Lenomys-meyeri-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Lenomys-meyeri-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Thamnomys-kempi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Thamnomys-kempi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Parahydromys-asper-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Parahydromys-asper-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-argentiventer-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-argentiventer-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Uromys-sp-nov-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Uromys-sp-nov-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Otomys-tropicalis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Otomys-tropicalis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Niviventer-cremoriventer-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Niviventer-cremoriventer-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Otomys-denti-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Otomys-denti-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Praomys-jacksoni-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Praomys-jacksoni-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_C-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_C-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_B-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_B-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_D1-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_D1-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Margaretamys-christinae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Margaretamys-christinae-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Dasymys-incomtus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Dasymys-incomtus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Taeromys-callitrichus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Taeromys-callitrichus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Hybomys-lunaris-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Hybomys-lunaris-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Sundamys-annandalei-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Sundamys-annandalei-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Nesokia-indica-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Nesokia-indica-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Macruromys-major-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Macruromys-major-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-musculoides-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-musculoides-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pelomys-minor-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pelomys-minor-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Tarsomys-apoensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Tarsomys-apoensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Batomys-russatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Batomys-russatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Halmaheramys-bokimekot-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Halmaheramys-bokimekot-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Chiruromys-vates-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Chiruromys-vates-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Chrotomys-whiteheadi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Chrotomys-whiteheadi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Abeomelomys-sevia-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Abeomelomys-sevia-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Berylmys-mackenzii-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Berylmys-mackenzii-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Solomys-salebrosus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Solomys-salebrosus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Zelotomys-woosnami-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Zelotomys-woosnami-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Kadarsanomys-sodyi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Kadarsanomys-sodyi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mallomys-rothschildi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mallomys-rothschildi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Taeromys-taerae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Taeromys-taerae-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Vandeleuria-oleracea-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Vandeleuria-oleracea-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_A-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_A-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_G-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_G-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mus-pos_ctrl_D2-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mus-pos_ctrl_D2-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Conilurus-albipes-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Conilurus-albipes-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Conilurus-penicillatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Conilurus-penicillatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Leggadina-forresti-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Leggadina-forresti-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Leggadina-lakedownensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Leggadina-lakedownensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mesembriomys-gouldii-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mesembriomys-gouldii-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Mesembriomys-macrurus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Mesembriomys-macrurus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-alexis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-alexis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-amplus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-amplus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-aquilo-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-aquilo-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-cervinus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-cervinus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-fuscus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-fuscus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-longicaudatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-longicaudatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-macrotis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-macrotis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Notomys-mitchellii-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Notomys-mitchellii-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-patrius-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-patrius-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-pilligaensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-pilligaensis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-shortridgei-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-shortridgei-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-colletti-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-colletti-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Rattus-tunneyi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Rattus-tunneyi-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Zyzomys-argurus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Zyzomys-argurus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Zyzomys-maini-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Zyzomys-maini-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Zyzomys-palatalis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Zyzomys-palatalis-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Zyzomys-pedunculatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Zyzomys-pedunculatus-rat.log
# source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Zyzomys-woodwardi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Zyzomys-woodwardi-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-albocinereus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-albocinereus-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-apodemoides-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-apodemoides-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-auritus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-auritus-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-australis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-australis-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-bolami-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-bolami-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-calabyi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-calabyi-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-chapmani-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-chapmani-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-delicatulus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-delicatulus-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-desertor-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-desertor-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-fieldi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-fieldi-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-fumeus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-fumeus-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-gouldii-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-gouldii-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-gracilicaudatus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-gracilicaudatus-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-hermannsburgensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-hermannsburgensis-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-higginsi-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-higginsi-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-johnsoni-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-johnsoni-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-nanus-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-nanus-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-novaehollandiae-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-novaehollandiae-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-occidentalis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-occidentalis-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-oralis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-oralis-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-patrius-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-patrius-rat.log
source /scratch/gregg_thomas/Murinae-seq/scripts/jobs/post-map/Pseudomys-pilligaensis-rat.sh &> /scratch/gregg_thomas/Murinae-seq/scripts/logs/03B-MappedRat-post-logs/Pseudomys-pilligaensis-rat.log
