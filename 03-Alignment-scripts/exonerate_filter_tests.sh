#!/bin/bash

set -x

basedir="/mnt/beegfs/gt156213e/murinae-seq/03-Alignments/exonerate-tests-rat"
exoneratedir="$basedir/exonerate/"
sample_filters=( 50 100 150 175 200 )
seq_filters=( 0 20 40 60 80 100 )
site_filters=( 0 25 50 75 100 )

echo $basedir
echo $exoneratedir

for sample_filter in "${sample_filters[@]}"
do
    echo "RUNNING SAMPLE FILTER: $sample_filter"
    sample_dir="$basedir/f$sample_filter"

    mkdir $sample_dir

    exonerate_cds_outdir="$sample_dir/seq/"
    sample_seq_dir="$sample_dir/seq-f$sample_filter/"
    sample_aa_dir="$sample_seq_dir/aa/"
    sample_nt_dir="$sample_seq_dir/nt/"
    sample_mafft_dir="$sample_dir/mafft/"
    mkdir $sample_mafft_dir

    sample_mafft_aa_dir="$sample_mafft_dir/aa/"
    sample_mafft_nt_dir="$sample_mafft_dir/nt/"
    
    sample_job_name="mafft_rat_test_$sample_filter"

    sample_trimmed_base="$sample_dir/mafft-trimmed"

    python 04_exonerate_to_cds_2_trimmed.py -i $exoneratedir -o $exonerate_cds_outdir -f $sample_filter

    mkdir $sample_mafft_dir

    mafft_gen.py -i $sample_aa_dir -o $sample_mafft_aa_dir -n $sample_job_name -part good_lab_cpu -tasks 30

    chmod +x jobs/$sample_job_name.sh

    ./jobs/$sample_job_name.sh

    python 05_backtranslate.py -aa $sample_mafft_aa_dir -nt $sample_nt_dir -o $sample_mafft_nt_dir

    for seq_filter in "${seq_filters[@]}"
    do
        python 06_aln_filter.py -i $sample_mafft_nt_dir -f $sample_filter -s $seq_filter -o $sample_trimmed_base
    done

    for site_filter in "${site_filters[@]}"
    do
        python 06_aln_filter.py -i $sample_mafft_nt_dir -f $sample_filter -c $site_filter -o $sample_trimmed_base
    done
   
done
