# source activate 10xmapping
## pay attention to whether the chromosome in XX_map_ct_bc.txt has "chr" or not

batch_name="run_samples.snATAC.katmai"
case_id=C3L-00416
aliquot_id="CPT0010100001"
dir_resources=/diskmnt/Projects/ccRCC_scratch/ccRCC_snRNA/Resources/
dir_snRNA_processed=${dir_resources}snRNA_Processed_Data/
dir_10xmapping=${dir_snRNA_processed}10Xmapping/
dir_10xmapping_src=${dir_10xmapping}scripts/src/
dir_cellranger=${dir_snRNA_processed}Cell_Ranger/
dir_cellranger_output=${dir_cellranger}outputs/
path_bam=/diskmnt/Projects/ccRCC_scratch/ccRCC_snATAC/Resources/snATAC_Processed_Data/Cell_Ranger/outputs/${aliquot_id}/outs/possorted_bam.bam
dir_10xmapping_output=${dir_10xmapping}outputs/${batch_name}/
mkdir -p ${dir_10xmapping_output}
dir_out=${dir_10xmapping_output}${aliquot_id}/
dir_maf_all=${dir_resources}Bulk_Processed_Data/Somatic_Variants/
path_maf_all=${dir_maf_all}ccrcc.somatic.consensus.gdc.umichigan.wu.112918.maf
path_maf=${dir_out}${aliquot_id}.maf
annotation_run_id="20201224.v1"
dir_annotation_file=${dir_resources}Analysis_Results/mutation/generate_10xmapping_random_annotation_for_snatac_samples/${annotation_run_id}/
path_annotation_file=${dir_annotation_file}${aliquot_id}_snATAC_AfterQC_Barcodes.tsv

mkdir -p ${dir_out}

## get the variant for just one patient
grep ${case_id} ${path_maf_all} > ${path_maf}

nohup bash ${dir_10xmapping_src}mut_map_with_chr.sh ${path_bam} ${path_maf} ${path_annotation_file} ${dir_out} ${aliquot_id} &> ${dir_out}$0.$(date +%Y%m%d%H%M%S).log&
