python tools/extract_features.py \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/fold0_dense \
--model_name=r2plus1d --model_depth=34 --clip_length_rgb=32 \
--gpus=0 \
--batch_size=4 \
--load_model_path=/home/murilo/PycharmProjects/R2Plus1D/output/npdi/split1s_rgb_sports1m/r2plus1d_7.mdl --db_type=minidb \
--output_path=/home/murilo/PycharmProjects/R2Plus1D/output/npdi/dense_features_rgb_train_segments/split0_features_teste.pkl \
--features=softmax,label,video_id \
--sanity_check=1 --get_video_id=1 --use_local_file=1 --num_labels=2

