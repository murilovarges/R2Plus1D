python tools/test_net.py \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/test \
--model_name=r2plus1d --model_depth=34 --gpus=0 \
--clip_length_rgb=32 --num_labels=6 --batch_size=1 \
--db_type=minidb --clip_per_video=6 \
--load_model_path=/home/murilo/PycharmProjects/R2Plus1D/output/kth/finetuning_kinects_2/r2plus1d_9.mdl
