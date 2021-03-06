#!/bin/bash
#$ -pe omp 4
#$ -l mem_total=8
#$ -l h_rt=24:00:00
#$ -N dwel-merge-reg-scans-hfhd20140919
#$ -V
#$ -m ae

INFILES="/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/HFHD_20140919_C_dual_cube_bsfix_pxc_update_atp2_ptcl_points_kmeans_canupo_class.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/HFHD_20140919_E_dual_cube_bsfix_pxc_update_atp2_ptcl_points_kmeans_canupo_class.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/HFHD_20140919_N_dual_cube_bsfix_pxc_update_atp2_ptcl_points_kmeans_canupo_class.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/HFHD_20140919_S_dual_cube_bsfix_pxc_update_atp2_ptcl_points_kmeans_canupo_class.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/HFHD_20140919_W_dual_cube_bsfix_pxc_update_atp2_ptcl_points_kmeans_canupo_class.txt"

TMFILES="/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/tmpdir-single-scan-trkctr/manual_match_trkctr_tm_pts_icp_hfhd20140919_c2c.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/tmpdir-single-scan-trkctr/manual_match_trkctr_tm_pts_icp_hfhd20140919_e2c.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/tmpdir-single-scan-trkctr/manual_match_trkctr_tm_pts_icp_hfhd20140919_n2c.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/tmpdir-single-scan-trkctr/manual_match_trkctr_tm_pts_icp_hfhd20140919_s2c.txt /projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/tmpdir-single-scan-trkctr/manual_match_trkctr_tm_pts_icp_hfhd20140919_w2c.txt"

OUTFILE="/projectnb/echidna/lidar/DWEL_Processing/HF2014/Hardwood20140919/spectral-points-by-union/HFHD_20140919_dual_points-clustering/merging/HFHD_20140919_5aligned_dual_cube_bsfix_pxc_update_atp2_ptcl_points_kmeans_canupo_class.txt"

PYCMD="/usr3/graduate/zhanli86/Programs/dwel-data-analysis/dwel-points-analysis/dwel-point-cloud-registration/transform_points.py"
python $PYCMD -i $INFILES --ptsheader 3 --tmfiles $TMFILES --tmheaderlines 1 -o $OUTFILE
# python $PYCMD -i $INFILES --ptsheader 3 --tmfiles $TMFILES --tmheaderlines 1 -o $OUTFILE --xbbox -25 25 --ybbox -25 25