#!/bin/bash

for specdir in /scratch/gregg_thomas/Murinae-seq/00-RawReads/*
do
    echo $specdir
    for seqdir in $specdir/*
    do
        echo $seqdir
        for file in $seqdir/*
        do
            # if [[ $file =~ ".fq.gz" ]]
            # then
            #     echo $file
            #     newfile="$( echo $file | sed 's/.fq.gz/.fastq.gz/g')"
            #     mv $file $newfile
            #     #break
            # fi
            if [[ $file =~ "_1.fastq.gz" ]]
            then
                echo $file
                newfile="$( echo $file | sed 's/_1.fastq.gz/_R1_.fastq.gz/g')"
                #echo $newfile
                mv $file $newfile
            fi
            if [[ $file =~ "_2.fastq.gz" ]]
            then
                echo $file
                newfile="$( echo $file | sed 's/_2.fastq.gz/_R2_.fastq.gz/g')"
                #echo $newfile
                mv $file $newfile
            fi
        done
    done
done