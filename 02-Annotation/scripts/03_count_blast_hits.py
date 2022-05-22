#!/usr/bin/python3
###########################################################
# For rodent exomes, 05.2021
# This script counts the number of BLAST hits to mouse targets
# per sample
###########################################################

import sys
sys.path.append("../lib/");
# Add the repo's lib dir to the path.

import os, mcore, globs
from collections import defaultdict

###########################################################

blast_file = "../02-Annotation-data/all-samples_contig-match.txt";


seq_run_ids, spec_ids, specs_ordered = globs.get();
# Get all the meta info for the species and sequencing runs.

hit_counts = {};
specs_ordered = ["Apodemus-sylvaticus", "Apomys-lubangensis", "Archboldomys-luzonensis", "Berylmys-bowersi", "Bullimus-bagobus", "Bullimus-sp", "Bunomys-chrysocomus", "Chiropodomys-gliroides", "Chrotomys-mindorensis", "Colomys-goslingi", "Crunomys-celebensis", "Echiothrix-centrosa", "Gracilimus-radix", "Grammomys-dryas", "Haeromys-minahassae", "Hybomys-univittatus", "Hydromys-chrysogaster", "Hylomyscus-vulcanorum", "Hyorhinomys-stuempkei", "Lemniscomys-striatus", "Leopoldomys-sabanus", "Lorentzimys-nouhuysi", "Malacomys-longipes", "Margaretamys-parvus", "Mastacomys-fuscus", "Maxomys-surifer", "Melasmothrix-naso", "Melomys-rufescens", "Niviventer-lepturus", "Paruromys-dominator", "Paucidentomys-vermidax", "Phloeomys-pallidus", "Praomys-degraaffi", "Rhynchomys-isarogensis", "Sommeromys-macrorhinos", "Sundamys-muelleri", "Taeromys-punicans", "Tateomys-macrocercus", "Tateomys-rhinogradoides", "Waiomys-mamasae", "Bunomys-andrewsi", "Maxomys-musschenbroekii", "Rattus-exulans", "Rattus-hoffmanni", "Rattus-leucopus", "Rattus-lutreolus", "Rattus-praetor", "Rattus-villosissimus", "Mus-caroli", "Mus-cervicolor", "Mus-cookii", "Mus-macedonicus", "Mus-minutoides", "Mus-molossinus", "Mus-musculus-castaneus", "Mus-musculus-domesticus", "Mus-musculus-musculus", "Mus-musculus-reference", "Mus-pahari", "Mus-platythrix", "Mus-spicilegus", "Mus-spretus", "Abeomelomys-sevia", "Aethomys-hindei", "Aethomys-nyikae", "Anisomys-imitator", "Bandicota-indica", "Batomys-russatus", "Berylmys-mackenziei", "Carpomys-melanurus", "Chiromyscus-chiropus", "Chiruromys-vates", "Chrotomys-whiteheadi", "Coccymys-ruemmleri", "Crateromys-heaneyi", "Crunomys-melanius", "Crunomys-melanius", "Dasymys-incomtus", "Dasymys-montanus", "Genus-sp-nov", "Grammomys-dryas", "Halmaheramys-bokimekot", "Hybomys-lunaris", "Hybomys-planifrons", "Hydromys-sp-nov", "Hylomyscus-stella", "Kadarsanomys-sodyi", "Lenomys-meyeri", "Leptomys-elegans", "Limnomys-sibuanus", "Macruromys-major", "Mallomys-rothschildi", "Mammelomys-lanosus", "Margaretamys-christinae", "Microhydromys-richardsoni", "Mirzamys-louiseae", "Mus-musculoides", "Musseromys-anacuao", "Nesokia-indica", "Niviventer-bukit", "Niviventer-cremoriventer", "Niviventer-rapit", "Oenomys-hypoxanthus", "Otomys-denti", "Otomys-tropicalis", "Papagomys-armandvillei", "Parahydromys-asper", "Paraleptomys-wilhelmina", "Pelomys-isseli", "Pelomys-minor", "Phloeomys-cumingi", "Pithecheir-melanurus", "Pogonomelomys-mayeri", "Pogonomys-macrourus", "Praomys-jacksoni", "Pseudohydromys-pumehanae", "Rattus-argentiventer", "Rattus-xanthurus", "Saxatilomys-paulinae", "Solomys-salebrosus", "Sundamys-annandalei", "Taeromys-callitrichus", "Taeromys-taerae", "Tarsomys-apoensis", "Thamnomys-kempi", "Thamnomys-venustus", "Uromys-caudimaculatus", "Uromys-sp-nov", "Vandeleuria-oleracea", "Xenuromys-barbatus", "Xeromys-myoides", "Zelotomys-woosnami", "Conilurus-albipes", "Conilurus-penicillatus", "Leggadina-forresti", "Leggadina-lakedownensis", "Leporillus-apicalis", "Leporillus-conditor", "Mastacomys-fuscus", "Mastacomys-fuscus", "Mesembriomys-gouldii", "Mesembriomys-macrurus", "Notomys-alexis", "Notomys-alexis", "Notomys-amplus", "Notomys-aquilo", "Notomys-cervinus", "Notomys-fuscus", "Notomys-longicaudatus", "Notomys-macrotis", "Notomys-mitchellii", "Pseudomys-albocinereus", "Pseudomys-apodemoides", "Pseudomys-auritus", "Pseudomys-australis", "Pseudomys-hermannsburgensis", "Pseudomys-bolami", "Pseudomys-calabyi", "Pseudomys-chapmani", "Pseudomys-delicatulus", "Pseudomys-delicatulus", "Pseudomys-delicatulus", "Pseudomys-delicatulus", "Pseudomys-desertor", "Pseudomys-gouldii", "Pseudomys-fumeus", "Pseudomys-gouldii", "Pseudomys-gracilicaudatus", "Pseudomys-hermannsburgensis", "Pseudomys-hermannsburgensis", "Pseudomys-higginsi", "Pseudomys-johnsoni", "Pseudomys-johnsoni", "Pseudomys-nanus", "Pseudomys-novaehollandiae", "Pseudomys-novaehollandiae", "Pseudomys-occidentalis", "Pseudomys-oralis", "Pseudomys-patrius", "Pseudomys-pilligaensis", "Pseudomys-shortridgei", "Pseudomys-shortridgei", "Rattus-colletti", "Rattus-tunneyi", "Zyzomys-argurus", "Zyzomys-maini", "Zyzomys-palatalis", "Zyzomys-pedunculatus", "Zyzomys-woodwardi", "Anonymomys-mindorensis", "Arvicanthus-neumanni", "Arvicanthus-niloticus", "Bunomys-torajae", "Crossomys-moncktoni", "Dephomys-defua", "Eropeplus-canus", "Heimyscus-fumosus", "Hyomys-goliath", "Lophiomys-imhausi", "Lophuromys-woosnami", "Mastomys-natalensis", "Micaelemys-namaquensis", "Mylomys-dybowskii", "Myomyscus-verreauxii", "Rattus-morotaiensis", "Rhabdomys-pumilio", "Stochomys-longicaudatus", "Taeromys-celebensis", "Taeromys-hamatus", "Thallomys-paedulcus"];
samples_ordered = ["SMG3823", "JAE169", "EAR1826", "ABTC116431", "JAE1712", "JAE3320", "JAE4867", "Z25153", "JAE520", "TCD4175", "Z21894", "Z27993", "Z08508", "LSUMZ37717", "JAE4996", "TCD4026", "Z5248", "TCD4382", "JAE4661", "TCD4711", "Z25191", "ABTC46314", "TCD4253", "NMV Z21833", "ABTC07354", "JAE3632", "Z21808", "ABTC44798", "JAE4746", "JAE4870", "Z21914", "JEC43", "TCD4312", "JAE2195", "Z21740", "JAE1283", "MVZ225815", "Z21834", "Z21785", "Z20624", "sample1", "sample1", "sample1", "LSUMZ39187", "sample1", "sample1", "sample1", "sample1", "10460X9", "10460X10", "10460X3", "10460X12", "10460X2", "10460X8", "10460X7", "10460X15", "10460X14", "10460X5", "10460X1", "10460X13", "10460X11", "10460X4", "KUM 161018", "MVZ196257", "FMNH196708", "ABTC 45107", "ABTC 119185", "KU165776", "ABTC 116402", "FMNH198723", "ABTC 69097", "ABTC 43096", "KU168311", "ABTC 49489", "KU165014", "KU168403", "KU168558", "LSUMZ37702", "FMNH144389", "NMV Z21816", "LSUMZ37716", "33262-WD225", "LSUMZ37734", "R24117", "YS391", "LSUMZ37742", "MZB-Sample", "LSUMZ39079", "ABTC 45741", "FMNH147948", "ABTC 43909", "ABTC 47402", "ABTC 47208", "TMar1", "ANWC M35851", "ABTC 133754", "LSUMZ37820", "FMNH209523", "ABTC 117074", "LSUMZ38136", "LSUMZ38141", "LSUMZ38196", "LSUMZ37838", "LSUMZ37840", "LSUMZ37841", "WAM M32592", "ABTC 45798", "H126-ABTC133716", "FMNH137886", "FMNH219213", "FMNH198472", "LSUMZ38198", "AMM21849", "ABTC 43144", "REC31", "ABTC 43920", "LSUMZ38199", "LSUMZ39196", "ABTC 116266", "ABTC 64864", "YS118", "LSUMZ37153", "LSUMZ39224", "KU167148", "TCD4437", "LSUMZ37935", "DT10 Uc01", "YS380", "ABTC 116404", "ABTC129204", "ABTC 30709", "TTU-M115260", "NMV-c7585", "M14056", "WAMM62323", "WAMM21623", "C90", "ABTC13335", "M13957", "NMB C37546", "ABTC7449", "ABTC7337", "U1308", "ABTC94521", "NMV-C512", "M-32455", "M22857", "M22830", "C6278", "ZD-1841-1167", "M21518", "WAMM18855", "M16672", "1846-4-4-67", "M25541", "ABTC08077", "ABTC107389", "U4324", "WAMM29440", "JM18363", "M29247", "U1509", "WAMM29247", "ABTC41464", "ABTC08164", "ABTC08168", "C955", "ABTC08163", "ABTC08067", "M7890", "UC1421", "WAMM56280", "ABTC08053", "U1448", "ABTC08140", "NMVC22127", "ABTC08043", "RAT7", "JM10865", "ABTC18120", "M62127", "Z25113", "RAT25", "RAT130", "ABTC61630", "ABTC07900", "ABTC30744", "Z34925", "WAMM21724", "FMNH2222010", "FMNH158037", "MNHN1999201", "NMVZ21736", "ABTC 46614", "MNHNR24062", "NMV Z21733", "FMNH167810", "ABTC42697", "UM5152", "LSUMZ37793", "T4162", "MNHN1987009", "MNHN1997072", "MNHN1999102", "ASA M29", "MNHN1995065", "MNHN1999459", "NMVZ20637", "NMVZ63317", "FMNH158089"];
specs_ordered = [specs_ordered[i].replace("-", "_") + "_" + samples_ordered[i].replace(" ", "") for i in range(len(specs_ordered))];
for spec in specs_ordered:
    print(spec);
    hit_counts[spec] = 0;
print("------------");

for line in open(blast_file):
    line = line.strip().split(" ");
    if line[0] == "NA":
        continue;

    sample = line[2];
    #print(sample);

    #sample = "-".join(line[2].split("_")[:2]);
    if "Mus_musculus-" in sample:
        sample = sample.replace("Mus_musculus-", "Mus_musculus_");

    if sample == "Genus_sp-nov_NMVZ21816":
        sample = "Genus_sp_nov_NMVZ21816"

    if sample == "Hydromys_sp-nov_YS391":
        sample = "Hydromys_sp_nov_YS391"

    if sample == "Lorentzimys_nouhuysi_ABTC-46314":
        sample = "Lorentzimys_nouhuysi_ABTC46314"

    if sample == "Mastacomys_fuscus_ABTC-07354":
        sample = "Mastacomys_fuscus_ABTC07354"

    if sample == "Rattus_lutreolus_sample2":
        sample = "Rattus_lutreolus_sample1";

    if sample == "Uromys_sp-nov_YS380":
        sample = "Uromys_sp_nov_YS380";

    # if sample == "Genus-sp-nov":
    #     sample = "Genus-sp";

    # if sample == "Hydromys-sp-nov":
    #     sample = "Hydromys-sp";

    hit_counts[sample] += 1;

print(len(hit_counts));
with open("blast-hit-counts.txt", "w") as outfile:
    for sample in hit_counts:
        outline = sample + "\t" + str(hit_counts[sample]);
        outfile.write(outline + "\n");
        print(sample, hit_counts[sample]);