#!/usr/bin/python3
############################################################
# For rodent exomes, 01.2020
# Given a file with species labels in the first column
# resorts to consistent ordering.
############################################################

def resortFile(f=False, i=False, sep=","):
    spec_labels_ordered = ["Apomys-lubangensis", "Batomys-salomonseni", "Bulimus-bagobus", "Chrotomys-mindorensis", "Phloeomys-pallidus", "Rhynchomys-isarogensis", "Sundamys-meulleri", 
                            "Taeromys-punicans", "Hyorhinomys-stuempkei", "Hybomys-univittatus", "Colomys-goslingi", "Malacomys-longipes", "Hylomyscus-vulcanorum", "Praomys-degraaffi", 
                            "Grammomys-sp", "Lemniscomys-striatus", "Berylymys-bowersi", "Crunomys-celebensis", "Echiothrix-centrosa", "Gracillimus-radix", "Leopoldomys-sabanus", "Margaretamys-parvus", 
                            "Melasmothrix-naso", "Paucidentomys-vermidax", "Sommeromys-macrorhinos", "Tateomys-macrocercus", "Tateomys-rhinogradoides", "Waiomys-mamasae", "Chiropodomys-gliroides", 
                            "Lorentzimys-nouhuysi", "Mastacomys-fuscus", "Melomys-rufescens", "Hydromys-chrysogaster", "Apodemus-sylvaticus", "Archboldomys-luzonensis", "Bunomys-chrysocomus", 
                            "Haeromys-minahassae", "Maxomys-surifer", "Niviventer-lepturus", "Paruromys-dominator", "Bunomys-andrewsi", "Rattus-exulans", "Rattus-hoffmanni", "Rattus-leucopus", 
                            "Rattus-lutreolus", "Maxomys-musschenbroekii", "Rattus-praetor", "Rattus-villosissimus", "Mus-caroli", "Mus-cervicolor", "Mus-cookii", "Mus-macedonicus", "Mus-minutoides", 
                            "Mus-molossinus", "Mus-musculus-castaneus", "Mus-musculus-domesticus", "Mus-musculus-musculus", "Mus-musculus-reference", "Mus-pahari", "Mus-platythrix", "Mus-spicilegus", 
                            "Mus-spretus", "Coccymys-ruemmleri", "Grammomys-dryas", "Carpomys-melanurus", "Crateromys-heaneyi", "Dasymys-montanus", "Aethomys-hindei", "Hylomyscus-stella", "Anisomys-imitator", 
                            "Crunomys-melanius", "Niviventer-rapit", "Phloeomys-cumingii", "Aethomys-nyikae", "Hybomys-planifrons", "Pogonomys-macrourus", "Musseromys-anacuao", "Limnomys-sibuanus", 
                            "Pithecheir-melanurus", "Thamnomys-sp.", "Mammelomys-lanosus", "Xenuromys-barbatus", "Hydromys-sp-nov", "Xeromys-myoides", "Pseudohydromys-ellermani", "Leptomys-elegans", 
                            "Pelomys-isseli", "Mus-pos_ctrl_F", "Mus-pos_ctrl_E", "Niviventer-bukit", "Genus-sp-nov", "Saxatilomys-paulinae", "Crunomys-sp.", "Microhydromys-richardsoni", "Uromys-caudimaculatus", 
                            "Mirzamys-louiseae", "Papagomys-armandvillei", "Chiromyscus-chiropus", "Pogonomelomys-bruijni", "Paraleptomys-sp", "Oenomys-hypoxanthus", "Bandicota-indica", "Rattus-xanthurus", 
                            "Lenomys-meyeri", "Thamnomys-kempi", "Parahydromys-asper", "Rattus-argentiventer", "Uromys-sp-nov", "Otomys-tropicalis", "Niviventer-cremoriventer", "Otomys-denti", "Praomys-jacksoni", 
                            "Mus-pos_ctrl_C", "Mus-pos_ctrl_B", "Mus-pos_ctrl_D1", "Margaretamys-christinae", "Dasymys-incomtus", "Taeromys-callitrichus", "Hybomys-lunaris", "Sundamys-annandalei", "Nesokia-indica", 
                            "Macruromys-major", "Mus-musculoides", "Pelomys-minor", "Tarsomys-apoensis", "Batomys-russatus", "Halmaheramys-bokimekot", "Chiruromys-vates", "Chrotomys-whiteheadi", "Abeomelomys-sevia", 
                            "Berylmys-mackenzii", "Solomys-salebrosus", "Zelotomys-woosnami", "Kadarsanomys-sodyi", "Mallomys-rothschildi", "Taeromys-taerae", "Vandeleuria-oleracea", "Mus-pos_ctrl_A", 
                            "Mus-pos_ctrl_G", "Mus-pos_ctrl_D2", "Conilurus-albipes", "Conilurus-penicillatus", "Leggadina-forresti", "Leggadina-lakedownensis", "Mesembriomys-gouldii", "Mesembriomys-macrurus", 
                            "Notomys-alexis", "Notomys-amplus", "Notomys-aquilo", "Notomys-cervinus", "Notomys-fuscus", "Notomys-longicaudatus", "Notomys-macrotis", "Notomys-mitchellii", "Pseudomys-patrius", 
                            "Pseudomys-pilligaensis", "Pseudomys-shortridgei", "Rattus-colletti", "Rattus-tunneyi", "Zyzomys-argurus", "Zyzomys-maini", "Zyzomys-palatalis", "Zyzomys-pedunculatus", "Zyzomys-woodwardi",
                            "Pseudomys-albocinereus", "Pseudomys-apodemoides", "Pseudomys-auritus", "Pseudomys-australis", "Pseudomys-bolami", "Pseudomys-calabyi", "Pseudomys-chapmani", "Pseudomys-delicatulus", "Pseudomys-desertor",
                            "Pseudomys-fieldi", "Pseudomys-fumeus", "Pseudomys-gouldii", "Pseudomys-gracilicaudatus", "Pseudomys-hermannsburgensis", "Pseudomys-higginsi", "Pseudomys-johnsoni", "Pseudomys-nanus",
                            "Pseudomys-novaehollandiae", "Pseudomys-occidentalis", "Pseudomys-oralis"];


    if f:
        inlines = open(f, "r").read().split("\n");
        lines = {};
        for line in inlines:
            line = line.split(",");
            lines[line[0]] = line[1:];
        with open(f, "w") as outfile:
            for spec in spec_labels_ordered:
                outline = spec + "," + ",".join(lines[spec]);
                outfile.write(outline + "\n");
    elif i:
        for spec in spec_labels_ordered:
            print(spec + sep + sep.join([str(c) for c in i[spec] ]));