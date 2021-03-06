#!/bin/bash
#$ -pe omp 4
#$ -l mem_total=8
#$ -l h_rt=72:00:00
#$ -N dwel-ptsndi2hs-hf20140608-09
#$ -V
#$ -m ae
#$ -t 1-10

CLSPTSFILES=( \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_C_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.428.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_E_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.428.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_N_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.428.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_S_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.428.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_W_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.428.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_C_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.270.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_E_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.270.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_N_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.270.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_S_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.270.txt" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_W_dual_cube_bsfix_pxc_update_atp2_ptcl_points_class_NDI_thresh_0.270.txt" \
)

HSPRJFILES=( \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_C_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_E_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_N_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_S_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140608/HFHD_20140608_dual_points_class_by_ndi/HFHD_20140608_W_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_C_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_E_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_N_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_S_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
"/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hemlock20140609/HFHM_20140609_dual_points_class_by_ndi/HFHM_20140609_W_dual_cube_bsfix_pxc_update_atp2_ptcl_points_NDI_hsp2.img" \
)

PYCMD="/usr3/graduate/zhanli86/Programs/dwel-data-analysis/dwel-data-utils/dwel_points2hsproj.py"

python $PYCMD -i ${CLSPTSFILES[$SGE_TASK_ID-1]} -o ${HSPRJFILES[$SGE_TASK_ID-1]} -p 15 --pixelfunc "mean" -H 1.5 --maxzen=117