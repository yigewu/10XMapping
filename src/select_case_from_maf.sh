#!/bin/bash

case_id=$1
path_maf_all=$2
dir_out=$3
path_out=$4

#head -1 ${path_maf_all} > ${dir_out}head.maf

#grep ${case_id} ${path_maf_all} > ${dir_out}case.maf

#cat ${dir_out}head.maf ${dir_out}case.maf > ${path_out}

#rm ${dir_out}case.maf

grep ${case_id} ${path_maf_all} > ${path_out}
