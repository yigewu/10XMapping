#!/bin/bash

echo "source activate 10xmapping"

## set output batch name
batch_name="run_samples.PDX_snRNA.humancells.katmai"

## set sample id for finding the BAM file
sample_id="RESL10F-12473-Cabo_Sap2"
sample_id_maf="RESL10F-12473-CaboSap2"

## set path to the 10XMapping scriptss
dir_10xmapping="/diskmnt/Projects/ccRCC_scratch/ccRCC_Drug/Resources/snRNA_Processed_Data/10XMapping/"
dir_10xmapping_src=${dir_10xmapping}"scripts/src/"

## set path to the BAM file
path_bam="/diskmnt/Projects/ccRCC_scratch/ccRCC_Drug/Resources/snRNA_Processed_Data/Cell_Ranger/outputs/cellranger-5.0.1_Ref-2020-A_GRCh38/"${sample_id}"/"${sample_id}"/outs/possorted_genome_bam.bam"

## set path to the maf files
path_maf_all="/diskmnt/Projects/ccRCC_scratch/ccRCC_Drug/Data_Freeze/v1.dataFreeze.washU_rcc/1.somaticMut/rcc.somaticMut.meta3.20200812.tsv"

## set path to outputs
dir_out_batch=${dir_10xmapping}"outputs/"${batch_name}"/"
mkdir -p ${dir_out_batch}
dir_out=${dir_out_batch}${sample_id}"/"
mkdir -p ${dir_out}

## subset maf file by sample
path_maf=${dir_out}${sample_id}".maf"
grep ${sample_id_maf} ${path_maf_all} > ${path_maf}

## set path to annotation file
path_annotation_file="/diskmnt/Projects/ccRCC_scratch/ccRCC_Drug/Resources/snRNA_Processed_Data/10XMapping/inputs/20210218.v1/"${sample_id}".snRNA.AfterQC_Barcodes.tsv"

## run script
nohup bash ${dir_10xmapping_src}mut_map.sh ${path_bam} ${path_maf} ${path_annotation_file} ${dir_out} ${sample_id} &> ${dir_out}$0.$(date +%Y%m%d%H%M%S).log&


