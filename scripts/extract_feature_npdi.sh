python tools/extract_features.py \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/fold1_video_dense \
--model_name=r2plus1d --model_depth=34 --clip_length_rgb=32 \
--gpus=0 \
--batch_size=4 \
--load_model_path=/home/murilo/PycharmProjects/R2Plus1D/output/npdi/split1/r2plus1d_7.mdl --db_type=minidb \
--output_path=/home/murilo/PycharmProjects/R2Plus1D/output/npdi/dense_features/split1_features.pkl \
--features=softmax,label,video_id \
--sanity_check=0 --get_video_id=1 --use_local_file=1 --num_labels=2

