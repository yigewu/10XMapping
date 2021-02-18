# -2019-10-08

# source activate 10xmapping

case_id=C3N-01200
aliquot_id=CPT0075130004_notFACS
dir_10Xmapping=/diskmnt/Projects/ccRCC_scratch/snRNA_Processed_Data/10Xmapping/scripts/src/
path_bam=/diskmnt/Projects/ccRCC_scratch/snRNA_Processed_Data/Cell_Ranger/outputs/${aliquot_id}/outs/possorted_genome_bam.bam
dir_out=/diskmnt/Projects/ccRCC_scratch/snRNA_Processed_Data/10Xmapping/outputs/${aliquot_id}/
path_maf_all=/diskmnt/Projects/ccRCC_scratch/Bulk_Processed_Data/Somatic_Variants/ccrcc.somatic.consensus.gdc.umichigan.wu.112918.maf
path_maf=${dir_out}${aliquot_id}.maf
annotation_run_id="20191010.v1"
path_annotation=/diskmnt/Projects/ccRCC_scratch/analysis_results/mutation/generate_10xmapping_random_annotation/${annotation_run_id}/${aliquot_id}_AfterQC_Barcodes.tsv

mkdir -p ${dir_out}

## get the variant for just one patient
grep ${case_id} ${path_maf_all} > ${path_maf}

nohup bash ${dir_10Xmapping}mut_map.sh ${path_bam} ${path_maf} ${path_annotation} ${dir_out} ${aliquot_id} &> ${dir_out}$0.$(date +%Y%m%d%H%M%S).log&
