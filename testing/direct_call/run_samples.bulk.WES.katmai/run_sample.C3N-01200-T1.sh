# -2019-10-08

# source activate 10xmapping

batch_name="run_samples.bulk.WES.katmai"
case_id=C3N-01200
aliquot_id="C3N-01200-T1"
dir_resources=/diskmnt/Projects/ccRCC_scratch/ccRCC_snRNA/Resources/
dir_snRNA_processed=${dir_resources}snRNA_Processed_Data/
dir_10xmapping=${dir_snRNA_processed}10Xmapping/
dir_10xmapping_src=${dir_10xmapping}scripts/src/
dir_cellranger=${dir_snRNA_processed}Cell_Ranger/
dir_cellranger_output=${dir_cellranger}outputs/
path_bam=/diskmnt/Projects/cptac/GDC_import/data/7ede714a-8cfc-4b71-a2d2-1e78c68ce6cf/0d15156f-e4c5-45a2-8904-33c991c2fd17_gdc_realn.bam
dir_10xmapping_output=${dir_10xmapping}outputs/${batch_name}/
mkdir -p ${dir_10xmapping_output}
dir_out=${dir_10xmapping_output}${aliquot_id}/
dir_maf_all=${dir_resources}Bulk_Processed_Data/Somatic_Variants/
path_maf_all=${dir_maf_all}ccrcc.somatic.consensus.gdc.umichigan.wu.112918.maf
path_maf=${dir_out}${aliquot_id}.maf
annotation_run_id="20200211.v1"
dir_annotation_file=${dir_resources}Analysis_Results/mutation/generate_10xmapping_random_annotation/${annotation_run_id}/
path_annotation_file=${dir_annotation_file}${aliquot_id}_AfterQC_Barcodes.tsv

mkdir -p ${dir_out}

## get the variant for just one patient
grep ${case_id} ${path_maf_all} > ${path_maf}

nohup bash ${dir_10xmapping_src}mut_map.sh ${path_bam} ${path_maf} ${path_annotation_file} ${dir_out} ${aliquot_id} &> ${dir_out}$0.$(date +%Y%m%d%H%M%S).log&
