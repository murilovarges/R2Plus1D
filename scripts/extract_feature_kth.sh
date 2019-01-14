python tools/extract_features.py \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/testHough2_dense_stride1 \
--model_name=r2plus1d --model_depth=34 --clip_length_rgb=32 \
--gpus=0 \
--batch_size=6 \
--load_model_path=/home/murilo/PycharmProjects/R2Plus1D/output/kth/finetuning_kinects_hough2/r2plus1d_4.mdl --db_type=minidb \
--output_path=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_hough2_ft/features_testHough2_stride1.pkl \
--features=softmax,label,video_id \
--sanity_check=1 --get_video_id=1 --use_local_file=1 --num_labels=6
