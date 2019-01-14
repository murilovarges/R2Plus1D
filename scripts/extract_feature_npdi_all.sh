#!/usr/bin/env bash
python tools/extract_features.py \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/foldAll_dense_video \
--model_name=r2plus1d --model_depth=34 --clip_length_rgb=32 \
--gpus=0 \
--batch_size=4 \
--load_model_path=/home/murilo/PycharmProjects/R2Plus1D/models/base/r2.5d_d34_l32_fs_kinects_rgb.pkl --db_type=pickle \
--output_path=/home/murilo/PycharmProjects/R2Plus1D/output/npdi/dense_features_rgb_sports1m_all/splitAll_kinects_features.pkl \
--features=final_avg,video_id \
--get_video_id=1 --use_local_file=1 --num_labels=2


