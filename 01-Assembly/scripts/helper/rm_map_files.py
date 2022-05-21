#!/usr/bin/python3
############################################################
# For rodent exomes, 08.2020
# Removes some of the mapping files
############################################################

import sys, os

############################################################-

spec_to_rm = ["Conilurus-albipes-NMV-c7585","Conilurus-penicillatus-M14056","Leggadina-forresti-WAMM62323","Leggadina-lakedownensis-WAMM21623","Leporillus-apicalis-C90","Leporillus-conditor-ABTC13335","Mastacomys-fuscus-M13957",
                "Mastacomys-fuscus-NMV-C37546","Mesembriomys-gouldii-ABTC7449","Mesembriomys-macrurus-ABTC7337","Notomys-alexis-U1308","Notomys-amplus-NMV-C512","Notomys-aquilo-M-32455","Notomys-cervinus-M22857",
                "Notomys-fuscus-M22830","Notomys-longicaudatus-C6278","Notomys-macrotis-ZD-1841-1167","Notomys-mitchelli-ABTC94521","Notomys-mitchellii-M21518","Pseudomys-patrius-JM10865",
                "Pseudomys-pilligaensis-ABTC18120","Pseudomys-shortridgei-M7890","Pseudomys-shortridgei-M62127","Pseudomys-shortridgei-Z25113","Rattus-colletti-RAT25","Rattus-tunneyi-RAT130",
                "Zyzomys-argurus-ABTC61630","Zyzomys-maini-ABTC07900","Zyzomys-palatalis-ABTC30744","Zyzomys-pedunculatus-Z34925","Zyzomys-woodwardi-WAMM21724","Pseudomys-albocinereus-WAMM18855",
                "Pseudomys-apodemoides-M16672","Pseudomys-auritus-1846-4-4-67","Pseudomys-australis-M25541","Pseudomys-bolami-ABTC08077","Pseudomys-bolami-ABTC107389","Pseudomys-calabyi-U4324",
                "Pseudomys-calabyi-WAMM56280","Pseudomys-chapmani-WAMM29440","Pseudomys-delicatulus-JM18363","Pseudomys-delicatulus-M29247","Pseudomys-delicatulus-U1509","Pseudomys-delicatulus-WAMM29247",
                "Pseudomys-desertor-ABTC41464","Pseudomys-fieldi-ABTC08164","Pseudomys-fumeus-ABTC08168","Pseudomys-gouldii-C955","Pseudomys-gracilicaudatus-ABTC08163","Pseudomys-hermannsburgensis-ABTC08067",
                "Pseudomys-higginsi-UC1421","Pseudomys-johnsoni-ABTC08053","Pseudomys-nanus-U1448","Pseudomys-novaehollandiae-ABTC08140","Pseudomys-novaehollandiae-NMV-C22127","Pseudomys-occidentalis-ABTC08043",
                "Pseudomys-oralis-RAT7","Rattus-morotaiensis","Hyomys-goliath","Mastomys-natalensis","Crossomys-moncktoni","Eropeplus-canus","Bunomys-torajae",
                "Taeromys-celebensis","Taeromys-hamatus","Thallomys-paedulcus","Anonymomys-mindorensis","Arvicanthus-neumanni","Arvicanthus-niloticus","Dephomys-defua","Heimyscus-fumosus",
                "Lophiomys-imhausi","Lophuromys-woosnami","Micaelemys-namaquensis","Mylomys-dybowskii","Myomyscus-verreauxii","Rhabdomys-pumilio","Stochomys-longicaudatus","Abeomelomys-sevia",
                "Carpomys-melanurus","Kadarsanomys-sodyi","Otomys-tropicalis","Xeromys-myoides","Pithecheir-melanurus"];


mapdir = "../../01-Assembly-data/06-Map/";

for spec in spec_to_rm:
    specdir = os.path.join(mapdir, spec + "-mouse");
    #assert os.path.isdir(specdir), "\nCANNOT FIND DIRECTORY: " + specdir;

    cmd = "rm -rf " + specdir
    print(cmd);
    os.system(cmd);
    

