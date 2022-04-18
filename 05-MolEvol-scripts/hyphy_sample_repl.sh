#!/bin/bash

# Hyphy replaces hyphens (-) with underscores (_) for some reason
# This script reverts all the samples with hyphens in them
# back to their original name with the hyphen.
# Uses sed.

indir="../05-MolEvol/full-coding-absrel-pared/csv"
#indir="../05-MolEvol/coding-full-species-tree-slac/csv"
#indir="../05-MolEvol/full-coding-mg94-local-rooted-anc/csv"
#indir="../05-MolEvol/full-coding-slac-morphometrics/csv"
# Use the csv file to preserve original Hyphy outputs.

sed -i -e 's/Kadarsanomys_sodyi_MZB_Sample/Kadarsanomys_sodyi_MZB-Sample/g' \
-e 's/Halmaheramys_bokimekot_33262_WD225/Halmaheramys_bokimekot_33262-WD225/g' \
-e 's/Genus_sp_nov_NMVZ21816/Genus_sp-nov_NMVZ21816/g' \
-e 's/Lorentzimys_nouhuysi_ABTC_46314/Lorentzimys_nouhuysi_ABTC-46314/g' \
-e 's/Hydromys_sp_nov_YS391/Hydromys_sp-nov_YS391/g' \
-e 's/Paraleptomys_wilhelmina_H126_ABTC133716/Paraleptomys_wilhelmina_H126-ABTC133716/g' \
-e 's/Uromys_sp_nov_YS380/Uromys_sp-nov_YS380/g' \
-e 's/Conilurus_albipes_NMV_c7585/Conilurus_albipes_NMV-c7585/g' \
-e 's/Notomys_aquilo_M_32455/Notomys_aquilo_M-32455/g' \
-e 's/Zelotomys_woosnami_TTU_M115260/Zelotomys_woosnami_TTU-M115260/g' \
-e 's/Mus_musculus_castaneus_10460X7/Mus_musculus-castaneus_10460X7/g' \
-e 's/Mus_musculus_musculus_10460X14/Mus_musculus-musculus_10460X14/g' \
-e 's/Mus_musculus_reference_10460X5/Mus_musculus-reference_10460X5/g' \
-e 's/Mus_musculus_domesticus_10460X15/Mus_musculus-domesticus_10460X15/g' \
$indir/*.csv

