#!/bin/bash

seqdir="/scratch/gregg_thomas/Murinae-seq/00-RawReads"
declare -a skip=(Mastacomys_fuscus_M13957 Mastacomys_fuscus_NMV_C37546 Notomys_mitchelli_ABTC94521 Pseudomys_shortridgei_M7890 Pseudomys_shortridgei_Z25113 Pseudomys_shortridgei_M7890 Pseudomys_shortridgei_M62127 Pseudomys_shortridgei_Z25113 Pseudomys_bolami_ABTC08077)

for file in ~/box-dl/*
do
	bf="$(basename $file)"
	#echo $bf

	if [[ " ${skip[@]} " =~ " ${bf} " ]]
	then
		#echo $bf FOUND!!!
		continue
	fi
	echo $bf

	tmp_bf="${bf//_/-}"
	new_bf="$(echo $tmp_bf | cut -f 1,2 -d -)"
	#new_bf=${tmp_bf%-*}
	# echo $new_bf
	# continue
	curdir=$seqdir/$new_bf
	cp -r $file $curdir

	dir1=$curdir/seq-run-1
	dir2=$curdir/seq-run-2

	mkdir $dir1
	mkdir $dir2

	mv $curdir/seq-run-1-lane1/*.fastq.gz $dir1/.
	mv $curdir/seq-run-1-lane2/*.fastq.gz $dir1/.

	rm -rf $curdir/seq-run-1-lane1/
	rm -rf $curdir/seq-run-1-lane2/

        mv $curdir/seq-run-2-lane1/*.fastq.gz $dir2/.
        mv $curdir/seq-run-2-lane2/*.fastq.gz $dir2/.

        rm -rf $curdir/seq-run-2-lane1/
        rm -rf $curdir/seq-run-2-lane2/
	#break
done
